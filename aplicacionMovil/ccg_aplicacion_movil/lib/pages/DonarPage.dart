import 'package:flutter/material.dart';

import '../themes/GlobalLigthThemeData.dart';

class DonarPage extends StatelessWidget {
  static const routeName = '/donar';
  const DonarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: GlobalLigthThemeData(),
      child: Scaffold(

        appBar: AppBar(
          elevation: 0.0, // Elimina la elevación
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: const ImageIcon(
            // NetworkImage('https://www.ccgye.org/wp-content/uploads/2022/01/CCG-black.png'),
              NetworkImage('https://i.gifer.com/2iFb.gif'),
              color: Colors.black,
              size: 40,
            ),
        ),
        body: CustomScrollView(
          slivers: [
            
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
    
                    const Text("Ingresa los datos personales de tu tarjeta de crédito o débito"),
                    const SizedBox.square(dimension: 30,),
    
                    TextField(
                      keyboardType: TextInputType.text,
                      decoration: getInputDecoration("Nombre", Icons.perm_identity),
                    ),
                    const SizedBox(height: 10,),
    
                    TextField(
                      keyboardType: TextInputType.text,
                      decoration: getInputDecoration("Apellido", Icons.perm_identity),
                    ),
                    const SizedBox(height: 10,),
    
                    TextField(
                      keyboardType: TextInputType.text,
                      decoration: getInputDecoration('Correo electrónico', Icons.email),
                    ),
    
    
                    const SizedBox(height: 10,),
                    const SizedBox.square(dimension: 30,),
    
    
                    TextField(
                      keyboardType: TextInputType.number,
                      decoration: getInputDecoration("Número de tarjeta", Icons.credit_card),
                    ),
                    const SizedBox.square(dimension: 10,),
    
                    Row(
                      children: [
                        Flexible(
                          child: TextField(
                            keyboardType: TextInputType.number,
                            decoration: getInputDecoration("MM/AA", Icons.calendar_today)
                          ),
                        ),
    
                        const SizedBox.square(dimension: 10,),
    
                        Flexible(
                          child: TextField(
                            keyboardType: TextInputType.number,
                            decoration: getInputDecoration("CVV", Icons.lock)
                          ),
                        ),
                      ],
                    ),
                    const SizedBox.square(dimension: 10,),
    
    
                    TextField(
                      keyboardType: TextInputType.text,
                      decoration: getInputDecoration("Titular de la tarjeta", Icons.person),
                    ),
                    const SizedBox.square(dimension: 10,),
                    Center(
                      child: FilledButton.icon(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                        ),
                        icon: const Icon(Icons.favorite),
                        label: const Text("Donar"),
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) => BottomSheet(
                              enableDrag: false,
                              onClosing: () {},
                              builder: (context) => SizedBox(
                                width: double.infinity,
                                height: 600,
                                child: Padding(
                                  padding: const EdgeInsets.all(40),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text("Resumen de la donación", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                                      const Flexible(
                                        child: Padding(
                                          padding: EdgeInsets.all(40),
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text("Importe del pago:"),
                                                  Text("\$100.00"),
                                                ],
                                              ),
                                              SizedBox.square(dimension: 10,),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text("Frecuencia de donacion:"),
                                                  Text("Una vez"),
                                                ],
                                              ),
                                              Divider(),
                                              SizedBox.square(dimension: 10,),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text("Total a donar:", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                                                  Text("\$100.00", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                                                ],
                                              ),
                                            ],
                                          ),
                                        )
                                      ),
                                      // aceptar terminos y condiciones
                                      CheckboxListTile(
                                        title: const Text("Acepto los términos y condiciones"),
                                        value: false,
                                        onChanged: (value) {},
                                      ),
                                      Center(
                                        child: FilledButton.icon(
                                          style: ButtonStyle(
                                            backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                                            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                          ),
                                          icon: const Icon(Icons.favorite),
                                          label: const Text("Donar"),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ),
                                      
                                    ],
                                  ),
                                ),
                              ),
                            )
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  InputDecoration getInputDecoration(String label, IconData icon) {
    return InputDecoration(
      prefixIcon: Icon(
        icon,
        color: Colors.grey[700],
        textDirection: TextDirection.ltr,
        semanticLabel: label,
      ),
      // En lugar de child, usamos labelText para agregar el texto
      labelText: label,
      border: const OutlineInputBorder(),
    );
  }
}