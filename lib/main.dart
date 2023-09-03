import 'model/hive.dart';
import 'provider/pokemon_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:guven_future/page/splash.dart';
import 'package:guven_future/provider/home.dart';
import 'package:guven_future/provider/favorite.dart';
import 'package:guven_future/user_interface/helper/routes.dart';
import 'package:guven_future/provider/pokemon_list_detail.dart';
import 'package:guven_future/user_interface/theme/main_theme.dart';

Future<void> main() async {
  await Hive.initFlutter();
  await Hive.openBox('box');
  Hive.registerAdapter(NewsAdapter());
  await Hive.openBox<News>('newsList');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ super.key });

  @override
  Widget build(BuildContext context) {

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
      SystemUiOverlay.top,
      SystemUiOverlay.bottom
    ]);

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark));

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeProvider>
          (create: (context) => HomeProvider()),
        ChangeNotifierProvider<FavoriteProvider>
          (create: (context) => FavoriteProvider()),
        ChangeNotifierProvider<PokemonListProvider>
          (create: (context) => PokemonListProvider()),
        ChangeNotifierProvider<PokemonListDetailProvider>
          (create: (context) => PokemonListDetailProvider()),


      ],

      child: MaterialApp(
        routes: routes,
        theme: theme(),
        title: 'Guven Future',
        debugShowCheckedModeBanner: false,
        initialRoute: SplashPage.routeName,
      ),
    );
  }
}

