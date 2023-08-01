import 'package:flutter/material.dart';
import '../pages/MenuPage.dart';
import '../views/CampusView.dart';
import '../views/InicioView/InicioView.dart';
import '../views/MensajesView.dart';
import '../views/MusicaView.dart';

class MainNavigationIndexProvider with ChangeNotifier {
  int _current = 0;

  int get current => _current;

  set current(int newIndex) {
    _current = newIndex;
    notifyListeners();
  }

  List<Widget> _pages = [
    const InicioView(),
     MensajesView(),
    const MenuPage(),
    //ConsolidarView(),
    const MusicaView(),
    const CampusView(),
  ];

  List<Widget> get pages => _pages;

  set pages(List<Widget> newPages) {
    _pages = newPages;
    notifyListeners();
  }


}