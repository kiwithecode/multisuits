
import 'package:flutter/material.dart';

import '../../../components/cards/CustomImageCard.dart';

class CursosTabView extends StatelessWidget {
  const CursosTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          const CustomImageCard(),
          const CustomImageCard(),
          const CustomImageCard(),
          const CustomImageCard(),
          const CustomImageCard(),
          const CustomImageCard(),
        ],
      ),
    );
  }
}