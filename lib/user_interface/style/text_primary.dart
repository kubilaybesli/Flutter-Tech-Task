import 'package:flutter/material.dart';
import 'package:guven_future/user_interface/helper/color.dart';

TextStyle textStylePrimary(double fontSize) {
  return TextStyle(
        fontSize:fontSize,
        fontFamily: 'primaryFont',
        color: primaryColor.withOpacity(0.8));
}