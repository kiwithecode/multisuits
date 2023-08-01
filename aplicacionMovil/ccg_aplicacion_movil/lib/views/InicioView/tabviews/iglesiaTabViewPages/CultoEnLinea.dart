// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';

// class CultoEnLinea extends StatefulWidget {
//   final routeName = '/culto-en-linea';
//   const CultoEnLinea({Key? key}) : super(key: key);

//   @override
//   _CultoEnLineaState createState() => _CultoEnLineaState();
// }

// class _CultoEnLineaState extends State<CultoEnLinea> {
//   late VideoPlayerController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.network(
//         'https://res.cloudinary.com/doneqqziy/video/upload/v1686254163/media_library_export-testingdeveloper-2023_06_08_14_48_20/346848537_1733369613751735_2685483865346103641_n_mj1p5a.mp4')
//       ..initialize().then((_) {
//         setState(() {});
//       });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Container(
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                 image: NetworkImage(
//                     'https://res.cloudinary.com/doneqqziy/image/upload/v1686254163/media_library_export-testingdeveloper-2023_06_08_14_48_20/346848537_1733369613751735_2685483865346103641_n_mj1p5a.jpg'),
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           Center(
//             child: Card(
//               child: AspectRatio(
//                 aspectRatio: _controller.value.aspectRatio,
//                 //child: VideoPlayer(_controller),
//               ),
//             ),
//           ),
//           Positioned(
//             top: 40,
//             right: 20,
//             child: IconButton(
//               icon: Icon(Icons.close, color: Colors.white),
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//             ),
//           ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           setState(() {
//             _controller.value.isPlaying
//                 ? _controller.pause()
//                 : _controller.play();
//           });
//         },
//         child: Icon(
//           _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _controller.dispose();
//   }
// }
