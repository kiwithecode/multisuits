import 'package:ccg_aplicacion_movil/components/cards/CustomProfileInfoCard.dart';
import 'package:ccg_aplicacion_movil/components/cards/CustomRenglonCard.dart';
import 'package:ccg_aplicacion_movil/components/customImputField/CustomImputField.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'ConsolidarProvider.dart';

class TarjetaPersona extends StatelessWidget {
  static const routeName = "/TarjetaPersona";
  TarjetaPersona({super.key});

    final TextEditingController _nombrecontroller = TextEditingController();
    final TextEditingController _apellidoscontroller = TextEditingController();
    final TextEditingController _celularcontroller = TextEditingController();
    final TextEditingController _fecha_Naccontroller = TextEditingController();
    final TextEditingController _correocontroller = TextEditingController();
    final TextEditingController _direccioncontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ConsolidarProvider consolidarProvider = Provider.of<ConsolidarProvider>(context);
    _nombrecontroller.text = consolidarProvider.valores["Nombres"]==""?"":consolidarProvider.valores["Nombres"];
    _apellidoscontroller.text = consolidarProvider.valores["Apellidos"]==""?"":consolidarProvider.valores["Apellidos"];
    _celularcontroller.text = consolidarProvider.valores["celular"]==""?"":consolidarProvider.valores["celular"];
    _fecha_Naccontroller.text = consolidarProvider.valores["Fecha_Nac"]==""?"":consolidarProvider.valores["Fecha_Nac"];
    _correocontroller.text = consolidarProvider.valores["correo"]==""?"":consolidarProvider.valores["correo"];
    _direccioncontroller.text = consolidarProvider.valores["direccion"]==""?"":consolidarProvider.valores["direccion"];


    return Scaffold(
      appBar: AppBar(
        title: const Text("ID: 0924875321"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomScrollView(

          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomProfileInfoCard(
                  nombre: consolidarProvider.valores["Nombres"],
                  apellido: consolidarProvider.valores["Apellidos"],
                  fechaNacimiento: consolidarProvider.valores["Fecha_Nac"],
                  identificacion: consolidarProvider.valores["Identificacion"],
                  estadoCivil: consolidarProvider.valores["EstadoCivil"],
                  celular: consolidarProvider.valores["celular"],
                  correo: consolidarProvider.valores["correo"],
                  direccion: consolidarProvider.valores["direccion"],
                ),
              ),
            ),


            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButton(
                  borderRadius: BorderRadius.circular(20),
                  // TODO: cambiar el borde a bordes redondeados y blancos
                  hint: const Text("Estado civil"),
                  value: consolidarProvider.valores["EstadoCivil"]==""?null:consolidarProvider.valores["EstadoCivil"],
                  onChanged: (value) => consolidarProvider.setValor("EstadoCivil", value),
                  items: const [
                    DropdownMenuItem(
                      value: "soltero",
                      child: Text("Soltero"),
                    ),
                    DropdownMenuItem(
                      value: "casado",
                      child: Text("Casado"),
                    ),
                    DropdownMenuItem(
                      value: "divorciado",
                      child: Text("Divorciado"),
                    ),
                    DropdownMenuItem(
                      value: "viudo",
                      child: Text("Viudo"),
                    ),
                    DropdownMenuItem(
                      value: "union libre",
                      child: Text("Union libre"),
                    ),
                    DropdownMenuItem(
                      value: "separado",
                      child: Text("Separado"),
                    ),
                  ],
                ),
              ),
            ),


            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomInputField(
                  labelText: 'Nombres Completos', 
                  prefixIcon: Icons.person,
                  keyboardType: TextInputType.name,
                  controller: _nombrecontroller,
                  onChanged: (value) => consolidarProvider.setValor("Nombres", value),
                ),
              ),
            ),


            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomInputField(
                  labelText: 'Apellidos Completos', 
                  prefixIcon: Icons.person,
                  keyboardType: TextInputType.name,
                  controller: _apellidoscontroller,
                  onChanged: (value) => consolidarProvider.setValor("Apellidos", value),
                ),
              ),
            ),



            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomInputField(
                  labelText: 'telefono', 
                  prefixIcon: Icons.phone,
                  keyboardType: TextInputType.phone,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(10),
                    FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                    NumberInputFormatter(),
                  ],
                  controller: _celularcontroller,
                  onChanged: (value) => consolidarProvider.setValor("celular", value),
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomInputField(
                  labelText: 'Fecha de nacimiento', 
                  prefixIcon: Icons.calendar_today,
                  keyboardType: TextInputType.datetime,
                  readOnly: true,
                  controller: _fecha_Naccontroller,

                  onTap: () {
                    showDatePicker(
                      context: context, 
                      initialDate: DateTime.now(), 
                      firstDate: DateTime(1900), 
                      lastDate: DateTime.now()
                    ).then((value) {
                      if (value != null) {
                        String formattedDate = '${value.year}-${_formatNumber(value.month)}-${_formatNumber(value.day)}';
                        consolidarProvider.setValor("Fecha_Nac", formattedDate);
                      }
                    });
                  },
                  onChanged: (value) => consolidarProvider.setValor("Fecha_Nac", value),
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomInputField(
                  labelText: 'Correo electronico', 
                  prefixIcon: Icons.email,
                  keyboardType: TextInputType.emailAddress,
                  controller: _correocontroller,
                  onChanged: (value) => consolidarProvider.setValor("correo", value),
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomInputField(
                  labelText: 'Direccion', 
                  prefixIcon: Icons.home,
                  keyboardType: TextInputType.streetAddress,
                  controller: _direccioncontroller,
                  onChanged: (value) => consolidarProvider.setValor("direccion", value),
                ),
              ),
            ),

            // boton de guardar
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomRenglonCard(
                  child: TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("Guardar"),
                  ),
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
  String _formatNumber(int number) {
    return number.toString().padLeft(2, '0');
  }
}