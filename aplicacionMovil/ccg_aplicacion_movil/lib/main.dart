
import 'package:ccg_aplicacion_movil/pages/Consolidar/ConsolidarPage.dart';
import 'package:ccg_aplicacion_movil/pages/Consolidar/TarjetaPersona.dart';
import 'package:ccg_aplicacion_movil/pages/MenuCoberturaPage.dart';
import 'package:ccg_aplicacion_movil/pages/MenuPage.dart';
import 'package:ccg_aplicacion_movil/pages/UserProfilePage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/CoberturaPage.dart';
import 'pages/DonarPage.dart';
import 'pages/LoginPage.dart';
import 'pages/MainPage.dart';
import 'pages/CreatePage.dart';
import 'pages/CampusPage.dart';
import 'pages/RegistrarAsisPage.dart';
import 'pages/SplashPage.dart';

import 'providers/MainNavigationIndexProvider.dart';
import 'providers/mainprovider.dart';
import 'themes/GlobalThemeData.dart';
import 'pages/Consolidar/ConsolidarProvider.dart';


// void main() => runApp(const MyApp());
void main() async{
  // await dotenv.load(fileName: ".env");
  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => MainNavigationIndexProvider()),
          ChangeNotifierProvider(create: (_) => ConsolidarProvider()),
             ChangeNotifierProvider(create: (_) => MainProvider()),
        ],
        child: const MyApp(),
      ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: getGlobalThemeData(),
      title: 'Iglesia Centro Cristiano GYE',
      initialRoute: SplashPage.routeName,
      routes: {
        SplashPage.routeName: (context) => const SplashPage(),
        MainPage.routeName: (context) => const MainPage(),
        LoginPage.routeName: (context) => const LoginPage(),
        DonarPage.routeName: (context) => const DonarPage(),
        CreatePage.routeName: (context) => const CreatePage(),
        CampusPage.routeName: (context) => const CampusPage(),
        UserProfilePage.routeName: (context) => const UserProfilePage(),
        CoberturaPage.routeName: (context) => const CoberturaPage(),
        MenuCoberturaPage.routeName: (context) => const MenuCoberturaPage(),
        MenuPage.routeName: (context) =>const MenuPage(),
        ConsolidarPage.routeName: (context) => const ConsolidarPage(),
        TarjetaPersona.routeName: (context) => TarjetaPersona(),
        RegistrarAsisPage.routeName: (context) => RegistrarAsisPage(),
      },
    );
  }
}




