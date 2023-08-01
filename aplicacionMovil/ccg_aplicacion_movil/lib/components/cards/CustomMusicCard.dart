import 'package:flutter/material.dart';
class CustomMusicCard extends StatelessWidget {
  const CustomMusicCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 2),
          ),
        ],
        image: const DecorationImage(
          image: NetworkImage('https://picsum.photos/250?image=9'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(0),
            decoration: BoxDecoration(
              // borderRadius: BorderRadius.only(
              //   bottomLeft: Radius.circular(10.0),
              //   bottomRight: Radius.circular(10.0),
              // ),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0),
                  Colors.black.withOpacity(0.6),
                ],
              ),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.music_note, color: Colors.white, size: 20.0),
                    SizedBox(width: 5.0),
                    Text(
                      'Título de cancion',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.album, color: Colors.white, size: 18.0),
                    SizedBox(width: 5.0),
                    Text(
                      'single',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
