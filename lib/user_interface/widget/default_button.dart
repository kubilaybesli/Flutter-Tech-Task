import 'package:flutter/material.dart';
import 'package:guven_future/user_interface/helper/color.dart';
import 'package:guven_future/user_interface/helper/responsive.dart';

class DefaultButton extends StatelessWidget {
  final Color? color;
  final String? text;
  final double? width;
  final double? height;
  final double? fontSize;
  final Color? textColor;
  final VoidCallback? onClick;

  const DefaultButton({
    Key? key,
    this.text,
    this.color,
    this.width,
    this.height,
    this.onClick,
    this.fontSize,
    this.textColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return SizedBox(
      width: width,
      height: height,

      child: TextButton(
          onPressed: onClick,

          style: ButtonStyle(
                 elevation:MaterialStateProperty.all(2),
                 backgroundColor: MaterialStateProperty.all(color),
                 foregroundColor: MaterialStateProperty.all(greyColor),
                 textStyle: MaterialStateProperty.all(TextStyle(fontSize: fontSize)),
                 padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 10, horizontal: 10)),
                 ),
          child: Text(
            text!,style: TextStyle(color: textColor,fontFamily: 'primaryFont',fontSize: 15))),
    );
  }
}
