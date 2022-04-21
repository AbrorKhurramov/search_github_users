

import 'package:dio/dio.dart';
import 'package:search_github_users/base/base_repository.dart';

import '../provider/api_client.dart';
import '../provider/server_error.dart';

class MainRepository extends BaseRepository{
  ApiClient? apiClient;
  MainRepository({required this.apiClient}) : assert(apiClient != null);


  Future<dynamic> getUsers(String userName,int limit,int page) async {
    dynamic response;
    try {
      response = await apiClient!.getUsers(userName, limit, page);
    } catch (error, stacktrace) {
      print("Exception occurred: $error stacktrace: $stacktrace");
      response = ServerError.withError(error: error as DioError);
    }
    return response;

  }
  Future<dynamic> getUser(String userName) async {
    dynamic response;
    try {
      response = await apiClient!.getUser(userName);
    } catch (error, stacktrace) {
      print("Exception occurred: $error stacktrace: $stacktrace");
      response = ServerError.withError(error: error as DioError);
    }
    return response;

  }
  Future<dynamic> getUserRepos(String userName,int limit,int page) async {
    dynamic response;
    try {
      response = await apiClient!.getUserRepos(userName, limit, page);
    } catch (error, stacktrace) {
      print("Exception occurred: $error stacktrace: $stacktrace");
      response = ServerError.withError(error: error as DioError);
    }
    return response;

  }
}