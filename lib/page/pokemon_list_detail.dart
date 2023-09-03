import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:guven_future/model/hive.dart';
import 'package:guven_future/page/favorite.dart';
import 'package:guven_future/provider/pokemon_list.dart';
import 'package:guven_future/user_interface/helper/color.dart';
import 'package:guven_future/provider/pokemon_list_detail.dart';
import 'package:guven_future/user_interface/helper/image_path.dart';
import 'package:guven_future/user_interface/widget/custom_appbar.dart';
import 'package:guven_future/user_interface/widget/table_dual_row.dart';
import 'package:guven_future/user_interface/style/no_record_found.dart';

class PokemonListDetailPage extends StatefulWidget {
  static String routeName = "PokemonListDetailPage";
  const PokemonListDetailPage({Key? key}) : super(key: key);

  @override
  State<PokemonListDetailPage> createState() => _PokemonListDetailPageState();
}

class _PokemonListDetailPageState extends State<PokemonListDetailPage> {
  late Box box = Hive.box('box');
  final newsListBox = Hive.box<News>('newsList');
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      context.read<PokemonListDetailProvider>().pokemonListDetailModel = null;
      context.read<PokemonListDetailProvider>().pokemonListDetailRequest(
      context,context.read<PokemonListProvider>().pokemonListId ?? 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    var pokemonDetailProvider = Provider.of<PokemonListDetailProvider>(context);

    return Scaffold(
        appBar: CustomAppBar(text:"Pokemon Detail",
          actions: [

          InkWell(
              onTap: () {
                final newsList = News(
                  url: '',
                  urlToImage: box.get("urlToImage") ?? "-",
                  name: pokemonDetailProvider.pokemonListDetailModel?.name ?? "-",
                  width: "${pokemonDetailProvider.pokemonListDetailModel?.weight ?? "-"}",
                  height: "${pokemonDetailProvider.pokemonListDetailModel?.height ?? "-"}",
                );
                newsListBox.add(newsList);
                Navigator.pop(context);
                Navigator.pushNamed(context, FavoritePage.routeName);
              },
              child: const Icon(Icons.favorite_border,size: 30)),
          const SizedBox(width: 15)
        ]),

        body:Column(
          children: [

            Expanded(child: RefreshIndicator(
                color: whiteColor,
                onRefresh: _getData,
                backgroundColor: primaryColor,
                child:pokemonDetailProvider.pokemonListDetailModel?.id != 0

                 ? ListView.builder(
                    itemCount: 1,
                    shrinkWrap: true,
                    controller: scrollController,
                    itemBuilder: offerRecordListDetailDesign)
                  : const NoRecordFound()
               ),
            )
          ],
        )
    );
  }

  Widget offerRecordListDetailDesign(BuildContext context, int index) {

    var pokemonDetailProvider = Provider.of<PokemonListDetailProvider>(context);
    var image = ImageHelper.image[pokemonDetailProvider.pokemonListDetailModel?.name] ?? picacu;

    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child: Image.asset(image,width: 150,height: 150,fit: BoxFit.cover)),
          Divider(height: 30,color: greyColor.withOpacity(0.5)),
          TableDualRow(
              title:"İsim",
              subTitle:pokemonDetailProvider.pokemonListDetailModel?.name ?? "-"),
          TableDualRow(
              title:"Yükseklik",
              subTitle:"${pokemonDetailProvider.pokemonListDetailModel?.height ?? "-"}"),
          TableDualRow(
              title:"Genişlik",
              subTitle:"${pokemonDetailProvider.pokemonListDetailModel?.weight ?? "-"}"),
          TableDualRow(
              title:"Özellik",
              subTitle:pokemonDetailProvider.pokemonListDetailModel?.species?.name ?? "-"),
          TableDualRow(
              title:"Url",
              subTitle:pokemonDetailProvider.pokemonListDetailModel?.species?.url ?? "-"),
        ],
      ),
    );
  }

  Future<void> _getData() async {
    context.read<PokemonListDetailProvider>().pokemonListDetailModel = null;
    context.read<PokemonListDetailProvider>().pokemonListDetailRequest(
    context,context.read<PokemonListProvider>().pokemonListId ?? 1);
  }
}
