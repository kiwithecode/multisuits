// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:provider/provider.dart';

// import '../../../pages/Consolidar/ConsolidarProvider.dart';

// class Consolidacion_DatosPersonales extends StatelessWidget {
//   const Consolidacion_DatosPersonales({super.key});

//   @override
//   Widget build(BuildContext context) {
//     ConsolidarProvider consolidarProvider = Provider.of<ConsolidarProvider>(context);
//     return Column(
//       children: [
//         const Text(
//           "Datos Personales",
//           style: TextStyle(fontSize: 20),
//         ),
//         const SizedBox.square(
//           dimension: 30,
//         ),
//         TextFormField(
//           decoration: const InputDecoration(
//             labelText: "Nombres completos",
//             border: OutlineInputBorder(),
//             prefixIcon: Icon(Icons.person),
//           ),
//         ),
//         const SizedBox.square(
//           dimension: 5,
//         ),
//         TextFormField(
//           decoration: const InputDecoration(
//             labelText: "Apellidos completos",
//             border: OutlineInputBorder(),
//             prefixIcon: Icon(Icons.person),
//           ),
//         ),
//         const SizedBox.square(
//           dimension: 5,
//         ),
//         // TextFormField(
//         //   decoration: const InputDecoration(
//         //     labelText: "N° de Cédula/Pasaporte",
//         //     border: OutlineInputBorder(),
//         //     prefixIcon: Icon(Icons.credit_card),
//         //   ),
//         //   keyboardType: TextInputType.number, // Acepta solo números
//         //   inputFormatters: [
//         //     FilteringTextInputFormatter.digitsOnly // Acepta solo dígitos
//         //   ],
//         // ),
//         // const SizedBox.square(
//         //   dimension: 5,
//         // ),





//         const SizedBox.square(
//           dimension: 5,
//         ),
//         TextFormField(
//           decoration: const InputDecoration(
//             labelText: "Correo electrónico",
//             border: OutlineInputBorder(),
//             prefixIcon: Icon(Icons.mail),
//           ),
//           keyboardType: TextInputType.emailAddress, // Valida el formato de correo electrónico
//           validator: (value) {
//             if (value!.isEmpty) {
//               return 'Por favor ingresa un correo electrónico';
//             } else if (!_validateEmail(value)) {
//               return 'Por favor ingresa un correo electrónico válido';
//             }
//             return null;
//           },
//         ),


        
//         const DropdownMenu(
//           hintText: "Estado civil",
//           dropdownMenuEntries: [
//             DropdownMenuEntry(
//               label: 'Soltero/a.',
//               value: '',
//             ),
//             DropdownMenuEntry(
//               label: 'Casado/a.',
//               value: '',
//             ),
//             DropdownMenuEntry(
//               label: 'Divorciado/a',
//               value: '',
//             ),
//             DropdownMenuEntry(
//               label: 'Viudo/a.',
//               value: '',
//             ),
//             DropdownMenuEntry(
//               label: 'Unión de hecho.',
//               value: '',
//             ),
//           ],
//         ),




//         const SizedBox.square(
//           dimension: 5,
//         ),
//         TextFormField(
//           decoration: const InputDecoration(
//             labelText: "Número telefónico",
//             border: OutlineInputBorder(),
//             prefixIcon: Icon(Icons.phone_android),
//           ),
//           keyboardType: TextInputType.phone, // Acepta solo números y símbolos de teléfono
//           inputFormatters: [
//             FilteringTextInputFormatter.digitsOnly // Acepta solo dígitos
//           ],
//         ),
//         OutlinedButton(
//           onPressed: () {
//             showDatePicker(
//               context: context,
//               initialDate: DateTime.now(),
//               firstDate: DateTime(1900),
//               lastDate: DateTime.now(),
//             );
//           },
//           child: const Text('Fecha de nacimiento'),
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

//   // bool _isValidEmail(String email) {
//   //   RegExp emailRegExp = RegExp(r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$');
//   //   return emailRegExp.hasMatch(email);
//   // }
//   bool _validateEmail(String email) {
//   if (email.isEmpty) {
//     return false;
//   } else {
//     RegExp emailRegExp = RegExp(r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$');
//     return emailRegExp.hasMatch(email);
//   }
// }

// }

