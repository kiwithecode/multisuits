import 'package:flutter/material.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({Key? key}) : super(key: key);
  static const routeName = '/userProfile';

  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil de Usuario'),
        elevation: 0.0,
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const CircleAvatar(
              radius: 80.0,
              backgroundColor: Colors.blue,
              child: Icon(
                Icons.person,
                size: 80.0,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20.0),
            const Text(
              '¡Bienvenido!',
              style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20.0),
            Text(
              'Aquí podrás gestionar tu perfil.',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
