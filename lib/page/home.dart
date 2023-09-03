import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:guven_future/page/favorite.dart';
import 'package:guven_future/provider/home.dart';
import 'package:guven_future/page/pokemon_list.dart';
import 'package:guven_future/user_interface/helper/text.dart';
import 'package:guven_future/user_interface/helper/color.dart';


class HomePage extends StatefulWidget {

  static String routeName = "/homePage";
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {


  late PokemonListPage pokemonListPage;
  late FavoritePage favoritePage;

  @override
  void initState() {
    super.initState();

    var homeProvider = Provider.of<HomeProvider>(context,listen: false);

    pokemonListPage = const PokemonListPage();
    favoritePage =  FavoritePage();


    homeProvider.pages = [
      pokemonListPage,
     favoritePage
    ];

    homeProvider.currentPage = pokemonListPage;

  }

  @override
  Widget build(BuildContext context) {

    var homeProvider = Provider.of<HomeProvider>(context);

    return Scaffold(

      bottomNavigationBar: BottomNavigationBar(
        iconSize: 25,
        backgroundColor: whiteColor,
        unselectedItemColor: greyColor,
        selectedItemColor: primaryColor.withOpacity(0.8),

        onTap: (index) {
        homeProvider.onTap(index); },
        currentIndex: homeProvider.currentTabIndex,
        type: BottomNavigationBarType.fixed,

        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              activeIcon: Icon(Icons.games,size: 27),
              icon: Icon(Icons.games_outlined), label:poke),

          BottomNavigationBarItem(
              activeIcon: Icon(Icons.favorite,size: 27),
              icon: Icon(Icons.favorite_border_outlined), label:favorite),
        ],
      ),
      body:homeProvider.currentPage,
    );
  }
}