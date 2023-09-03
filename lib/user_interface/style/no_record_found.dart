import 'package:flutter/material.dart';
import 'package:guven_future/user_interface/helper/color.dart';
import 'package:guven_future/user_interface/helper/image_path.dart';

class NoRecordFound extends StatelessWidget {

  final String title;
  static String routeName = "/noRecordFound";

  const NoRecordFound({
    Key? key,
    this.title="Kayıt bulunamadı."}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
                width: 150,
                height: 150,
                alignment: Alignment.bottomCenter,
                child: Image.asset(logo)
            )
          ),

          const SizedBox(height: 15),

          Expanded(child: Container(
                 alignment: Alignment.topCenter,
                 child: Text(
                   title,
                   textAlign: TextAlign.center,
                   style: const TextStyle(fontSize: 18,color: greyColor)
                 )
              )
            ),
         ],
      );
  }
}
