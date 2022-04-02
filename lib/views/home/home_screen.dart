import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import 'package:travel/controller/screen_controller.dart';
import 'package:travel/views/variables/colors.dart';
import 'package:travel/views/variables/text_style.dart';
import 'package:travel/views/widget/custom_text_field.dart';

import '../../controller/auth_controller.dart';
import '../../generated/locale_keys.g.dart';
import '../../controller/tour_controller.dart';
import '../widget/shimmer_effect.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthController authCtrl = Get.put(AuthController());
    final ScreenController screenCtrl = Get.put(ScreenController());
    final TourController tourCtrl = Get.put(TourController());
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        elevation: 0.0,
        title: Text(
          LocaleKeys.homeScreen_tours.tr(),
          style: titlePrimaryBoldStyle,
        ),
        actions: [
          IconButton(
            onPressed: () => authCtrl.logOut(),
            icon: const Icon(
              Icons.logout,
              color: primaryColor,
            ),
          )
        ],
        bottom: PreferredSize(
          preferredSize: const Size(double.infinity, 50),
          child: CustomTextField(
            prefixIcon: const Icon(Icons.search),
            controller: tourCtrl.searchTextField,
            suffixIcon: tourCtrl.searchTextField.text.isNotEmpty
                ? IconButton(
                    onPressed: () => tourCtrl.clearTextField(),
                    icon: const Icon(Icons.close),
                  )
                : null,
            onChanged: (value) => tourCtrl.searchQuery(),
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  LocaleKeys.homeScreen_domestic.tr(),
                  style: normalBoldStyle,
                ),
                Obx(
                  () => InkWell(
                    onTap: () {
                      screenCtrl.isSeeAllDomestic.value =
                          !screenCtrl.isSeeAllDomestic.value;
                    },
                    child: Row(
                      children: [
                        Text(
                          screenCtrl.isSeeAllDomestic.value
                              ? LocaleKeys.homeScreen_less.tr()
                              : LocaleKeys.homeScreen_seeAll.tr(),
                          style: normalPrimaryRegularStyle,
                        ),
                        Icon(
                          screenCtrl.isSeeAllDomestic.value
                              ? Icons.arrow_upward
                              : Icons.arrow_right_alt,
                          color: primaryColor,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            //<<================================== Domestic Tour
            StreamBuilder<QuerySnapshot>(
                stream: tourCtrl.trips.snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasError) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                        return Center(
                          child: Text(
                            LocaleKeys.connectionState_offline.tr(),
                            style: TextStyle(fontSize: 24, color: Colors.red),
                            textAlign: TextAlign.center,
                          ),
                        );
                      case ConnectionState.waiting:
                        return CustomShimmerEffect(
                          child: SizedBox(
                              height: 280,
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 5,
                                  itemBuilder: (buildContext, index) {
                                    return SizedBox(
                                      width: 240,
                                      child: Card(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: 150,
                                                child: Stack(
                                                  children: [
                                                    SizedBox(
                                                      width: 240,
                                                      height: 130,
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            const BorderRadius
                                                                    .all(
                                                                Radius.circular(
                                                                    10.0)),
                                                        child: Container(
                                                          width: 240,
                                                          height: 130,
                                                          color: grey,
                                                        ),
                                                      ),
                                                    ),
                                                    const Positioned(
                                                      bottom: 0.0,
                                                      right: 0.0,
                                                      child: RawMaterialButton(
                                                        onPressed: null,
                                                        elevation: 5.0,
                                                        fillColor:
                                                            Colors.orange,
                                                        child: Icon(
                                                          Icons.arrow_forward,
                                                          size: 20.0,
                                                          color: whiteColor,
                                                        ),
                                                        shape: CircleBorder(),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                height: 5.0,
                                                width: 30,
                                                decoration: const BoxDecoration(
                                                  color: grey,
                                                ),
                                              ),
                                              Container(
                                                height: 5.0,
                                                width: 60,
                                                decoration: const BoxDecoration(
                                                  color: grey,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10.0,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      const Icon(
                                                        Icons.calendar_month,
                                                        size: 16,
                                                      ),
                                                      Container(
                                                        height: 5.0,
                                                        width: 40,
                                                        decoration:
                                                            const BoxDecoration(
                                                          color: grey,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Container(
                                                        height: 5.0,
                                                        width: 20,
                                                        decoration:
                                                            const BoxDecoration(
                                                          color: grey,
                                                        ),
                                                      ),
                                                      Container(
                                                        height: 5.0,
                                                        width: 30,
                                                        decoration:
                                                            const BoxDecoration(
                                                          color: grey,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  })),
                        );

                      default:
                        tourCtrl.domesticTourList.value = snapshot.data!.docs
                            .where((element) => element["isDomestic"] == true)
                            .toList();
                        tourCtrl.searchQuery();
                        return Obx(
                          () => screenCtrl.isSeeAllDomestic.value
                              ? Wrap(
                                  children: tourCtrl.domesticTourListWithSearch
                                      .map((tourDettails) {
                                    return SizedBox(
                                      width: 170,
                                      height: 290,
                                      child: Card(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: 150,
                                                child: Stack(
                                                  children: [
                                                    SizedBox(
                                                      width: 240,
                                                      height: 130,
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            const BorderRadius
                                                                    .all(
                                                                Radius.circular(
                                                                    10.0)),
                                                        child: SizedBox(
                                                          width: 240,
                                                          height: 130,
                                                          child: Image.network(
                                                            tourDettails[
                                                                "coverPhoto"][1],
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Positioned(
                                                      bottom: 0.0,
                                                      right: 0.0,
                                                      child: RawMaterialButton(
                                                        onPressed: () {},
                                                        elevation: 5.0,
                                                        fillColor:
                                                            Colors.orange,
                                                        child: const Icon(
                                                          Icons.arrow_forward,
                                                          size: 20.0,
                                                          color: whiteColor,
                                                        ),
                                                        shape:
                                                            const CircleBorder(),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Text(
                                                tourDettails["title"],
                                                style: smallBoldStyle,
                                              ),
                                              Text(
                                                tourDettails["shortDetails"],
                                                style:
                                                    smallOffWhiteRegularStyle,
                                              ),
                                              const SizedBox(
                                                height: 10.0,
                                              ),
                                              Row(
                                                children: [
                                                  const Icon(
                                                    Icons.calendar_month,
                                                    size: 16,
                                                  ),
                                                  Text(
                                                    DateFormat('dd/MM/yy')
                                                        .format(tourDettails[
                                                                "start"]
                                                            .toDate()),
                                                    style:
                                                        extraSmallRegularStyle,
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    "${tourDettails["currency"]} ${tourDettails["price"]}",
                                                    style:
                                                        extraSmallRegularStyle,
                                                  ),
                                                  Text(
                                                    " / ${tourDettails["duration"]} ${LocaleKeys.homeScreen_day.tr()}",
                                                    style:
                                                        extraSmallRegularStyle,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                )
                              : SizedBox(
                                  height: 280,
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemCount: tourCtrl
                                          .domesticTourListWithSearch.length,
                                      itemBuilder: (buildContext, index) {
                                        QueryDocumentSnapshot<Object?>
                                            tourDettails =
                                            tourCtrl.domesticTourListWithSearch[
                                                index];
                                        return SizedBox(
                                          width: 240,
                                          child: Card(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    height: 150,
                                                    child: Stack(
                                                      children: [
                                                        SizedBox(
                                                          width: 240,
                                                          height: 130,
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                const BorderRadius
                                                                        .all(
                                                                    Radius.circular(
                                                                        10.0)),
                                                            child: SizedBox(
                                                              width: 240,
                                                              height: 130,
                                                              child:
                                                                  Image.network(
                                                                tourDettails[
                                                                    "coverPhoto"][1],
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Positioned(
                                                          bottom: 0.0,
                                                          right: 0.0,
                                                          child:
                                                              RawMaterialButton(
                                                            onPressed: () {},
                                                            elevation: 5.0,
                                                            fillColor:
                                                                Colors.orange,
                                                            child: const Icon(
                                                              Icons
                                                                  .arrow_forward,
                                                              size: 20.0,
                                                              color: whiteColor,
                                                            ),
                                                            shape:
                                                                const CircleBorder(),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  Text(
                                                    tourDettails["title"],
                                                    style: smallBoldStyle,
                                                  ),
                                                  Text(
                                                    tourDettails[
                                                        "shortDetails"],
                                                    style:
                                                        smallOffWhiteRegularStyle,
                                                  ),
                                                  const SizedBox(
                                                    height: 10.0,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          const Icon(
                                                            Icons
                                                                .calendar_month,
                                                            size: 16,
                                                          ),
                                                          Text(
                                                            DateFormat(
                                                                    'dd/MM/yy')
                                                                .format(tourDettails[
                                                                        "start"]
                                                                    .toDate()),
                                                            style:
                                                                extraSmallRegularStyle,
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          Text(
                                                            "${tourDettails["currency"]} ${tourDettails["price"]}",
                                                            style:
                                                                extraSmallRegularStyle,
                                                          ),
                                                          Text(
                                                            " / ${tourDettails["duration"]} ${LocaleKeys.homeScreen_day.tr()}",
                                                            style:
                                                                extraSmallRegularStyle,
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                ),
                        );
                    }
                  } else if (!snapshot.hasData) {
                    return Center(
                      child: Text(
                        LocaleKeys.connectionState_noData.tr(),
                      ),
                    );
                  } else {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  }
                }),
            const SizedBox(
              height: 20,
            ),
//<================================================================================== International
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  LocaleKeys.homeScreen_international.tr(),
                  style: normalBoldStyle,
                ),
                Obx(
                  () => InkWell(
                    onTap: () {
                      screenCtrl.isSeeAllInternational.value =
                          !screenCtrl.isSeeAllInternational.value;
                    },
                    child: Row(
                      children: [
                        Text(
                          screenCtrl.isSeeAllInternational.value
                              ? LocaleKeys.homeScreen_less.tr()
                              : LocaleKeys.homeScreen_seeAll.tr(),
                          style: normalPrimaryRegularStyle,
                        ),
                        Icon(
                          screenCtrl.isSeeAllInternational.value
                              ? Icons.arrow_upward
                              : Icons.arrow_right_alt,
                          color: primaryColor,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            StreamBuilder<QuerySnapshot>(
                stream: tourCtrl.trips.snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasError) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                        return Center(
                          child: Text(
                            LocaleKeys.connectionState_offline.tr(),
                            style: TextStyle(fontSize: 24, color: Colors.red),
                            textAlign: TextAlign.center,
                          ),
                        );
                      case ConnectionState.waiting:
                        return CustomShimmerEffect(
                          child: SizedBox(
                              height: 280,
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 5,
                                  itemBuilder: (buildContext, index) {
                                    return SizedBox(
                                      width: 240,
                                      child: Card(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: 150,
                                                child: Stack(
                                                  children: [
                                                    SizedBox(
                                                      width: 240,
                                                      height: 130,
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            const BorderRadius
                                                                    .all(
                                                                Radius.circular(
                                                                    10.0)),
                                                        child: Container(
                                                          width: 240,
                                                          height: 130,
                                                          color: grey,
                                                        ),
                                                      ),
                                                    ),
                                                    const Positioned(
                                                      bottom: 0.0,
                                                      right: 0.0,
                                                      child: RawMaterialButton(
                                                        onPressed: null,
                                                        elevation: 5.0,
                                                        fillColor:
                                                            Colors.orange,
                                                        child: Icon(
                                                          Icons.arrow_forward,
                                                          size: 20.0,
                                                          color: whiteColor,
                                                        ),
                                                        shape: CircleBorder(),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                height: 5.0,
                                                width: 30,
                                                decoration: const BoxDecoration(
                                                  color: grey,
                                                ),
                                              ),
                                              Container(
                                                height: 5.0,
                                                width: 60,
                                                decoration: const BoxDecoration(
                                                  color: grey,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10.0,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      const Icon(
                                                        Icons.calendar_month,
                                                        size: 16,
                                                      ),
                                                      Container(
                                                        height: 5.0,
                                                        width: 40,
                                                        decoration:
                                                            const BoxDecoration(
                                                          color: grey,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Container(
                                                        height: 5.0,
                                                        width: 20,
                                                        decoration:
                                                            const BoxDecoration(
                                                          color: grey,
                                                        ),
                                                      ),
                                                      Container(
                                                        height: 5.0,
                                                        width: 30,
                                                        decoration:
                                                            const BoxDecoration(
                                                          color: grey,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  })),
                        );

                      default:
                        tourCtrl.internationalTourList.value = snapshot
                            .data!.docs
                            .where((element) => element["isDomestic"] == false)
                            .toList();
                        // tourCtrl.update();
                        WidgetsBinding.instance!.addPostFrameCallback(
                            (_) => tourCtrl.searchQuery());
                        return Obx(
                          () => screenCtrl.isSeeAllInternational.value
                              ? Wrap(
                                  children: tourCtrl.internationalTourList
                                      .map((tourDettails) {
                                    return SizedBox(
                                      width: 170,
                                      height: 290,
                                      child: Card(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: 150,
                                                child: Stack(
                                                  children: [
                                                    SizedBox(
                                                      width: 240,
                                                      height: 130,
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            const BorderRadius
                                                                    .all(
                                                                Radius.circular(
                                                                    10.0)),
                                                        child: SizedBox(
                                                          width: 240,
                                                          height: 130,
                                                          child: Image.network(
                                                            tourDettails[
                                                                "coverPhoto"][1],
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Positioned(
                                                      bottom: 0.0,
                                                      right: 0.0,
                                                      child: RawMaterialButton(
                                                        onPressed: () {},
                                                        elevation: 5.0,
                                                        fillColor:
                                                            Colors.orange,
                                                        child: const Icon(
                                                          Icons.arrow_forward,
                                                          size: 20.0,
                                                          color: whiteColor,
                                                        ),
                                                        shape:
                                                            const CircleBorder(),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Text(
                                                tourDettails["title"],
                                                style: smallBoldStyle,
                                              ),
                                              Text(
                                                tourDettails["shortDetails"],
                                                style:
                                                    smallOffWhiteRegularStyle,
                                              ),
                                              const SizedBox(
                                                height: 10.0,
                                              ),
                                              Row(
                                                children: [
                                                  const Icon(
                                                    Icons.calendar_month,
                                                    size: 16,
                                                  ),
                                                  Text(
                                                    DateFormat('dd/MM/yy')
                                                        .format(tourDettails[
                                                                "start"]
                                                            .toDate()),
                                                    style:
                                                        extraSmallRegularStyle,
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    "${tourDettails["currency"]} ${tourDettails["price"]}",
                                                    style:
                                                        extraSmallRegularStyle,
                                                  ),
                                                  Text(
                                                    " / ${tourDettails["duration"]} ${LocaleKeys.homeScreen_day.tr()}",
                                                    style:
                                                        extraSmallRegularStyle,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                )
                              : SizedBox(
                                  height: 280,
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemCount: tourCtrl
                                          .internationalTourListWithSearch
                                          .length,
                                      itemBuilder: (buildContext, index) {
                                        QueryDocumentSnapshot<
                                            Object?> tourDettails = tourCtrl
                                                .internationalTourListWithSearch[
                                            index];
                                        return Container(
                                          width: 240,
                                          child: Card(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    height: 150,
                                                    child: Stack(
                                                      children: [
                                                        SizedBox(
                                                          width: 240,
                                                          height: 130,
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                const BorderRadius
                                                                        .all(
                                                                    Radius.circular(
                                                                        10.0)),
                                                            child: SizedBox(
                                                              width: 240,
                                                              height: 130,
                                                              child:
                                                                  Image.network(
                                                                tourDettails[
                                                                    "coverPhoto"][1],
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Positioned(
                                                          bottom: 0.0,
                                                          right: 0.0,
                                                          child:
                                                              RawMaterialButton(
                                                            onPressed: () {},
                                                            elevation: 5.0,
                                                            fillColor:
                                                                Colors.orange,
                                                            child: const Icon(
                                                              Icons
                                                                  .arrow_forward,
                                                              size: 20.0,
                                                              color: whiteColor,
                                                            ),
                                                            shape:
                                                                const CircleBorder(),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  Text(
                                                    tourDettails["title"],
                                                    style: smallBoldStyle,
                                                  ),
                                                  Text(
                                                    tourDettails[
                                                        "shortDetails"],
                                                    style:
                                                        smallOffWhiteRegularStyle,
                                                  ),
                                                  const SizedBox(
                                                    height: 10.0,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          const Icon(
                                                            Icons
                                                                .calendar_month,
                                                            size: 16,
                                                          ),
                                                          Text(
                                                            DateFormat(
                                                                    'dd/MM/yy')
                                                                .format(tourDettails[
                                                                        "start"]
                                                                    .toDate()),
                                                            style:
                                                                extraSmallRegularStyle,
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          Text(
                                                            "${tourDettails["currency"]} ${tourDettails["price"]}",
                                                            style:
                                                                extraSmallRegularStyle,
                                                          ),
                                                          Text(
                                                            " / ${tourDettails["duration"]} ${LocaleKeys.homeScreen_day.tr()}",
                                                            style:
                                                                extraSmallRegularStyle,
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                ),
                        );
                    }
                  } else if (!snapshot.hasData) {
                    return Center(
                      child: Text(
                        LocaleKeys.connectionState_noData.tr(),
                      ),
                    );
                  } else {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  }
                }),
          ],
        ),
      ),
    );
  }
}
