import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String imagen;
  final String titulo;
  final String subtitulo;
  final VoidCallback? onTap;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;
  final Color? cardColor;

  const CustomCard({
    Key? key,
    required this.imagen,
    required this.titulo,
    required this.subtitulo,
    this.onTap,
    this.titleStyle,
    this.subtitleStyle,
    this.cardColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BorderRadius borderRadius = BorderRadius.circular(0);
    return Card(
      color: cardColor,
      child: InkWell(
        borderRadius: borderRadius,
        onTap: onTap,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: borderRadius,
              child: Image.network(
                imagen,
                height: 160,
                width: double.infinity,
                fit: BoxFit.cover,
                loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
              ),
            ),
            CustomListTile(
              title: titulo,
              subtitle: subtitulo,
              titleStyle: titleStyle,
              subtitleStyle: subtitleStyle,
            ),
          ],
        ),
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;

  const CustomListTile({super.key, 
    required this.title,
    required this.subtitle,
    this.titleStyle,
    this.subtitleStyle,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: titleStyle,
      ),
      subtitle: Text(
        subtitle,
        style: subtitleStyle,
      ),
    );
  }
}
