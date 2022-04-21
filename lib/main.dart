import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

import 'bindings/main_bindings.dart';
import 'core/theme/app_theme.dart';
import 'routes/app_pages.dart';
import 'routes/app_routes.dart';

void main() {



  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      gestures: const [GestureType.onTap],
      child: GetMaterialApp(
        navigatorKey: GlobalAppKey.navigatorKey,
        theme: appThemeData,
        debugShowCheckedModeBanner: false,
        initialBinding: MainBindings(),
        initialRoute: Routes.MAIN,
        getPages: AppPages.pages,
        defaultTransition: Transition.rightToLeft,
        transitionDuration: const Duration(milliseconds: 100),

      ),
    );
  }
}


class GlobalAppKey {
  static final GlobalKey<NavigatorState> navigatorKey =
  GlobalKey<NavigatorState>();
}