import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TourController extends GetxController {
  TextEditingController searchTextField = TextEditingController();
  CollectionReference trips = FirebaseFirestore.instance.collection('trips');
  //<====================================== Domestic Tour List
  RxList<QueryDocumentSnapshot<Object?>> domesticTourList =
      List<QueryDocumentSnapshot<Object?>>.empty(growable: true).obs;
  RxList<QueryDocumentSnapshot<Object?>> domesticTourListWithSearch =
      List<QueryDocumentSnapshot<Object?>>.empty(growable: true).obs;
  //<====================================== International Tour List
  RxList<QueryDocumentSnapshot<Object?>> internationalTourList =
      List<QueryDocumentSnapshot<Object?>>.empty(growable: true).obs;
  RxList<QueryDocumentSnapshot<Object?>> internationalTourListWithSearch =
      List<QueryDocumentSnapshot<Object?>>.empty(growable: true).obs;

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  //<=========================== Search Query
  void searchQuery() {
    //<================== Domestic Search
    domesticTourListWithSearch.value = domesticTourList
        .where(
          (tour) =>
              tour["title"].toLowerCase().contains(
                    searchTextField.text.trim().toLowerCase(),
                  ) ||
              tour["price"].toString().toLowerCase().contains(
                    searchTextField.text.trim().toLowerCase(),
                  ) ||
              tour["destination"].toLowerCase().contains(
                    searchTextField.text.trim().toLowerCase(),
                  ) ||
              tour["duration"].toString().toLowerCase().contains(
                    searchTextField.text.trim().toLowerCase(),
                  ) ||
              tour["shortDetails"].toLowerCase().contains(
                    searchTextField.text.trim().toLowerCase(),
                  ) ||
              tour["start"].toString().toLowerCase().contains(
                    searchTextField.text.trim().toLowerCase(),
                  ),
        )
        .toList();

//<============= International Search
    internationalTourListWithSearch.value = internationalTourList
        .where(
          (tour) =>
              tour["title"].toLowerCase().contains(
                    searchTextField.text.trim().toLowerCase(),
                  ) ||
              tour["price"].toString().toLowerCase().contains(
                    searchTextField.text.trim().toLowerCase(),
                  ) ||
              tour["destination"].toLowerCase().contains(
                    searchTextField.text.trim().toLowerCase(),
                  ) ||
              tour["duration"].toString().toLowerCase().contains(
                    searchTextField.text.trim().toLowerCase(),
                  ) ||
              tour["shortDetails"].toLowerCase().contains(
                    searchTextField.text.trim().toLowerCase(),
                  ) ||
              tour["start"].toString().toLowerCase().contains(
                    searchTextField.text.trim().toLowerCase(),
                  ),
        )
        .toList();

    // update();
  }

  //<=========================== Clear TextField
  void clearTextField() {
    searchTextField.clear();
    searchQuery();
    update();
  }
}
