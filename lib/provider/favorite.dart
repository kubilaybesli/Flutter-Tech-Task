import 'package:flutter/material.dart';

class FavoriteProvider extends ChangeNotifier {
  int favoriteCount = 0;

  favoriteCounted() {
    favoriteCount = 0;
    notifyListeners();
  }
}