// import 'package:ccg_aplicacion_movil/components/botones/SquareFloatingActionButton%20.dart';
// import 'package:ccg_aplicacion_movil/pages/Consolidar/ConsolidarProvider.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class Consolidacion_Bautizo_hoy extends StatelessWidget {
//   const Consolidacion_Bautizo_hoy({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<ConsolidarProvider>(
//       builder: (context, consolidarProvider, _) {
//         return Center(
//           child: Column(
//             children: [
//               const Text(
//                 "¿Se bautizó el día de hoy?",
//                 style: TextStyle(fontSize: 20),
//               ),
//               const SizedBox.square(dimension: 20),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   SquareFloatingActionButton(
//                     onPressed: () {
//                       consolidarProvider.next();
//                       // TODO: setear el tipo de consolidación
//                     },
//                     textos: const ["Si"],
//                     size: 110,
//                   ),
//                   const SizedBox(width: 20),
//                   SquareFloatingActionButton(
//                     onPressed: () {
//                       consolidarProvider.next();
//                       // TODO: setear el tipo de consolidación
//                     },
//                     textos: const ["No"],
//                     size: 110,
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }




// // class Consolidacion_Bautizo_hoy extends StatelessWidget {
// //   const Consolidacion_Bautizo_hoy({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     ConsolidarProvider consolidarProvider = Provider.of<ConsolidarProvider>(context);
// //     return Center(
// //       child: Column(
// //         children: [
// //           Text("¿Se bautizó el día de hoy?", style: TextStyle(fontSize: 20),),
// //           SizedBox.square(dimension: 20,),
// //           Row(

// //             mainAxisAlignment: MainAxisAlignment.center,
// //             children: [

// //               SquareFloatingActionButton(
// //                 onPressed: () {
// //                   consolidarProvider.next();
// //                   // TODO: setear el tipo de consolidación
// //                 },
// //                 textos: ["Si"],
// //                 size: 110,
              
// //               ),
              
// //               SizedBox(width: 20),
              
// //               SquareFloatingActionButton(
// //                 onPressed: () {
// //                   consolidarProvider.next();
// //                   // TODO: setear el tipo de consolidación
// //                 },
// //                 textos: ["No"],
// //                 size: 110,
              
// //               ),
// //             ],
// //           ),
// //         ],
// //       ),
// //     );







//     // return Column(
//     //   // mainAxisAlignment: MainAxisAlignment.start,
//     //   crossAxisAlignment: CrossAxisAlignment.start,
//     //   children: [
//     //     Text("Seleccione la opción que se adapte a usted:", style: TextStyle(fontSize: 20),),
//     //     SizedBox.square(dimension: 20,),

//     //     ListTile(
//     //       title: Text("Primera vez"),
//     //       leading: Radio(
//     //         value: "Primera vez",
//     //         groupValue: "Reconciliación",
//     //         onChanged: (value) {},
//     //       ),
//     //     ),
        
//     //     ListTile(
//     //       title: Text("Reconciliación"),
//     //       leading: Radio(
//     //         value: "Reconciliación",
//     //         groupValue: "Reconciliación",
//     //         onChanged: (value) {},
//     //       ),
//     //     ),


//     //     // Divider(thickness: 2,),

//     //     SizedBox.square(dimension: 20,),

//     //     Text("¿Se bautizó el día de hoy?", style: TextStyle(fontSize: 20),),
//     //     SizedBox.square(dimension: 20,),

//     //     ListTile(
//     //       title: Text("Si"),
//     //       leading: Radio(
//     //         value: "Si",
//     //         groupValue: "Si",
//     //         onChanged: (value) {},
//     //       ),
//     //     ),

//     //     ListTile(
//     //       title: Text("No"),
//     //       leading: Radio(
//     //         value: "No",
//     //         groupValue: "Si",
//     //         onChanged: (value) {},
//     //       ),
//     //     ),
//     //   ],
//     // );
// //   }
// // }