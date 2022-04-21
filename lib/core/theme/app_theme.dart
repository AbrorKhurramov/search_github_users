import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_colors.dart';

final ThemeData appThemeData = ThemeData(
  primaryColor: Colors.white,
  accentColor: AppColors.assets,
  appBarTheme: AppBarTheme(
    color: Colors.white,
    iconTheme: IconThemeData(color: Colors.black),
    elevation: 0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
  ),
  scaffoldBackgroundColor: AppColors.background,

  // fontFamily: 'Georgia',
  textTheme: TextTheme(
    headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
  ),
);
