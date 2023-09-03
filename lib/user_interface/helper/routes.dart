import 'package:flutter/cupertino.dart';
import 'package:guven_future/page/home.dart';
import 'package:guven_future/page/splash.dart';
import 'package:guven_future/page/favorite.dart';
import 'package:guven_future/page/pokemon_list.dart';
import 'package:guven_future/page/pokemon_list_detail.dart';

final Map<String, WidgetBuilder> routes = {

  HomePage.routeName: (context) => const HomePage(),
  FavoritePage.routeName: (context) => FavoritePage(),
  SplashPage.routeName: (context) => const SplashPage(),
  PokemonListPage.routeName: (context) => const PokemonListPage(),
  PokemonListDetailPage.routeName: (context) => const PokemonListDetailPage(),
};