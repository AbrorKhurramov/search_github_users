import 'package:get/get.dart';

import '../bindings/main_bindings.dart';
import '../ui/search_page.dart';
import '../ui/user_detail_page/user_detail_page.dart';
import '../ui/users_page/users_page.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: Routes.MAIN, page: () => const SearchPage(), binding: MainBindings()),
    GetPage(name: Routes.USER, page: () => const UsersPage(), binding: MainBindings()),
    GetPage(
      name: Routes.USER_DETAIL,
      page: () => const UserDetailPage(),
      binding: MainBindings(),
    ),

  ];
}
