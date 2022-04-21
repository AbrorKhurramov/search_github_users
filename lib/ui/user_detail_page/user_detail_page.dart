import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:search_github_users/controller/main_controller.dart';
import 'package:search_github_users/core/theme/app_colors.dart';
import 'package:search_github_users/core/widgets/modal_progress_hud/modal_progress_hud.dart';
import 'package:search_github_users/ui/user_detail_page/widgets/user_repo_item_widget.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/widgets/my_number_pagination/MyNumberPagination.dart';

class UserDetailPage extends GetView<MainController> {
  const UserDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
        builder: (controller) => ModalProgressHUD(
              inAsyncCall: controller.isLoading,
              child: Scaffold(
                backgroundColor: AppColors.white,
                body: SingleChildScrollView(
                  child: Center(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 50),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(60),
                              child: CachedNetworkImage(
                                imageUrl: controller.userResponse!.avatarUrl,
                                height: 120,
                                width: 120,
                              )),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            if (controller.userResponse!.name != null)
                              Padding(
                                padding: const EdgeInsets.only(top: 26.0),
                                child: Text(
                                  controller.userResponse!.name ?? "",
                                  style: const TextStyle(
                                    fontSize: 24,
                                  ),
                                ),
                              ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: controller.userResponse!.name == null
                                      ? 16
                                      : 6),
                              child: Text(
                                "${controller.userResponse!.login ?? ""} ${controller.userResponse!.company == null ? "" : "/"} ${controller.userResponse!.company ?? ""} ${controller.userResponse!.location == null ? "" : "/"} ${controller.userResponse!.location ?? ""}",
                                style: const TextStyle(
                                    fontSize: 16, color: AppColors.grey),
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.only(top: 6),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.people_outline),
                                    const SizedBox(width: 2),
                                    Text(
                                        "${controller.userResponse!.followers} followers · ${controller.userResponse!.following} following")
                                  ],
                                )),
                          ],
                        ),
                        const SizedBox(height: 30),
                        Center(
                            child: Text(
                              "${controller.repoCount} public repositories",
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            )),
                        const SizedBox(height: 20),

                             Column(
                                children: List.generate(
                                    controller.userRepos.length > 10
                                        ? 10
                                        : controller.userRepos.length,
                                    (index) => UserRepoItemWidget(
                                        onTap: () async {
                                          if (await canLaunch(controller.userRepos[index].htmlUrl)) {
                                            await launch(controller.userRepos[index].htmlUrl);
                                          } else {
                                            throw "Could not launch ${controller.userRepos[index].htmlUrl}";
                                          }
                                        }



                                        ,
                                        name: controller.userRepos[index].name,
                                        description: controller
                                            .userRepos[index].description??"",
                                        watchersCount: controller
                                            .userRepos[index].watchersCount,
                                        starsCount: controller
                                            .userRepos[index].stargazersCount,
                                        forksCount: controller
                                            .userRepos[index].forksCount)),
                              )
,
                        const SizedBox(height: 50),
                        Visibility(
                          visible: controller.repoCount > 10,
                          child: SizedBox(
                            height: 70,
                            child: MyNumberPagination(
                              onPageChanged: (int page) {
                                controller.setRepoPage(page);
                              },
                              threshold: 5,
                              colorPrimary: Colors.blue,
                              colorSub: Colors.white,
                              pageTotal: controller.repoPagesCount,
                            ),
                          ),
                        ),
                        const SizedBox(height: 50),
                      ],
                    ),
                  ),
                ),
              ),
            ));
  }
}

