import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../providers/mainprovider.dart';
import 'CoberturaPage.dart';
import 'Consolidar/ConsolidarPage.dart';
import 'MenuCoberturaPage.dart';

class MenuPage extends StatefulWidget {
  static const routeName = 'menu';

  const MenuPage({Key? key}) : super(key: key);

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  int _selectedButtonIndex = -1;
  String token = "";

  @override
  void initState() {
    super.initState();
    final mainProviderSave =
        Provider.of<MainProvider>(context, listen: false);

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
                'Crecimiento y Cambio',
                FontAwesomeIcons.personChalkboard,
                '/crecimiento',
                index: 0,
              ),
              _buildIconButton(
                'Donaciones',
                FontAwesomeIcons.donate,
                '/donaciones',
                index: 1,
              ),
              _buildIconButton(
                'Culto en Vivo',
                FontAwesomeIcons.video,
                '/culto-en-vivo',
                index: 2,
              ),
              _buildIconButton(
                'Eventos',
                FontAwesomeIcons.calendar,
                '/eventos',
                index: 3,
              ),
              _buildIconButton(
                'Check In',
                FontAwesomeIcons.check,
                '/check-in',
                visible: token.isNotEmpty,
                index: 4,
              ),
              _buildIconButton(
                'Estadísticas',
                FontAwesomeIcons.chartBar,
                '/estadisticas',
                visible: token.isNotEmpty,
                index: 5,
              ),
              _buildIconButton(
                'Cobertura',
                FontAwesomeIcons.mapMarkerAlt,
                MenuCoberturaPage.routeName,
                visible: token.isNotEmpty,
                index: 6,
              ),
              _buildIconButton(
                'Consolidar',
                FontAwesomeIcons.userGroup,
                ConsolidarPage.routeName,
                visible: token.isNotEmpty,
                index: 7,
              ),
            ].map((widget) => Padding(
              padding: const EdgeInsets.all(10.0),
              child: widget,
            )).toList(),
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
            color: isSelected ? Colors.white :  Colors.blue,
            borderRadius: BorderRadius.circular(10),  //scafolmodel
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
                      color: isSelected ? const Color(0xFF29B6F6) : const Color.fromARGB(255, 255, 255, 255),
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
