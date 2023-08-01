import 'package:flutter/material.dart';

class CustomProfileInfoCard extends StatelessWidget {
  String nombre;
  String apellido;
  String identificacion;
  String estadoCivil;
  String celular;
  String fechaNacimiento;
  String correo;
  String direccion;

  CustomProfileInfoCard({
    super.key,
    required this.nombre,
    required this.apellido,
    required this.identificacion,
    required this.estadoCivil,
    required this.celular,
    required this.fechaNacimiento,
    required this.correo,
    required this.direccion,

  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.light(),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        shadowColor: Colors.white,
        elevation: 10,
        color: Colors.white,
        child: SizedBox(
          height: 120,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                Row(
                  
                  children: [
                    const Column(
                      children: [
                        SizedBox(height: 12),
                        CircleAvatar(
                          radius: 12.0,
                        ),
                      ],
                    ),
              
                    const SizedBox(width: 10),
              
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(nombre.length>2?nombre:'Nombre'),
                        Text(apellido.length>2?apellido:'Apellido'),
                        Text('ID: $identificacion'),
                      ],
                    ),
                  ],
                ),
                

                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(estadoCivil.length>2?estadoCivil:"EstadoCivil"),
                    Text(celular.length>2?celular:'Celular'),
                    Text(fechaNacimiento.length>2?fechaNacimiento:'Fecha de nacimiento'),
                    Text(correo.length>2?correo:'Correo electronico'),
                    Text(direccion.length>2?direccion:'Direccion de domicilio'),
                  ],
                ),


                
              ],
            ),
          ),
        ),
        
    
      ),
    );
  }
}

// Text('Alfred Josue'),
// Text('Coloma Ortiz'),
// Text('Soltero'),
// Text('0969871734'),
// Text('SrColoma.oficial@gmail.com'),
// Text('12 de abril de 1998'),
// Text('Colinas de la alborada m669 v12'),