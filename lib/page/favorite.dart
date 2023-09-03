import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:guven_future/model/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:guven_future/provider/favorite.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:guven_future/user_interface/helper/text.dart';
import 'package:guven_future/user_interface/helper/color.dart';
import 'package:guven_future/user_interface/helper/image_path.dart';
import 'package:guven_future/user_interface/style/box_decoration.dart';
import 'package:guven_future/user_interface/widget/custom_appbar.dart';
import 'package:guven_future/user_interface/style/no_record_found.dart';
import 'package:guven_future/user_interface/widget/table_dual_row.dart';

class FavoritePage extends StatelessWidget {
  static String routeName = "/favoritePage";
  FavoritePage({Key? key}) : super(key: key);

   final newsListBox = Hive.box<News>('newsList');

  removeLastPerson(int index) {
    newsListBox.deleteAt(index);
  }

  @override
  Widget build(BuildContext context) {
    var favoriteProvider = Provider.of<FavoriteProvider>(context);
    favoriteProvider.favoriteCount = newsListBox.length;

    return Scaffold(
      appBar: CustomAppBar(text: favorites,actions: [
        TextButton(
           onPressed: () {},
           child: Text("${favoriteProvider.favoriteCount}  Kayıt   ",
             style: const TextStyle(color: whiteColor,fontSize: 16)
           )
         )
       ],
      ),

         body: newsListBox.length !=0
       ? SingleChildScrollView(
         child: Column(
           mainAxisSize: MainAxisSize.min,
           children: [
            ValueListenableBuilder(
              valueListenable: newsListBox.listenable(),
              builder: (context, Box<News> box, _) {
                return Column(
                  children: [
                    ...List.generate(
                      newsListBox.length,(index) {
                        final news = newsListBox.getAt(index)!;
                        var image = ImageHelper.image[news.name] ?? picacu;
                        return SingleChildScrollView(

                          child: Column(
                            children: [
                              Slidable(
                                key: const ValueKey(6),
                                endActionPane: ActionPane(
                                  motion: const ScrollMotion(),

                                  children: [
                                    SlidableAction(
                                        label: 'Sil',
                                        backgroundColor: redColor,
                                        icon: Icons.delete_outline,
                                        foregroundColor: Colors.white,

                                        onPressed: (ctx) {
                                          removeLastPerson(index);
                                          favoriteProvider.favoriteCounted();
                                          favoriteProvider.favoriteCount = newsListBox.length;
                                        }
                                    ),
                                  ],
                                ),

                                child: Container(
                                  decoration: boxDecoration(),
                                  margin: const EdgeInsets.all(10),
                                  padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 8),

                                  child: Column(
                                    children: [
                                      Center(child: Image.asset(image,width: 150,height: 150,fit: BoxFit.cover)),
                                      Divider(height: 30,color: greyColor.withOpacity(0.5)),
                                      TableDualRow(
                                          title:"İsim",
                                          subTitle:news.name),
                                      TableDualRow(
                                          title:"Yükseklik",
                                          subTitle:news.height),
                                      TableDualRow(
                                          title:"Genişlik",
                                          subTitle:news.width),
                                    ],
                                  ),
                                )
                              ),
                            ],
                          ),
                        );
                      },
                    )
                  ],
                );
              },
            ),
          ],
         ),
       ) : const NoRecordFound()
    );
  }
}
