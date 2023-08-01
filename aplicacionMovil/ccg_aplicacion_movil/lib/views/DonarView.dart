
import 'package:flutter/material.dart';

import 'InicioView/tabviews/DonarTabView.dart';

class DonarView extends StatelessWidget {
  const DonarView({super.key});

  @override
  Widget build(BuildContext context) {
    return const DonarTabView();
    // return CustomScrollView(
    //   slivers: [
    //     DonarTabView(),
    //   ],
    // );
  }
}