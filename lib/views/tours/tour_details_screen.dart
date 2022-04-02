import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:travel/views/variables/colors.dart';

import '../variables/text_style.dart';

class TourDetailsScreen extends StatelessWidget {
  final QueryDocumentSnapshot<Object?> tourDetails;
  const TourDetailsScreen({Key? key, required this.tourDetails})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SizedBox(
        height: _height,
        width: _width,
        child: Stack(
          children: [
            SizedBox(
              height: 280,
              width: _width,
              child: Image.network(
                tourDetails["coverPhoto"][0],
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 250.0,
              left: 0.0,
              child: Container(
                height: _height - 250,
                width: _width,
                decoration: const BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    )),
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.calendar_month,
                          size: 16,
                        ),
                        Text(
                          " ${DateFormat('dd/MM/yy').format(tourDetails["start"].toDate())} - ${DateFormat('dd/MM/yy').format(tourDetails["end"].toDate())}",
                          style: smallBoldStyle,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      tourDetails["title"],
                      style: titleBoldStyle,
                    ),
                    Text(
                      tourDetails["destination"],
                      style: normalOffwhiteColorBoldStyle,
                    ),
                    const Divider(
                      color: grey,
                    ),
                    Text(
                      tourDetails["shortDetails"],
                      style: smallRegularStyle,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
