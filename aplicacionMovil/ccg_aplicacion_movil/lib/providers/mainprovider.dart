import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

String _token = "";

class MainProvider extends ChangeNotifier {
   static late SharedPreferences prefs;

  String _token = "";

  String get token {
    return _token;
  }
  
  bool get isAuth {
    return _token.isNotEmpty;
  }




  set token(String newToken) {
    updateToken(newToken);
    _token = newToken;
    notifyListeners();
  }

  Future<void> updateToken(String token) async {
    prefs = await SharedPreferences.getInstance();
    await prefs.setString("token", token);
  }

  Future<String> getPreferencesToken() async {
    try {
      prefs = await SharedPreferences.getInstance();
      _token = prefs.getString("token") ?? "";
      return _token;
    } catch (e) {
      return "";
    }
  }

    Future<void> logout() async {
    _token = "";
    await prefs.setString("token", "");
    notifyListeners();
  }

}

