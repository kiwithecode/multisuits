// import 'package:ccg_aplicacion_movil/components/botones/SquareFloatingActionButton%20.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../../../pages/Consolidar/ConsolidarProvider.dart';

// class Consolidacion_QuieresSerParteGrupoFamiliar extends StatelessWidget {
//   const Consolidacion_QuieresSerParteGrupoFamiliar({super.key});

//   @override
//   Widget build(BuildContext context) {
//     ConsolidarProvider consolidarProvider = Provider.of<ConsolidarProvider>(context);
//     return Center(
//       child: Column(
//         children: [
//           const Text("¿Quieres ser parte de un grupo familiar en el Centro Cristiano de Guayaquil?", style: TextStyle(fontSize: 20),),
//           const SizedBox.square(dimension: 20,),
//           const Text("(grupo semanal en el cual se habla de la palabra del Señor)"),
//           const SizedBox.square(dimension: 20,),
//           Row(

//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [

//               SquareFloatingActionButton(
//                 onPressed: () {
//                   consolidarProvider.next();
//                   // TODO: setear el tipo de consolidación
//                 },
//                 textos: const ["Si"],
//                 size: 110,
              
//               ),
              
//               const SizedBox(width: 20),
              
//               SquareFloatingActionButton(
//                 onPressed: () {
//                   consolidarProvider.next();
//                   // TODO: setear el tipo de consolidación
//                 },
//                 textos: const ["No"],
//                 size: 110,
              
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }