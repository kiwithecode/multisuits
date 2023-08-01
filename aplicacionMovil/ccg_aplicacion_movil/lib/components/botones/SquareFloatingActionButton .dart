import 'package:flutter/material.dart';

class SquareFloatingActionButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData? icono;
  final Color textColor;
  final Color? color;
  final double size;
  final List<String> textos;

  SquareFloatingActionButton({super.key, 
    required this.onPressed,
    this.icono,
    this.color = Colors.blue,
    Color? textColor,
    double? size,
    List<String>? textos,
  })  : textColor = textColor ?? Colors.white,
        size = size ?? 100,
        textos = textos ?? [];

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 6.0,
      constraints: BoxConstraints(
        minWidth: size,
        minHeight: size,
        maxHeight: size,
        maxWidth: size,
      ),
      fillColor: Colors.blue,
      onPressed: onPressed,
      padding: const EdgeInsets.all(16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icono != null) Icon(icono, color: color),
          if (icono != null) const SizedBox.square(dimension: 10),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Column(
              children: textos.map((texto) => Text(
                texto,
                style: TextStyle(color: textColor),
              )).toList(),
            ),
          ),
        ],
      ),
    );
  }
}


// import 'package:flutter/material.dart';

// class SquareFloatingActionButton extends StatelessWidget {
//   final VoidCallback onPressed;
//   final String texto1;
//   final String texto2;
//   final String texto3;
//   final String texto4;
//   final IconData? icono;
//   final Color textColor;
//   final Color? color;
//   final double size;

//   SquareFloatingActionButton({
//     required this.onPressed,
//     required this.texto,
//     this.icono,
//     this.color = Colors.blue,
//     Color? textColor,
//     double? size,
//   })  : textColor = textColor ?? Colors.white,
//         size = size ?? 100;

//   @override
//   Widget build(BuildContext context) {
//     return RawMaterialButton(
//       elevation: 6.0,
//       constraints: BoxConstraints(
//         minWidth: size,
//         minHeight: size,
//         maxHeight: size,
//         maxWidth: size,
//       ),
//       fillColor: Colors.blue,
//       onPressed: onPressed,
//       padding: EdgeInsets.all(16.0),
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(20.0),
//       ),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           if (icono != null) Icon(icono, color: color),
//           if (icono != null) SizedBox.square(dimension: 10),
//           FittedBox(
//             fit: BoxFit.scaleDown,
//             child: Column(
//               children: [
//                 Text(
//                   texto1,
//                   style: TextStyle(color: textColor),
//                 ),
//                 Text(
//                   texto2,
//                   style: TextStyle(color: textColor),
//                 ),
//                 Text(
//                   texto3,
//                   style: TextStyle(color: textColor),
//                 ),
//                 Text(
//                   texto4,
//                   style: TextStyle(color: textColor),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
