
import 'package:flutter/material.dart';

import '../../../themes/GlobalLigthThemeData.dart';

class DonarTabView extends StatelessWidget {
  const DonarTabView({super.key});

  @override
  Widget build(BuildContext context) {
    
    return SingleChildScrollView(
      child: Theme(
        data: GlobalLigthThemeData(),
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
    
                const Text(
                  "Agradecemos tu generosidad!", 
                  style: TextStyle(
                    fontSize: 20, 
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
    
                const Text(
                  "Selecciona primero el monto sw tu ofrenda o diezmo, en la siguiente sección.",
                  style: TextStyle(
                    color: Colors.black87,
                  ),
                ),
                const SizedBox.square(dimension: 30,),
                
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.attach_money,
                      color: Colors.grey[700],
                      textDirection: TextDirection.ltr,
                      semanticLabel: 'Precio en pesos',
                    ),
                    // En lugar de child, usamos labelText para agregar el texto
                    labelText: 'USD',
                    border: const OutlineInputBorder(),
                  ),
                ),
        
                const SizedBox.square(dimension: 10,),
        
        
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildMontoButton(15),
                    _buildMontoButton(20),
                    _buildMontoButton(30),
                    _buildMontoButton(50),
                  ],
                ),
        
        
                const SizedBox.square(dimension: 10,),
                const Text(
                  "Donativos para el Campus:",
                  style: TextStyle(
                    color: Colors.black87,
                  ),
                ),
                const SizedBox.square(dimension: 10,),
                
                
                const DropdownMenu(
        
                  dropdownMenuEntries: [
                    DropdownMenuEntry(
                      label: "Campus Principal",
                      value: "Campus Principal",
                    ),
                    DropdownMenuEntry(
                      label: "Campus Ciudadela de Dios",
                      value: "Campus Ciudadela de Dios",
                    ),
                    DropdownMenuEntry(
                      label: "Campus Monte Sinaí",
                      value: "Campus Monte Sinaí",
                    ),
                    DropdownMenuEntry(
                      label: "Campus Durán",
                      value: "Campus Durán",
                    ),
                  ],
                ),
        
                const SizedBox.square(dimension: 10,),
                const Text("Motivo de la donación:",
                  style: TextStyle(
                    color: Colors.black87,
                  ),
                ),
                const SizedBox.square(dimension: 10,),
        
                const DropdownMenu(
        
                  dropdownMenuEntries: [
                    DropdownMenuEntry(
                      label: "Diezmo",
                      value: "Diezmo",
                    ),
                    DropdownMenuEntry(
                      label: "Ofrenda",
                      value: "Ofrenda",
                    ),
                    DropdownMenuEntry(
                      label: "Donativo",
                      value: "Donativo",
                    ),
                  ],
                ),
        
                const SizedBox.square(dimension: 10,),
        
                const Text(
                  "Donar cada:",
                  style: TextStyle(
                    color: Colors.black87,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ActionChip(
                      label: const Text("Semana"),
                      onPressed: () {},
                    ),
                    ActionChip(
                      label: const Text("Quincena"),
                      onPressed: () {},
                    ),
                    ActionChip(
                      label: const Text("Mes"),
                      onPressed: () {},
                    ),
                    ActionChip(
                      label: const Text("Año"),
                      onPressed: () {},
                    ),
                  ],
                ),
                const SizedBox.square(dimension: 10,),
                Center(
                  child: FilledButton.icon(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                    ),
                    icon: const Icon(Icons.arrow_forward),
                    label: const Text("Continuar"),
                    onPressed: () {
                      Navigator.pushNamed(context, '/donar');
                    },
                  ),
                )
        
              ]
            ),
          ),
        ),
      ),
    );
  }
  
  _buildMontoButton(int i) {
    return FilledButton(
      onPressed: () {
        print("Monto $i");
      },
      child: Text("\$$i"),
    );
  }
}
