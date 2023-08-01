import 'dart:async';
import 'package:ccg_aplicacion_movil/pages/MainPage.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  static const String routeName = '/splash';

  const SplashPage({super.key});

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    // Agrega aquí cualquier lógica que necesites antes de mostrar el splash screen

    // Ejemplo: Simular una carga de datos durante 3 segundos y luego navegar a la siguiente pantalla
    Timer(const Duration(seconds: 3), () { Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => const MainPage()),
  );
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             ImageIcon(
          NetworkImage('https://www.ccgye.org/wp-content/uploads/2022/01/CCG-black.png'),
          color: Color.fromARGB(255, 255, 255, 255),
          size: 200,
        ),
         SizedBox(height: 20),
            // Agrega cualquier contenido que desees mostrar en el splash screen
            CircularProgressIndicator(),
            SizedBox(height: 20),
            Text('CCG MI LUGAR',style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 24.0)),
          ],
        ),
      ),
    );
  }
}
