// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../../../pages/Consolidar/ConsolidarProvider.dart';

// class Consolidacion_SeleccionarLider extends StatelessWidget {
//   const Consolidacion_SeleccionarLider({super.key});

//   @override
//   Widget build(BuildContext context) {
//     ConsolidarProvider consolidarProvider = Provider.of<ConsolidarProvider>(context);
//     final List<String> names = ['Juan Pedro', 'Pedro Maria', 'Maria Jose', 'Jose Juan'];
//     return Column(
//       children: [
//         const Text("Nombre del líder de grupo o pastor", style: TextStyle(fontSize: 20),),
//         const SizedBox.square(dimension: 20,),
//         ...names.map((e) => ListTile(
//           title: Text(e),
//           onTap: () {
//             consolidarProvider.next();
//             // Provider.of<NameProvider>(context, listen: false)
//             //     .setSelectedName(names[index]);
//           },
//         )).toList(),
//       ],
//     );
//     // return ListView.builder(
//     //   itemCount: names.length,
//     //   itemBuilder: (BuildContext context, int index) {
//     //     return ListTile(
//     //       title: Text(names[index]),
//     //       onTap: () {
//     //         consolidarProvider.next();
//     //         // Provider.of<NameProvider>(context, listen: false)
//     //         //     .setSelectedName(names[index]);
//     //       },
//     //     );
//     //   },
//     // );
//   }
// }