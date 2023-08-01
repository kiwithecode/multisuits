import 'package:flutter/material.dart';

class CustomRenglonCard extends StatelessWidget {
  Widget child;
  CustomRenglonCard({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.light(),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        shadowColor: Colors.white,
        elevation: 10,
        color: Colors.white,
        child: SizedBox(
          height: 50,
          width: double.infinity,
          child: child,
        ),
      ),
    );
  }
}