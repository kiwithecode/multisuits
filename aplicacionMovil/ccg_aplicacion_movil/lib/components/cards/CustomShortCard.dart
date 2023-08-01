import 'package:flutter/material.dart';

class CustomShortCard extends StatelessWidget {
  final imagen;
  final titulo;
  final subtitulo;

  const CustomShortCard({
    Key? key,
    required this.imagen,
    required this.titulo,
    required this.subtitulo,
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            leading: Image.network(
              imagen,
              fit: BoxFit.cover,
              width: 90,
            ),
            title: Text(titulo),
            subtitle: Text(subtitulo),
          ),
        ],
      ),
    );
  }
}