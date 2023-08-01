import 'package:flutter/material.dart';
ThemeData getGlobalThemeData() {
  return ThemeData(
    // useMaterial3: true,
    scaffoldBackgroundColor: const Color.fromARGB(255, 0, 0, 0),
    
    
    

    colorScheme: const ColorScheme.dark(
      primary: Colors.white,
      secondary: Color.fromARGB(255, 255, 253, 253),
      surface: Colors.black,
      background: Color.fromARGB(255, 0, 0, 0),
      onPrimary: Colors.black,
      onSecondary: Colors.white,
      onSurface: Colors.white,
      onBackground: Colors.white,
      onError: Colors.black,
      
    ),

    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
    ),

    tabBarTheme: const TabBarTheme(
      indicatorColor: Color(0xFF29B6F6),
      labelColor: Color(0xFF29B6F6),

      unselectedLabelColor: Color.fromARGB(179, 255, 255, 255),
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
