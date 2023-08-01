import 'package:flutter/material.dart';

ThemeData GlobalLigthThemeData(){
  return ThemeData(
    scaffoldBackgroundColor: const Color.fromARGB(255, 0, 0, 0),
    useMaterial3: true,
    // colorScheme: ColorScheme.light(

    //   primary: Colors.blue,
    //   // primaryVariant: Colors.black,
    //   secondary: Colors.black,
    //   // secondaryVariant: Colors.black,
    //   surface: Colors.white,
    //   background: Colors.white,
    //   // error: Colors.black,
    //   onPrimary: Colors.black,
    //   onSecondary: Colors.black,
    //   // onSurface: Colors.white,
    //   onSurfaceVariant: Colors.black,
    //   onBackground: Colors.black,
    // ),

    // iconTheme:IconThemeData(
    //   color: Colors.black,
    // ),

    // buttonTheme: ButtonThemeData(
    //   buttonColor: Colors.black
    // ),

    // elevatedButtonTheme: ElevatedButtonThemeData(
    //   style: ElevatedButton.styleFrom(
    //     foregroundColor: Colors.black,
    //     backgroundColor: Colors.black.withOpacity(0.1),
    //   ),
    // ),

    filledButtonTheme: FilledButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black,
        backgroundColor: Colors.black.withOpacity(0.1),
      ),
    ),

    // textTheme: TextTheme(
    //   bodyText1: TextStyle(
    //     color: Colors.black, // Establece el color del texto del cuerpo en negro
    //   ),
    //   headline6: TextStyle(
    //     color: Colors.red, // Establece el color del texto del encabezado en rojo
    //   ),
    // ),


    // dropdownMenuTheme: DropdownMenuThemeData(
    //   menuStyle: MenuStyle(
    //     surfaceTintColor: MaterialStatePropertyAll(Colors.black),
    //     // backgroundColor: MaterialStatePropertyAll(Colors.black)
    //   ),
    //   textStyle: TextStyle(
    //     color: Colors.black,
    //   ),

    // )

  );
}