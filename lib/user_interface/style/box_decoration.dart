import 'package:flutter/material.dart';
import 'package:guven_future/user_interface/helper/color.dart';

BoxDecoration boxDecoration({double width=0.2,double? radius=15,Color color = whiteColor}) {
  return BoxDecoration(
    color: color,
    border: Border.all(
        width: width,
        color: greyColor,
        style: BorderStyle.solid),
    borderRadius: BorderRadius.circular(radius!),
  );
}