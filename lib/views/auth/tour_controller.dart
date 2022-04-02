import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class TourController extends GetxController {
  CollectionReference trips = FirebaseFirestore.instance.collection('trips');
}
