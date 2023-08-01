// import 'package:flutter/material.dart';

// class Consolidacion_DatosCCG extends StatelessWidget {
//   const Consolidacion_DatosCCG({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Text("Datos CCG"),
//         const SizedBox.square(dimension: 20,),

//         const TextField(
//           decoration: InputDecoration(
//             labelText: "Direccion Domiciliaria",
//             border: OutlineInputBorder(),
//           ),
//         ),

//         const Divider(),


//         ListTile(
//           title: const Text("Asisto a un Grupo"),
//           leading: Radio(
//             value: "Asisto",
//             groupValue: "Asisto",
//             onChanged: (value) {},
//           ),
//         ),

//         ListTile(
//           title: const Text("No asisto a un Grupo"),
//           leading: Radio(
//             value: "no asisto",
//             groupValue: "Asisto",
//             onChanged: (value) {},
//           ),
//         ),


//         Row(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [
            

//             const Text("Lider"),



//             const SizedBox.square(dimension: 10,),

//             SearchAnchor(
              
//               // searchController: SearchController(),
//               builder: (BuildContext context, SearchController controller) {
//                 return IconButton(
//                   icon: const Icon(Icons.search),
//                   onPressed: () {
//                     controller.openView();
//                   },
//                 );
//               },
//               isFullScreen: false,
//               viewBackgroundColor: Colors.black,
//               suggestionsBuilder:
//                   (BuildContext context, SearchController controller) {
//                 return List<ListTile>.generate(5, (int index) {
//                   final String item = 'Lider $index';
//                   return ListTile(
//                     title: Text(item),
//                     onTap: () {
//                       // setState(() {
//                       //   controller.closeView(item);
//                       // });
//                     },
//                   );
//                 });
//               }
//             ),

//           ],
//         ),
//         const Divider(),

//         const Text("Quieres ser parte de CCG?"),

//         Checkbox(
//           value: false,
//           onChanged: (value) {},
        
//         ),

//         const SizedBox.square(dimension: 10,),

//         const Text("Quieres ser parte de un grupo?"),

//         Checkbox(
//           value: false,
//           onChanged: (value) {},
        
//         ),
        
//       ],
//     );
//   }
// }