import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:search_github_users/controller/main_controller.dart';
import 'package:search_github_users/core/theme/app_colors.dart';
import 'package:search_github_users/ui/users_page/widgets/user_item_widget.dart';

import '../../core/widgets/modal_progress_hud/modal_progress_hud.dart';
import '../../core/widgets/my_number_pagination/MyNumberPagination.dart';
import '../user_detail_page/user_detail_page.dart';

class UsersPage extends GetView<MainController> {
  const UsersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      builder: (controller) => ModalProgressHUD(
        inAsyncCall: controller.isLoading,
        child: Scaffold(
          backgroundColor: AppColors.white,
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 50),
                Center(
                    child: Text(
                  "${controller.count} users found",
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                )),
                const SizedBox(height: 20),
                Column(
                  children: List.generate(
                      controller.count > 10
                          ? 10
                          : controller.users.length,
                      (index) => UserItemWidget(
                          onTap: () async {
                            controller.setUserIndex(index);
                            await controller.getUser(index);
                            await controller.getUserRepos();
                            Get.toNamed("/user_detail");
                          },
                          imageUrl: controller.users[index].avatarUrl,
                          name: controller.users[index].login)),
                ),
                const SizedBox(height: 50),
                Visibility(
                  visible: controller.count > 10,
                  child: SizedBox(
                    height: 70,
                    child: MyNumberPagination(
                      onPageChanged: (int page) {
                        controller.setPage(page);
                      },
                      threshold: 5,
                      colorPrimary: Colors.blue,
                      colorSub: Colors.white,
                      pageTotal: controller.pagesCount,
                    ),
                  ),
                ),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
