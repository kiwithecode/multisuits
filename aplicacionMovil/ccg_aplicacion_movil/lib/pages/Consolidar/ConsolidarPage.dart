

import 'package:ccg_aplicacion_movil/components/cards/CustomRenglonCard.dart';
import 'package:ccg_aplicacion_movil/components/cards/CustomProfileInfoCard.dart';
import 'package:ccg_aplicacion_movil/components/customImputField/CustomImputField.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'ConsolidarProvider.dart';
import 'TarjetaPersona.dart';

class ConsolidarPage extends StatelessWidget {
  static const routeName = '/ConsolidarPage';
  const ConsolidarPage({super.key});

  @override
  Widget build(BuildContext context) {
    ConsolidarProvider consolidarProvider = Provider.of<ConsolidarProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Consolidar'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8.0, left: 30, right: 30, bottom: 30),
        child: CustomScrollView(
          slivers: [

            if (consolidarProvider.cedula_ready()) SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(top: 1.0),
                  child: CustomRenglonCard(
                    child: TextButton(
                      onPressed: () {
                        consolidarProvider.reset();
                      },
                      child: Text("ID: ${consolidarProvider.valores["Identificacion"]}"),
                    ),
                  ),
                )
            ) else SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: CustomInputField(
                  labelText: "N° de Cédula/Pasaporte",
                  prefixIcon: Icons.credit_card,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(10),
                    FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                    NumberInputFormatter(),
                  ],
                  onChanged: (value) {
                    // value.length == 10 ? consolidarProvider.get_info_by_cedula(value) : null;
                    value.length == 10 ? consolidarProvider.getPersonaByCED(value) : null;
                    
                  },
                ),
              )
            ),




            const SliverToBoxAdapter(
              child: SizedBox.square(
                dimension: 10,
              )
            ),




            
            SliverToBoxAdapter(
              child: AnimatedOpacity(
                opacity: consolidarProvider.show ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 500),
                child: InkWell(
                  onTap: () {
                    // construye la tarjeta de persona
                    Navigator.pushNamed(context, TarjetaPersona.routeName);
                    // MaterialPageRoute(builder: (context) => TarjetaPersona());
                  },
                  child: CustomProfileInfoCard(
                    nombre: consolidarProvider.valores["Nombres"],
                    apellido: consolidarProvider.valores["Apellidos"],
                    fechaNacimiento: consolidarProvider.valores["Fecha_Nac"],
                    identificacion: consolidarProvider.valores["Identificacion"],
                    estadoCivil: consolidarProvider.valores["EstadoCivil"],
                    celular: consolidarProvider.valores["celular"],
                    correo: consolidarProvider.valores["correo"],
                    direccion: consolidarProvider.valores["direccion"],

                  )
                ),
              ),
            ),




            SliverToBoxAdapter(
              child: AnimatedOpacity(
                opacity: consolidarProvider.show ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 500),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Column(
                        children: [
                          Text("Acepta a Cristo "),
                          Text("por primera vez"),
                        ],
                      ),
                      const SizedBox(width: 10),
                      Switch(
                        value: consolidarProvider.valores["reconciliacion"] ,
                        onChanged: (value) {
                          consolidarProvider.setValor("reconciliacion", value);
                        },
                      ),
                      const SizedBox(width: 10),
                      const Text("Reconciliación"),
                    ],
                  ),
                ),
              ),
            ),



            const SliverToBoxAdapter(
              child: SizedBox.square(
                dimension: 20,
              )
            ),






            SliverToBoxAdapter(
              child: AnimatedOpacity(
                opacity: consolidarProvider.show ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 500),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    
                    children: [
                      const Text("¿Se bautizó el día de hoy?"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Column(
                            children: [
                              Text("No"),
                            ],
                          ),
                          const SizedBox(width: 10),
                          Switch(
                            value: consolidarProvider.valores["esBautizado"] ,
                            onChanged: (value) {
                              consolidarProvider.setValor("esBautizado", value);
                            },
                          ),
                          const SizedBox(width: 10),
                          const Text("Si"),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),




            const SliverToBoxAdapter(
              child: SizedBox.square(
                dimension: 20,
              )
            ),








            SliverToBoxAdapter(
              child: AnimatedOpacity(
                opacity: consolidarProvider.show ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 500),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const Text("¿Asiste a un grupo familiar?"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Column(
                            children: [
                              Text("No"),
                            ],
                          ),
                          const SizedBox(width: 10),
                          Switch(
                            value: consolidarProvider.valores["perteneceGrupoFamiliar"] ,
                            onChanged: (value) {
                              consolidarProvider.setValor("perteneceGrupoFamiliar", value);
                            },
                          ),
                          const SizedBox(width: 10),
                          const Text("Si"),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),


            SliverToBoxAdapter(
              child: AnimatedOpacity(
                opacity: consolidarProvider.show ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 500),
                child: CustomRenglonCard(
                  child: const Center(child: Text("Lider: Juan Pedro")),
                ),
              ),
            ),


            const SliverToBoxAdapter(
              child: SizedBox.square(
                dimension: 20,
              )
            ),


            SliverToBoxAdapter(
              child: AnimatedOpacity(
                opacity: consolidarProvider.show ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 500),
                child: DropdownButton(
                  borderRadius: BorderRadius.circular(20),
                  // TODO: cambiar el borde a bordes redondeados y blancos
                  hint: const Text("Selecciona un lider"),
                  onChanged: (value) => print(value),
                  items: const [
                    DropdownMenuItem(
                      value: "Juan Pedro",
                      child: Text("Juan Pedro"),
                    ),
                    DropdownMenuItem(
                      value: "Pedro Maria",
                      child: Text("Pedro Maria"),
                    ),
                    DropdownMenuItem(
                      value: "Maria Jose",
                      child: Text("Maria Jose"),
                    ),
                    DropdownMenuItem(
                      value: "Jose Juan",
                      child: Text("Jose Juan"),
                    ),
                  ],
                ),
              ),
            ),



            const SliverToBoxAdapter(
              child: SizedBox.square(
                dimension: 20,
              )
            ),






            SliverToBoxAdapter(
              child: AnimatedOpacity(
                opacity: consolidarProvider.show ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 500),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const Text("¿Quieres ser parte del Centro Cristiano de Guayaquil?"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Column(
                            children: [
                              Text("Si"),
                            ],
                          ),
                          const SizedBox(width: 10),
                          Switch(
                            value: consolidarProvider.valores["perteneceGrupoFamiliar"] ,
                            onChanged: (value) {
                              consolidarProvider.setValor("perteneceGrupoFamiliar", value);
                            },
                          ),
                          const SizedBox(width: 10),
                          const Text("No"),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: AnimatedOpacity(
                opacity: consolidarProvider.show ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 500),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomRenglonCard(
                    child: TextButton(
                      onPressed: () {
                        consolidarProvider.reset();
                        Navigator.pop(context);

                      },
                      child: const Text("Consolidar"),
                    ),
                  ),
                ),
              ),
            ),
            // SliverToBoxAdapter(
            //   child: consolidarProvider.show
            //   ? 
            //     Padding(
            //       padding: const EdgeInsets.all(8.0),
            //       child: CustomRenglonCard(
            //         child: TextButton(
            //           onPressed: () => Navigator.pop(context),
            //           child: Text("Consolidar"),
            //         ),
            //       ),
            //     )
            //   : null
            // ),





          ],
        ),
      ),
    );
  }
}