// // class Consolidacion_DatosPersonales extends StatelessWidget {
// //   const Consolidacion_DatosPersonales({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     ConsolidarProvider consolidarProvider = Provider.of<ConsolidarProvider>(context);
// //     return Column(
// //       children: [
// //         Text("Datos Personales", style: TextStyle(fontSize: 20),),
// //         SizedBox.square(dimension: 30,),
// //         TextField(
// //           decoration: InputDecoration(
// //             labelText: "Nombres completos",
// //             border: OutlineInputBorder(),
// //             prefixIcon: Icon(Icons.person),
// //           ),
// //         ),
// //         SizedBox.square(dimension: 5,),
// //         TextField(
// //           decoration: InputDecoration(
// //             labelText: "Apellidos completos",
// //             border: OutlineInputBorder(),
// //             prefixIcon: Icon(Icons.person),
// //           ),
// //         ),
// //         SizedBox.square(dimension: 5,),
// //         TextField(
// //           decoration: InputDecoration(
// //             labelText: "N° de Cédula/Pasaporte",
// //             border: OutlineInputBorder(),
// //             prefixIcon: Icon(Icons.credit_card),
// //           ),
// //         ),
// //         SizedBox.square(dimension: 5,),
// //         Row(
// //           children: [
// //             Flexible(
// //               child:TextField(
// //                 decoration: InputDecoration(
// //                   labelText: "Edad",
// //                   border: OutlineInputBorder(),
// //                   prefixIcon: Icon(Icons.calendar_today),
// //                 ),
// //               ),
// //             ),
// //             SizedBox.square(dimension: 5,),
// //             DropdownMenu(
// //               hintText: "Estado civil",
// //               dropdownMenuEntries: [
// //                 DropdownMenuEntry(
// //                   label: 'Soltero/a.',
// //                   value: '',
// //                 ),
// //                 DropdownMenuEntry(
// //                   label: 'Casado/a.',
// //                   value: '',
// //                 ),
// //                 DropdownMenuEntry(
// //                   label: 'Divorciado/a',
// //                   value: '',
// //                 ),
// //                 DropdownMenuEntry(
// //                   label: 'Viudo/a.',
// //                   value: '',
// //                 ),
// //                 DropdownMenuEntry(
// //                   label: 'Unión de hecho.',
// //                   value: '',
// //                 ),
// //               ],
// //             )

// //           ],
// //         ),
// //         SizedBox.square(dimension: 5,),
// //         TextField(
// //           decoration: InputDecoration(
// //             labelText: "Correo electrónico",
// //             border: OutlineInputBorder(),
// //             prefixIcon: Icon(Icons.mail),
// //           ),
// //         ),
// //         SizedBox.square(dimension: 5,),
// //         TextField(
// //           decoration: InputDecoration(
// //             labelText: "Número telefónico",
// //             border: OutlineInputBorder(),
// //             prefixIcon: Icon(Icons.phone_android),
// //           ),
// //         ),
// //         Row(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: <Widget>[
// //             Padding(
// //               padding: const EdgeInsets.all(8.0),
// //               child: FilledButton.icon(
// //                 style: ButtonStyle(
// //                   backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
// //                   foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
// //                 ),
// //                 icon: Icon(Icons.arrow_forward),
// //                 label: Text("Continuar"),
// //                 // onPressed: details.onStepContinue,
// //                 onPressed: () {
// //                   consolidarProvider.next();
// //                 },
// //               ),
// //             ),
// //           ],
// //         ),
// //       ],
// //     );
// //   }

// //   // Widget build(BuildContext context) {
// //   //   return Column(
// //   //     children: [
// //   //       Text("Datos Personales"),
// //   //       SizedBox.square(dimension: 30,),


// //   //       Row(
// //   //         children: [
// //   //           Flexible(
// //   //             child: TextField(
// //   //               decoration: InputDecoration(
// //   //                 labelText: "Tipo iDE",
// //   //                 border: OutlineInputBorder(),
// //   //               ),
// //   //             ),
// //   //           ),
// //   //           SizedBox.square(dimension: 10,),
// //   //           Flexible(
// //   //             child: TextField(
// //   //               decoration: InputDecoration(
// //   //                 labelText: "IDE",
// //   //                 border: OutlineInputBorder(),
// //   //               ),
// //   //             ),
// //   //           ),

// //   //         ],
// //   //       ),

// //   //       SizedBox.square(dimension: 10,),



// //   //       TextField(
// //   //         decoration: InputDecoration(
// //   //           labelText: "Nombre",
// //   //           border: OutlineInputBorder(),
// //   //         ),
// //   //       ),

// //   //       SizedBox.square(dimension: 10,),


// //   //       TextField(
// //   //         decoration: InputDecoration(
// //   //           labelText: "Apellido",
// //   //           border: OutlineInputBorder(),
// //   //         ),
// //   //       ),

// //   //       SizedBox.square(dimension: 10,),


// //   //       Row(
// //   //         children: [
// //   //           Flexible(
// //   //             child: TextField(
// //   //               decoration: InputDecoration(
// //   //                 labelText: "Estado civil",
// //   //                 border: OutlineInputBorder(),
// //   //               ),
// //   //             ),
// //   //           ),
// //   //           SizedBox.square(dimension: 10,),
// //   //           Flexible(
// //   //             child: TextField(
// //   //               decoration: InputDecoration(
// //   //                 labelText: "Genero",
// //   //                 border: OutlineInputBorder(),
// //   //               ),
// //   //             ),
// //   //           ),

// //   //         ],
// //   //       ),

// //   //       SizedBox.square(dimension: 10,),


// //   //       TextField(
// //   //         decoration: InputDecoration(
// //   //           labelText: "fecha de nacimiento",
// //   //           border: OutlineInputBorder(),
// //   //         ),
// //   //       ),



// //   //     ],
// //   //   );

// //   // }
// // }