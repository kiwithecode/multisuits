import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import '../../providers/MainNavigationIndexProvider.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final mainnavigationindexprovider = Provider.of<MainNavigationIndexProvider>(context);
    
    return CurvedNavigationBar(
      index: mainnavigationindexprovider.current,
      height: 60.0,
      items: const <Widget>[
        Icon(Icons.home, size: 30, semanticLabel: "inicio"),
        Icon(Icons.podcasts, size: 30),
        ImageIcon(
          NetworkImage('https://www.ccgye.org/wp-content/uploads/2022/01/CCG-black.png'),
          color: Colors.white,
          size: 40,
        ),
        Icon(Icons.my_library_music, size: 30),
        Icon(Icons.map, size: 30),
      ],
      color: const Color.fromARGB(255, 0, 0, 0),
      
      backgroundColor: Colors.transparent   ,
      animationCurve: Curves.easeInExpo,
      animationDuration: const Duration(milliseconds: 100),
      onTap: (index) {
        mainnavigationindexprovider.current = index;
      },
    );
  }
}
