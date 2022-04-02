import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

import '../../controller/auth_controller.dart';
import '../../generated/locale_keys.g.dart';
import '../auth/tour_controller.dart';
import '../widget/shimmer_effect.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthController authCtrl = Get.put(AuthController());
    final TourController tourCtrl = Get.put(TourController());
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
        actions: [
          IconButton(
            onPressed: () => authCtrl.logOut(),
            icon: const Icon(
              Icons.logout,
            ),
          )
        ],
      ),
      body: SizedBox(
        child: Column(
          children: [
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
                        return Container(
                          child: CustomShimmerEffect(child: Text("data")),
                        );

                      default:
                        return Text("data");
                    }
                  } else if (!snapshot.hasData) {
                    return Center(
                      child: Text("${LocaleKeys.connectionState_noData.tr()}"),
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
