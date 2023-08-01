// import 'package:ccg_aplicacion_movil/pages/Consolidar/ConsolidarProvider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:provider/provider.dart';

// class Consolidacion_PedirCedula extends StatelessWidget {
//   const Consolidacion_PedirCedula({super.key});

//   @override
//   Widget build(BuildContext context) {
//     ConsolidarProvider consolidarProvider = Provider.of<ConsolidarProvider>(context);
//     return Column(
//       children: [
//         const Text(
//           "Primero necesitaremos tu cédula o pasaporte",
//           style: TextStyle(fontSize: 20),
//         ),
//         const SizedBox.square(
//           dimension: 30,
//         ),
//         TextFormField(
//           decoration: const InputDecoration(
//             labelText: "N° de Cédula/Pasaporte",
//             border: OutlineInputBorder(),
//             prefixIcon: Icon(Icons.credit_card),
//           ),
//           keyboardType: TextInputType.number, // Acepta solo números
//           inputFormatters: [
//             FilteringTextInputFormatter.digitsOnly // Acepta solo dígitos
//           ],
//         ),
//         const SizedBox.square(
//           dimension: 5,
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: FilledButton.icon(
//                 style: ButtonStyle(
//                   backgroundColor:
//                       MaterialStateProperty.all<Color>(Colors.blue),
//                   foregroundColor:
//                       MaterialStateProperty.all<Color>(Colors.white),
//                 ),
//                 icon: const Icon(Icons.arrow_forward),
//                 label: const Text("Continuar"),
//                 // onPressed: details.onStepContinue,
//                 onPressed: () {
//                   consolidarProvider.next();
//                 },
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }