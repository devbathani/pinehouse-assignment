import 'package:flutter/material.dart';
import 'package:pinehouse_assignment/presentation/screen-1/screen1.dart';
import 'package:pinehouse_assignment/presentation/screen-2/screen2.dart';

class BaseScreenProvider extends ChangeNotifier {
  int selectedIndex = 0;

   onItemTapped(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  List<Widget> screens = <Widget>[
    const Screen1(),
    const Screen2(),
  ];
}
