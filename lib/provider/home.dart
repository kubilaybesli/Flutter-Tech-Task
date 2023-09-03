import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {

  late Widget currentPage;
  late List<Widget> pages;
  int currentTabIndex = 0;

  onTap(int index) {
    currentTabIndex = index;
    currentPage = pages[index];
    notifyListeners();
  }
}