// import 'package:ccg_aplicacion_movil/components/customImputField/customImputField.dart';
// import 'package:ccg_aplicacion_movil/pages/Consolidar/ConsolidarProvider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter/widgets.dart';
// import 'package:provider/provider.dart';

// class ConsolidarPage extends StatelessWidget {
//   static const routeName = '/ConsolidarPage';
//   const ConsolidarPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     ConsolidarProvider consolidarProvider = Provider.of<ConsolidarProvider>(context);
//     final List<String> names = ['Juan Pedro', 'Pedro Maria', 'Maria Jose', 'Jose Juan'];




//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Consolidar'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: CustomScrollView(
//           slivers: [


//             SliverToBoxAdapter(
//               child: consolidarProvider.step >= 0
//               ?
//               Padding(
//                 padding: const EdgeInsets.all(3.0),
//                 child: CustomInputField(
//                   labelText: "N° de Cédula/Pasaporte",
//                   prefixIcon: Icons.credit_card,
//                   keyboardType: TextInputType.number,
//                   onChanged: (value) {
//                     value.length == 10 ? consolidarProvider.next() : null;
//                     print(value.toString());
//                   },
//                 ),
//               )
//               : null,
//             ),

            


            
//             SliverToBoxAdapter(
//               child: consolidarProvider.step >= 1
//               ?
//               Padding(
//                 padding: const EdgeInsets.all(3.0),
//                 child: CustomInputField(
//                   labelText: "Nombres completos",
//                   prefixIcon: Icons.person,
//                   onChanged: (value) {
//                     value.length == 10 ? consolidarProvider.next() : null;
//                     print(value.toString());
//                   },
//                 )
//               )
//               :null
//             ),


            
//             SliverToBoxAdapter(
//               child: consolidarProvider.step >= 2
//               ?
//               Padding(
//                 padding: const EdgeInsets.all(3.0),
//                 child: CustomInputField(
//                   labelText: "Apellidos completos",
//                   prefixIcon: Icons.person,
//                   onChanged: (value) {
//                     value.length == 10 ? consolidarProvider.next() : null;
//                     print(value.toString());
//                   },
//                 )
//               )
//               : null,
//             ),


            
//             SliverToBoxAdapter(
//               child: consolidarProvider.step >= 3
//               ?
//               Padding(
//                 padding: const EdgeInsets.all(3.0),
//                 child: CustomInputField(
//                   labelText: "Correo electrónico",
//                   prefixIcon: Icons.mail,
//                   keyboardType: TextInputType.emailAddress, // Valida el formato de correo electrónico
//                   onChanged: (value) {
//                     value.length == 10 ? consolidarProvider.next() : null;
//                     print(value.toString());
//                   },
//                 )
//                 // child: TextFormField(
//                 //   decoration: const InputDecoration(
//                 //     labelText: "Correo electrónico",
//                 //     border: OutlineInputBorder(),
//                 //     prefixIcon: Icon(Icons.mail),
//                 //   ),
//                 //   keyboardType: TextInputType.emailAddress, // Valida el formato de correo electrónico
//                 //   validator: (value) {
//                 //   },
//                 // ),
//               )
//               :null,
//             ),



