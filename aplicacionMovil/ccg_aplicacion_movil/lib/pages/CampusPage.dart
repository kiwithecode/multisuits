import 'package:flutter/material.dart';

class CampusPage extends StatelessWidget {
  static const routeName = '/capus';

  const CampusPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nueva página'),
      ),
      body: const Center(
        child: Text('Esta es una nueva página'),
      ),
    );
  }
}


