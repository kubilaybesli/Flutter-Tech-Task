import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:guven_future/enum/paging_limit.dart';
import 'package:guven_future/provider/pokemon_list.dart';
import 'package:guven_future/page/pokemon_list_detail.dart';
import 'package:guven_future/user_interface/case/case.dart';
import 'package:guven_future/user_interface/helper/text.dart';
import 'package:guven_future/user_interface/helper/color.dart';
import 'package:guven_future/user_interface/helper/image_path.dart';
import 'package:guven_future/user_interface/style/text_primary.dart';
import 'package:guven_future/user_interface/style/text_secondary.dart';
import 'package:guven_future/user_interface/widget/custom_appbar.dart';

class PokemonListPage extends StatefulWidget {
  static String routeName = "PokemonListPage";
  const PokemonListPage({Key? key}) : super(key: key);

  @override
  State<PokemonListPage> createState() => _PokemonListPageState();
}

class _PokemonListPageState extends State<PokemonListPage> {
  late Box box = Hive.box('box');
  ScrollController scrollController = ScrollController();
  TextEditingController searchController = TextEditingController();


  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      context.read<PokemonListProvider>().pageNo = 0;
      scrollController.addListener(() { scrollControl(); });
      context.read<PokemonListProvider>().pokemonListModel.results = null;
      context.read<PokemonListProvider>().pokemonListRequest(offset: 10, limit: pagingLimitCase(PagingLimitEnum.ten));
    });
  }

  scrollControl() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {

        context.read<PokemonListProvider>().pageNumbered();
        context.read<PokemonListProvider>().pokemonListRequest(
        offset: context.read<PokemonListProvider>().pageNo,
        limit: pagingLimitCase(PagingLimitEnum.ten));
    }
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose(); }

  @override
  Widget build(BuildContext context) {
    var pokemonListProvider = Provider.of<PokemonListProvider>(context);

    return Scaffold(
        appBar: const CustomAppBar(text: appName),

       body: Column(children: [

          Expanded(
            child: RefreshIndicator(
                color: whiteColor,
                onRefresh: _getData,
                backgroundColor: primaryColor,
                child: pokemonListProvider.pokemonListModel.results?.isNotEmpty == true

              ? ListView.builder(
                shrinkWrap: true,
                controller: scrollController,
                itemBuilder:processRecordFormListDesign,
                itemCount: pokemonListProvider.pokemonListModel.results?.length ?? 0)

              : const Center(child: CircularProgressIndicator(color: primaryColor))
            ),
          ),
        ])
    );
  }

  Widget processRecordFormListDesign(BuildContext context, int index) {
    var pokemonListProvider = Provider.of<PokemonListProvider>(context);
    var image = ImageHelper.image[pokemonListProvider.pokemonListModel.results?[index].name] ?? picacu;

    return Column(
      children: [
        ListTile(
          trailing: const Icon(Icons.navigate_next,size: 25),
          leading: Image.asset(image,width: 50,height: 50,fit: BoxFit.contain),
          contentPadding: const EdgeInsets.symmetric(vertical: 3,horizontal: 10),
          title: Text(pokemonListProvider.pokemonListModel.results?[index].name ?? "",style: textStylePrimary(16),),
          subtitle: Text(pokemonListProvider.pokemonListModel.results?[index].url ?? "",style: textStyleSecondary(13),),
          onTap: () {
            String url = pokemonListProvider.pokemonListModel.results?[index].url ?? "";
            List<String> parts = url.split("/");
            int? id =  int.parse(parts[6].toString());
            pokemonListProvider.pokemonListId = id;
            Navigator.pushNamed(context,PokemonListDetailPage.routeName);
          },
        ),
        Divider(height: 0,color: greyColor.withOpacity(0.5))
      ],
    );
  }

  Future<void> _getData() async {
    context.read<PokemonListProvider>().pokemonListModel.results = null;
    context.read<PokemonListProvider>().pokemonListRequest(offset: 10, limit: pagingLimitCase(PagingLimitEnum.ten));
  }
}
