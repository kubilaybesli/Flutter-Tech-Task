import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:guven_future/user_interface/helper/color.dart';
import 'package:guven_future/user_interface/helper/responsive.dart';


class RoundedInputField extends StatelessWidget {
  final int maxLine;
  final Color? icons;
  final double? width;
  final double margin;
  final double? radius;
  final double? height;
  final IconData? icon;
  final double? iconSize;
  final double? fontSize;
  final String? hintText;
  final bool obscureText;
  final double borderWidth;
  final double iconLocation;
  final IconData? suffixIcon;
  final double? subFixIconSize;
  final TextInputType? inputType;
  final String obscuringCharacter;
  final GestureTapCallback? suffixClick;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;
  final TextInputFormatter textInputFormatter;

  const RoundedInputField({
    Key? key,
    this.icon,
    this.width,
    this.maxLine=1,
    this.hintText,
    this.radius=1,
    this.margin=2,
    this.height=50,
    this.onChanged,
    this.controller,
    this.suffixIcon,
    this.suffixClick,
    this.fontSize=16,
    this.iconSize=25,
    this.icons=greyColor,
    this.borderWidth=0.3,
    this.iconLocation = 0,
    this.obscureText=false,
    this.subFixIconSize = 25,
    this.obscuringCharacter="*",
    this.inputType=TextInputType.text,
    required this.textInputFormatter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Container(
      width: width,
      height: height,
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(vertical: margin),
      padding: const EdgeInsets.symmetric(horizontal: 15),

      decoration: BoxDecoration(
        color: whiteColor,
        border: Border.all(
            color: greyColor,
            width: borderWidth,
            style: BorderStyle.solid),
        borderRadius: BorderRadius.circular(radius!)),

      child: Form(
        autovalidateMode: AutovalidateMode.always,

        child: TextFormField(
          maxLines: maxLine,
          onChanged: onChanged,
          controller:controller,
          keyboardType: inputType,
          obscureText: obscureText,
          cursorColor:primaryColor,
          textAlign: TextAlign.left,
          inputFormatters: [textInputFormatter],
          obscuringCharacter: obscuringCharacter,
          autovalidateMode: AutovalidateMode.always,
          style: TextStyle(fontFamily: 'secondaryFont',fontSize:fontSize),

          decoration: InputDecoration(
            hoverColor: greyColor,
            icon: Padding(
              padding: EdgeInsets.only(bottom: iconLocation),
              child: Icon(icon, size: iconSize,color:greyColor),
            ),

            suffixIcon: GestureDetector(
              onTap:suffixClick,
              child: Icon(suffixIcon,color: icons,size: subFixIconSize)),

            hintText: hintText,
            fillColor: greyColor,
            border: InputBorder.none,
            hintStyle: TextStyle(fontFamily: 'secondaryFont',fontSize:fontSize),
          ),
        ),
      ),
    );
  }
}
