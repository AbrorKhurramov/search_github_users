import 'package:get/get.dart';

abstract class BaseController extends GetxController {
  bool isLoading = false;

  void setLoading(bool value) {
    isLoading = value;
    update();
  }

  void showError(String message) {

  }
}