//              SliverToBoxAdapter(
//               child: consolidarProvider.step >= 4
//               ?
//               const Padding(
//                 padding: EdgeInsets.all(3.0),
//                 child: DropdownMenu(
//                   // width: double.infinity,
//                   hintText: "Estado civil",
//                   dropdownMenuEntries: [
//                     DropdownMenuEntry(
//                       label: 'Soltero/a.',
//                       value: '',
//                     ),
//                     DropdownMenuEntry(
//                       label: 'Casado/a.',
//                       value: '',
//                     ),
//                     DropdownMenuEntry(
//                       label: 'Divorciado/a',
//                       value: '',
//                     ),
//                     DropdownMenuEntry(
//                       label: 'Viudo/a.',
//                       value: '',
//                     ),
//                     DropdownMenuEntry(
//                       label: 'Unión de hecho.',
//                       value: '',
//                     ),
//                   ],
//                 ),
//               )
//               :null,
//             ),



//             SliverToBoxAdapter(
//               child: consolidarProvider.step >= 5
//               ?
//               Padding(
//                 padding: const EdgeInsets.all(3.0),
//                 child: CustomInputField(
//                   labelText: "Teléfono",
//                   prefixIcon: Icons.phone,
//                   keyboardType: TextInputType.phone, // Valida el formato de teléfono
//                   onChanged: (value) {
//                     value.length == 10 ? consolidarProvider.next() : null;
//                     print(value.toString());
//                   },
//                 )
//               )
//               :null,
//             ),





//             SliverToBoxAdapter(
//               child: consolidarProvider.step >= 6
//               ?
//               Padding(
//                 padding: const EdgeInsets.all(3.0),
//                 child: CustomInputField(
//                   labelText: "Dirección",
//                   prefixIcon: Icons.location_on,
//                   onChanged: (value) {
//                     value.length == 10 ? consolidarProvider.next() : null;
//                     print(value.toString());
//                   },
//                 )
//               )
//               :null,
//             ),




//             SliverToBoxAdapter(
//               child: consolidarProvider.step >= 7
//               ?
//               Padding(
//                 padding: const EdgeInsets.all(3.0),
//                 child: GestureDetector(
//                   onTap: () async {
//                     showDatePicker(
//                       context: context,
//                       initialDate: DateTime.now(),
//                       firstDate: DateTime(1900),
//                       lastDate: DateTime(2100),
//                       // builder: (BuildContext context, Widget? child) {
//                       //   return Theme(
//                       //     data: ThemeData.light().copyWith(
//                       //       colorScheme: ColorScheme.light(
//                       //         primary: Colors.blue,
//                       //       ),
//                       //     ),
//                       //     child: child!,
//                       //   );
//                       // },
//                     ).then((value) => print(value)
//                     );
//                   },
//                   child: AbsorbPointer(
//                     child: CustomInputField(
//                       labelText: "Cumpleaños",
//                       prefixIcon: Icons.cake,
//                       keyboardType: TextInputType.datetime, // Valida el formato de fecha
//                       // controller: TextEditingController(
//                       //   text: "fecha"
//                       //   // text: selectedTime != null
//                       //   //     ? DateFormat('hh:mm a').format(selectedTime)
//                       //   //     : '',
//                       // ),
//                     )
//                   ),
//                 ),
//               )
//               :null,
//             ),


