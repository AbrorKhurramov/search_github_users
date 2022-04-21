import 'package:get/get.dart';
import 'package:search_github_users/controller/main_controller.dart';
import 'package:search_github_users/data/provider/api_client.dart';
import 'package:search_github_users/data/repository/main_repository.dart';

class MainBindings extends Bindings {

  @override
  void dependencies() {
Get.lazyPut(() => MainController(mainRepository: MainRepository(apiClient: ApiClient.getInstance())));
  }
}