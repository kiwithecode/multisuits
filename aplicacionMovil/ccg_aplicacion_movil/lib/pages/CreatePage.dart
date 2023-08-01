import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../service/ApiService.dart';

class CreatePage extends StatefulWidget {
  static const routeName = '/create';

  const CreatePage({super.key});

  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  
  final _formKey = GlobalKey<FormState>();

  static const _fontSize = 20.0;
  static const _paddingSize = 15.0;
  static const _buttonFontSize = 18.0;
  static const _sizedBoxHeight = 10.0;

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _cedulaController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _termsAndConditions = false;

  final ApiService _apiService = ApiService();

  @override
  void dispose() {
    _usernameController.dispose();
    _cedulaController.dispose();
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
          style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: _fontSize),
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

  Future<void> saveJwtToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('jwtToken', token);
  }

  Future<void> postData(
      String endpoint, Map<String, dynamic> data, String jwtToken) async {
    try {
      var response = await _apiService.postData(endpoint, data, jwtToken);
      if (response['access_token'] != null) {
        await saveJwtToken(response['access_token']);
      }
    } catch (e) {
      throw Exception('Failed to post data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crear cuenta'),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(_paddingSize),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
               const CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(
                      'https://www.ccgye.org/wp-content/uploads/2022/01/CCG-black.png'),
                ),
                const SizedBox(height: 2 * _sizedBoxHeight),
                _buildTextField('Usuario', _usernameController),
                _buildTextField('Cedula', _cedulaController),
                _buildTextField('Contraseña', _passwordController,
                    isObscured: true),
                CheckboxListTile(
                  title: const Text(
                    'Acepto términos y condiciones',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: _fontSize,
                    ),
                  ),
                  value: _termsAndConditions,
                  onChanged: (bool? value) {
                    setState(() {
                      _termsAndConditions = value ?? false;
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                  activeColor: Colors.lightBlue,
                ),
                const SizedBox(height: _sizedBoxHeight),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate() &&
                        _termsAndConditions) {
                      // Create a map of the user data
                      Map<String, dynamic> userData = {
                        "username": _usernameController.text,
                        "cedula": _cedulaController.text,
                        "password": _passwordController.text,
                      };

                      // Call the API to register the user
                      try {
                        await postData('login/register', userData, '');
                        // Show a success message or navigate to another screen
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('User registration successful')),
                        );
                      } catch (e) {
                        // Handle any errors that occurred during the API request
                        print('Error: $e');
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Failed to register user')),
                        );
                      }
                    } else if (!_termsAndConditions) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Debes aceptar los términos y condiciones')),
                      );
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
                    'Crear cuenta',
                    style: TextStyle(
                      fontSize: _buttonFontSize,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: _sizedBoxHeight),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Ya tengo una cuenta',
                    style: TextStyle(
                      color: Colors.white,
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
