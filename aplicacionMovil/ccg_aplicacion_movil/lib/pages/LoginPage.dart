import 'dart:async';
import 'dart:developer';
import 'package:ccg_aplicacion_movil/pages/SplashPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../pages/CreatePage.dart';
import '../providers/mainprovider.dart';
import '../service/ApiService.dart';

class LoginPage extends StatefulWidget {
  static const routeName = 'login';

  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  static const _fontSize = 20.0;
  static const _paddingSize = 15.0;
  static const _buttonFontSize = 18.0;
  static const _sizedBoxHeight = 10.0;

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final ApiService _apiService = ApiService();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }


  Widget _buildTextField(String label, TextEditingController controller,
      {bool isObscured = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(color: Colors.white, fontSize: _fontSize),
          textAlign: TextAlign.left,
        ),
        const SizedBox(height: _sizedBoxHeight),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            hintText: label,
            filled: true,
            fillColor: const Color.fromARGB(255, 0, 0, 0),
          ),
          obscureText: isObscured,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Por favor, coloque su $label';
            }
            return null;
          },
        ),
        const SizedBox(height: _sizedBoxHeight),
      ],
    );
  }

  saveJwtToken(String token)  {
  final mainProvider = Provider.of<MainProvider>(context, listen: false);
  setState(() {
              mainProvider.updateToken(token);
        log("Token en el Logoearte: $token");
    });
    // Agregando el estado de la sesión
  }

  Future<void> postData(
      String endpoint, Map<String, dynamic> data, String jwtToken) async {
          final mainProvider = Provider.of<MainProvider>(context, listen: false);
    try {
      var response = await _apiService.postData(endpoint, data, jwtToken);
      if (response['access_token'] != null) {
       mainProvider.updateToken(response['access_token']);
      
      }
    } catch (e) {
      print(e);
      throw Exception('Failed to post data: $e');
    }
  }

  Future<void> login(String username, String password) async {
    try {
      await postData(
          '/login/login', {'username': username, 'password': password}, '');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SplashPage()),
      );
    } catch (e) {
      showCustomSnackBar(context, 'Error al iniciar sesión: $e', Colors.red);
      _usernameController.clear();
      _passwordController.clear();
    }
  }

  void showCustomSnackBar(BuildContext context, String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,
              color: Color.fromARGB(255, 255, 255, 255)), // Set your color here
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Login'),
        elevation: 0.0,
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(_paddingSize),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ClipOval(
                  child: Image.network(
                    'https://www.ccgye.org/wp-content/uploads/2022/01/CCG-black.png',
                    color: Color.fromARGB(255, 255, 255, 255),
                    fit: BoxFit.cover,
                    width: 80.0,
                    height: 80.0,
                  ),
                ),
                const SizedBox(height: 2 * _sizedBoxHeight),
                _buildTextField('Usuario', _usernameController),
                _buildTextField('Contraseña', _passwordController,
                    isObscured: true),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Olvidé mi contraseña',
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: _fontSize,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: _sizedBoxHeight),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      try {
                        await login(
                            _usernameController.text, _passwordController.text);
                        showCustomSnackBar(
                            context, 'Inicio de sesión exitoso!', Colors.green);
                      } catch (e) {
                        showCustomSnackBar(
                            context, 'Error al iniciar sesión: $e', Colors.red);
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: _paddingSize, horizontal: 60),
                    backgroundColor: Colors.lightBlue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: _buttonFontSize,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: _sizedBoxHeight),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, CreatePage.routeName);
                  },
                  child: const Text(
                    'Crear cuenta',
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: _fontSize,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
