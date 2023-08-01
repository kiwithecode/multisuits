import 'package:flutter/material.dart';

class CustomImageCard extends StatelessWidget {
  const CustomImageCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        image: DecorationImage(
          image: const NetworkImage('https://picsum.photos/250?image=9'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.5),
            BlendMode.darken,
          ),
        ),
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Título',
            style: TextStyle(
              color: Colors.white,
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.0), // Espacio entre el título y el subtítulo
          Text(
            'Subtítulo',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );

  }
}