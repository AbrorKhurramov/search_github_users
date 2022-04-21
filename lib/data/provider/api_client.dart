import 'package:alice/alice.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:search_github_users/data/models/user_model.dart';
import 'package:search_github_users/data/models/user_repos_model.dart';
import 'package:search_github_users/data/models/users_model.dart';

import '../../core/constants/constants.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class ApiClient {
  static Alice alice = Alice(
    showNotification: true,
    showInspectorOnShake: false,
    darkTheme: false,
  );

  static get getDio {
    Dio dio = Dio(BaseOptions(followRedirects: false));

    ///Alice chuck interceptor
     dio.interceptors.add(alice.getDioInterceptor());
    dio.interceptors.add(
        LogInterceptor(responseBody: true, requestBody: true, request: true));
    return dio;
  }

  static CancelToken cancelToken = CancelToken();

  static ApiClient? _apiClient;

  static ApiClient getInstance({String baseUrl = Constants.baseUrl}) {
    if (_apiClient != null) {
      return _apiClient!;
    } else {
      _apiClient = ApiClient(getDio, cancelToken, baseUrl);
      return _apiClient!;
    }
  }

  factory ApiClient(Dio dio, CancelToken cancelToken, String baseUrl) {
    dio.options = BaseOptions(receiveTimeout: 30000, connectTimeout: 30000);
    return _ApiClient(dio, baseUrl: baseUrl);
  }

  @GET("search/users")
  Future<UsersResponse> getUsers(
      @Query('q') String userName,
      @Query('per_page') int limit,
      @Query('page') int page,
      );
  @GET("users/{user_name}")
  Future<UserResponse> getUser(
      @Path('user_name') String userName,
      );
  @GET("users/{user_name}/repos")
  Future<List<UserReposResponse>> getUserRepos(
      @Path('user_name') String userName,
      @Query('per_page') int limit,
      @Query('page') int page,
      );


}
