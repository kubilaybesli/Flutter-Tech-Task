import 'package:flutter/material.dart';
import 'package:guven_future/user_interface/helper/color.dart';


ThemeData theme() {
  return ThemeData(
    fontFamily: "primaryFont",
    scaffoldBackgroundColor: Colors.grey.shade50,

    textTheme: const TextTheme(
        bodyLarge: TextStyle(color: greyColor,fontSize: 15),
        bodyMedium: TextStyle(color: greyColor,fontSize: 15),
        titleSmall: TextStyle(color: greyColor,fontSize: 15),
        labelLarge:  TextStyle(color: greyColor,fontSize: 15),
        titleMedium: TextStyle(color: greyColor,fontSize: 15),
    ),

    primaryColor: primaryColor,
    appBarTheme: appBarTheme(),
    unselectedWidgetColor: greyColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

AppBarTheme appBarTheme() {

  return const AppBarTheme(
    elevation: 0,
    color: whiteColor,
    iconTheme: IconThemeData(color: whiteColor),
  );
}