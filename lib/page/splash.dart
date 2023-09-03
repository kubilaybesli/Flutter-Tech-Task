import 'package:flutter/material.dart';
import 'package:guven_future/page/home.dart';
import 'package:guven_future/user_interface/helper/image_path.dart';
import 'package:guven_future/user_interface/helper/responsive.dart';
import 'package:guven_future/user_interface/helper/text.dart';


class SplashPage extends StatefulWidget {

  static String routeName = "splashPage";
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();
    splashDelayed();

  }
// Api Key : 5243e14f8de947ee8ecb287111e28658

  Future<void> splashDelayed() async {
   await Future.delayed(const Duration(seconds: 3));
   Navigator.pushReplacementNamed(context,HomePage.routeName);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 10,
            child: Container(
              alignment: Alignment.center,
              width: SizeConfig.screenWidth * 0.65,
              child: Image.asset(logo),
            ),
          ),

          Expanded(
            flex: 4,
            child: Container(
              margin: const EdgeInsets.all(10),
              alignment: Alignment.bottomCenter,
              child: Text(splashBottom,
                style: TextStyle(
                  fontFamily: 'primaryFont',
                  fontSize: SizeConfig.screenWidth * 0.06),
              ),
            ),
          ),

          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.topCenter,
              child: Text(version,
                style: TextStyle(
                    fontSize: SizeConfig.screenWidth * 0.05),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
