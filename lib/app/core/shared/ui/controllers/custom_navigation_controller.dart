import 'package:flutter/material.dart';

class CustomNavigationController extends ValueNotifier<int> {
  CustomNavigationController(super.value);
  PageController? pageController = PageController(initialPage: 0, keepPage: true);

  int get selectedIndex => value;

  void changePage(int index) {
    pageController!.jumpToPage(index);
    value = index;
  }
}
