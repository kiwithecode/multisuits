import 'package:flutter/material.dart';

class RegistrarAsisPage extends StatefulWidget {
  RegistrarAsisPage({Key? key}) : super(key: key);
   static const routeName = 'listaCo';

  @override
  _RegistrarAsisPageState createState() => _RegistrarAsisPageState();
}

class _RegistrarAsisPageState extends State<RegistrarAsisPage> {
  List<String> nombres = ['Nombre 1', 'Nombre 2', 'Nombre 3'];  // Lista de nombres
  Map<String, Map<String, bool>> asistencias = {};  // Mapa para llevar el control de asistencias

  @override
  void initState() {
    super.initState();
    nombres.forEach((nombre) {
      asistencias[nombre] = {'Asiste': false, 'Falta': false};
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registrar Asistencias'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(child: Text('Nombre', textAlign: TextAlign.center, style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),)),
                  Expanded(child: Text('Asiste', textAlign: TextAlign.center, style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),)),
                  Expanded(child: Text('Falta', textAlign: TextAlign.center, style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),)),
                ],
              ),
              Divider(),
              Expanded(
                child: ListView.builder(
                  itemCount: nombres.length,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Expanded(
                          child: Text(nombres[index], textAlign: TextAlign.center,),
                        ),
                        Expanded(
                          child: CheckboxListTile(
                            value: asistencias[nombres[index]]!['Asiste'],
                            onChanged: (bool? newValue) {
                              setState(() {
                                asistencias[nombres[index]]!['Asiste'] = newValue!;
                                asistencias[nombres[index]]!['Falta'] = !newValue!;
                              });
                            },
                          ),
                        ),
                        Expanded(
                          child: CheckboxListTile(
                            value: asistencias[nombres[index]]!['Falta'],
                            onChanged: (bool? newValue) {
                              setState(() {
                                asistencias[nombres[index]]!['Falta'] = newValue!;
                                asistencias[nombres[index]]!['Asiste'] = !newValue!;
                              });
                            },
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FloatingActionButton.extended(
            onPressed: () {
              // Retroceder a la página anterior.
              Navigator.pop(context);
            },
            label: Text('Guardar Cambios'),
            backgroundColor: Colors.lightBlue,  // Cambiar al color que prefieras.
          ),
        ),
      ),
    );
  }
}
  