import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../providers/mainprovider.dart';
import 'CoberturaPage.dart';
import 'Consolidar/ConsolidarPage.dart';
import 'RegistrarAsisPage.dart';

class MenuCoberturaPage extends StatefulWidget {
  static const routeName = '/menucobertura';

  const MenuCoberturaPage({Key? key}) : super(key: key);

  @override
  _MenuCoberturaPageState createState() => _MenuCoberturaPageState();
}

class _MenuCoberturaPageState extends State<MenuCoberturaPage> {
  int _selectedButtonIndex = -1;
  String token = "";

  @override
  void initState() {
    super.initState();
    final mainProviderSave = Provider.of<MainProvider>(context, listen: false);

    mainProviderSave.getPreferencesToken().then((dataToken) {
      setState(() {
        token = dataToken.toString();
        mainProviderSave.updateToken(token);

        log("Token en el MainPage: $token");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menú Cobertura'),
        automaticallyImplyLeading: true, // Muestra el botón de regreso por defecto
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 3,
              childAspectRatio: _calculateChildAspectRatio(),
              children: <Widget>[
                _buildIconButton(
                  'Crear Calendario',
                  FontAwesomeIcons.calendar,
                  CoberturaPage.routeName,
                  index: 0,
                ),
                _buildIconButton(
                  'Pasar Lista',
                  FontAwesomeIcons.check,
                  RegistrarAsisPage.routeName,
                  index: 1,
                ),
                _buildIconButton(
                  'Historial de Eventos',
                  FontAwesomeIcons.history,
                  '/pasar_lista',
                  index: 2,
                ),
              ]
                  .map(
                    (widget) => Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: widget,
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }

  double _calculateChildAspectRatio() {
    int crossAxisCount = 3;
    double screenWidth = MediaQuery.of(context).size.width;
    double itemWidth = screenWidth / crossAxisCount;
    double itemHeight = itemWidth + 20.0; // Adjust the height as needed
    return itemWidth / itemHeight;
  }

  Widget _buildIconButton(
    String title,
    IconData icon,
    String route, {
    bool visible = true,
    required int index,
  }) {
    bool isSelected = _selectedButtonIndex == index;
    return Visibility(
      visible: visible,
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, route);
          setState(() {
            _selectedButtonIndex = isSelected ? -1 : index;
            if (!isSelected) {
              Navigator.pushNamed(context, route);
            }
          });
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : Colors.blue,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(
                  icon,
                  size: 50.0,
                  color: isSelected ? const Color(0xFF29B6F6) : Colors.white,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15.0,
                      color: isSelected
                          ? const Color(0xFF29B6F6)
                          : const Color.fromARGB(255, 255, 255, 255),
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