//             SliverToBoxAdapter(
//               child: consolidarProvider.step >= 8
//               ?
//               Padding(
//                 padding: const EdgeInsets.all(3.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Text("Selecciona lo que mejor se adapte a ti"),
//                     Row(
//                       children: [
//                         Expanded(
//                           child: Row(
//                             children: [
//                               Checkbox(
//                                 value: false,
//                                 onChanged: (value) {},
//                               ),
//                               const Text("Reconciliacion"),
//                             ],
//                           )
//                         ),
//                         const SizedBox.square(
//                           dimension: 5,
//                         ),
//                         Expanded(
//                           child: Row(
//                             children: [
//                               Checkbox(
//                                 value: false,
//                                 onChanged: (value) {},
//                               ),
//                               const Text("primera vez"),
//                             ],
//                           )
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               )
//               :null,
//             ),
            


            


//             SliverToBoxAdapter(
//               child: consolidarProvider.step >= 9
//               ?
//               Padding(
//                 padding: const EdgeInsets.all(3.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Text("te bautizaste hoy?"),
//                     Row(
//                       children: [
//                         Expanded(
//                           child: Row(
//                             children: [
//                               Checkbox(
//                                 value: false,
//                                 onChanged: (value) {},
//                               ),
//                               const Text("Si"),
//                             ],
//                           )
//                         ),
//                         const SizedBox.square(
//                           dimension: 5,
//                         ),
//                         Expanded(
//                           child: Row(
//                             children: [
//                               Checkbox(
//                                 value: false,
//                                 onChanged: (value) {},
//                               ),
//                               const Text("No"),
//                             ],
//                           )
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               )
//               :null,
//             ),
            



            


//             SliverToBoxAdapter(
//               child: consolidarProvider.step >= 10
//               ?
//               Padding(
//                 padding: const EdgeInsets.all(3.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Text("Asiste a un grupo familiar?"),
//                     Row(
//                       children: [
//                         Expanded(
//                           child: Row(
//                             children: [
//                               Checkbox(
//                                 value: false,
//                                 onChanged: (value) {},
//                               ),
//                               const Text("Si"),
//                             ],
//                           )
//                         ),
//                         const SizedBox.square(
//                           dimension: 5,
//                         ),
//                         Expanded(
//                           child: Row(
//                             children: [
//                               Checkbox(
//                                 value: false,
//                                 onChanged: (value) {},
//                               ),
//                               const Text("No"),
//                             ],
//                           )
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               )
//               :null,
//             ),




//             SliverToBoxAdapter(
//               child: consolidarProvider.step >= 11
//               ?
//               Padding(
//                 padding: const EdgeInsets.all(3.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Text("quieres ser parte de un grupo?"),
//                     Row(
//                       children: [
//                         Expanded(
//                           child: Row(
//                             children: [
//                               Checkbox(
//                                 value: false,
//                                 onChanged: (value) {},
//                               ),
//                               const Text("Si"),
//                             ],
//                           )
//                         ),
//                         const SizedBox.square(
//                           dimension: 5,
//                         ),
//                         Expanded(
//                           child: Row(
//                             children: [
//                               Checkbox(
//                                 value: false,
//                                 onChanged: (value) {},
//                               ),
//                               const Text("No"),
//                             ],
//                           )
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               )
//               :null,
//             ),
            


//             SliverToBoxAdapter(
//               child: consolidarProvider.step >= 12
//               ?
//               Padding(
//                 padding: const EdgeInsets.all(3.0),
//                 child: Column(
//                   children: [
//                     const Text("Nombre del líder de grupo o pastor", style: TextStyle(fontSize: 20),),
//                     const SizedBox.square(dimension: 20,),
//                     ...names.map((e) => ListTile(
//                       title: Text(e),
//                       onTap: () {
//                         // consolidarProvider.next();
//                         // Provider.of<NameProvider>(context, listen: false)
//                         //     .setSelectedName(names[index]);
//                       },
//                     )).toList(),
//                   ],
//                 )
//               )
//               :null,
//             ),
            

            
//           ],
//         ),
//       ),
//     );
//   }
// }

// // TextFormField(
// //   decoration: const InputDecoration(
// //     labelText: "Nombres completos",
// //     border: OutlineInputBorder(),
// //     prefixIcon: Icon(Icons.person),
// //   ),
// // ),
// // const SizedBox.square(
// //   dimension: 5,
// // ),
// // TextFormField(
// //   decoration: const InputDecoration(
// //     labelText: "Apellidos completos",
// //     border: OutlineInputBorder(),
// //     prefixIcon: Icon(Icons.person),
// //   ),
// // ),