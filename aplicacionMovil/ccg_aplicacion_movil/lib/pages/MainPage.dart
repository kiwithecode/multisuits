
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/navigations/CustomAppBar.dart';
import '../components/navigations/CustomNavigationBar.dart';
import '../providers/MainNavigationIndexProvider.dart';

class MainPage extends StatelessWidget {
  static const routeName = '/main';
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final mainnavigationindexprovider = Provider.of<MainNavigationIndexProvider>(context);
    return Scaffold(
      appBar: const CustomAppBar(),
      body: mainnavigationindexprovider.pages[mainnavigationindexprovider.current],
      bottomNavigationBar: const CustomNavigationBar(),
    );
  }
}