import 'package:get/get.dart' hide Trans;

import '../views/variables/colors.dart';

class ApiErrorHandleService {
  handleStatusCodeError(String status) {
    Get.snackbar(
      "Error",
      status,
      backgroundColor: redColor,
    );
  }
}
