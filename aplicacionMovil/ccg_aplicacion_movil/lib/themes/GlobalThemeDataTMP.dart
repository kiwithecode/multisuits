import 'package:flutter/material.dart';
ThemeData getGlobalThemeDataTMP() {
  return ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: Colors.white,
    
    
    

    colorScheme: const ColorScheme.light(
      primary: Colors.blue,
      // secondary: Colors.blue,
    ),
    // colorScheme: ColorScheme.dark(
    //   primary: Colors.white,
    //   secondary: Colors.black,
    //   surface: Colors.black,
    //   background: Colors.black,
    //   onPrimary: Colors.black,
    //   onSecondary: Colors.white,
    //   onSurface: Colors.white,
    //   onBackground: Colors.white,
    //   onError: Colors.black,
      
    // ),

    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Colors.black,
    ),

    tabBarTheme: const TabBarTheme(
      indicatorColor: Color(0xFF29B6F6),
      labelColor: Color(0xFF29B6F6),

      unselectedLabelColor: Color.fromARGB(179, 0, 0, 0),
    ),

   

    

    
    

    cardTheme:CardTheme(
      color:Colors.black,
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),

   

    

   
  );
}
