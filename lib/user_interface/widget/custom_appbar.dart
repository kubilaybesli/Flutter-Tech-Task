import 'package:flutter/material.dart';
import 'package:guven_future/user_interface/helper/color.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? text;
  final List<Widget>? actions;
  final IconButton? backButton;
  final PreferredSizeWidget? child;

  const CustomAppBar({
    Key? key,
    this.text,
    this.child,
    this.actions,
    this.backButton }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        AppBar(
          bottom:child,
          elevation: 1,
          actions: actions,
          centerTitle: true,
          leading: backButton,
          backgroundColor: primaryColor,
          iconTheme: const IconThemeData(color: whiteColor,size: 27),

          title: Text(
              text!,
              overflow: TextOverflow.ellipsis,

              style: const TextStyle(
                 fontSize: 21,
                 letterSpacing:1,
                 color: whiteColor,
                 fontFamily: 'primaryFont')),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
