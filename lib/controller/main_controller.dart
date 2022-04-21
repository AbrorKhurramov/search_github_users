import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:search_github_users/base/base_controller.dart';
import 'package:search_github_users/data/models/user_model.dart';
import 'package:search_github_users/data/repository/main_repository.dart';
import 'package:search_github_users/ui/users_page/users_page.dart';

import '../data/models/user_repos_model.dart';
import '../data/models/users_model.dart';

class MainController extends BaseController {
  int page = 1;
  int repoPage = 1;
int userIndex=0;
  int pagesCount = 0;
  int repoPagesCount = 0;
  UserResponse? userResponse;

  List<UserItem> users = [];
  List<UserReposResponse> userRepos = [];
  int count = 0;
  int repoCount = 0;
  final MainRepository mainRepository;

  MainController({
    required this.mainRepository,
  });

  setPage(int page) {
    this.page = page;
    getUsersList();
    update();
  }
  setUserIndex(int index) {
    userIndex = index;
    update();
  }
  setRepoPage(int page) {
    repoPage = page;
    getUserRepos();
    update();
  }

  TextEditingController userNameController = TextEditingController();

  getUsersList() async {
    setLoading(true);
    final response =
        await mainRepository.getUsers(userNameController.text, 10, page);
    setLoading(false);

    if (response is UsersResponse) {
      users = response.items;
      count = response.totalCount;

      pagesCount = (count * 0.1).toInt() + 1;

      Get.to(() => const UsersPage());
    }
  }

  getUser(int index) async {
    setLoading(true);
    final response = await mainRepository.getUser(users[index].login);
    setLoading(false);
    if (response is UserResponse) {
      userResponse = response;
      repoCount = response.publicRepos;

      repoPagesCount = repoCount>10?(repoCount * 0.1).toInt() + 1 : 1;
    }
  }

  getUserRepos() async {
    setLoading(true);
    final response =
    await mainRepository.getUserRepos(users[userIndex].login, 10, repoPage);
    setLoading(false);
    if(response is List<UserReposResponse>){
      userRepos = response;
    }

  }
}
