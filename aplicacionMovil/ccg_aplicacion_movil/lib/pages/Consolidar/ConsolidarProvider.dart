import 'package:ccg_aplicacion_movil/models/PersonaByCED.dart';
import 'package:ccg_aplicacion_movil/service/ApiService.dart';
import 'package:flutter/material.dart';

class ConsolidarProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();
  int _step = 0;
  bool _show = false;
  late PersonaByCed _personaByCed;

  PersonaByCed get personaByCed => _personaByCed;

  Future getPersonaByCED(String cedula) async {
    String endpoint = '/consolidacion/getPersonaByCED/$cedula';
    try {
      var response = await _apiService.getDataJson(endpoint, '');
      // _valores['Identificacion'] = cedula;
      // if (response == "Persona no encontrada") {
      //   notifyListeners();
      //   return;
      // }; // TODO: cambiar esto a algo mas manejable
      _personaByCed = personaByCedFromJson(response);
      
      _valores['Identificacion'] = _personaByCed.identificacion;
      _valores['Tipo_Identificacion'] = _personaByCed.tipoIdentificacion;
      _valores['Fecha_Nac'] = _personaByCed.fechaNac.toString().substring(0, 10);
      _valores['Nombres'] = _personaByCed.nombres;
      _valores['Apellidos'] = _personaByCed.apellidos;
      _valores['Sexo'] = _personaByCed.sexo;
      _valores['EstadoCivil'] = _personaByCed.estadoCivil;
      _valores['Zona'] = _personaByCed.zona;
      _valores['lugar_de_trabajo'] = _personaByCed.lugarDeTrabajo;
      _valores['profesion'] = _personaByCed.profesion;
      _valores['direccion'] = _personaByCed.direccion;
      _valores['esBautizado'] = _personaByCed.esBautizado;
      _valores['perteneceGrupoFamiliar'] = _personaByCed.perteneceGrupoFamiliar;
      _valores['fechaBautizo'] = _personaByCed.fechaBautizo.toString().substring(0, 10);
      // _valores['esLider'] = _personaByCed.esLider;
      // _valores['lider'] = _personaByCed.lider;

      // return _personaByCed;
      notifyListeners();
    } catch (e) {
      _valores['Identificacion'] = cedula;// TODO: cambiar esto a algo mas manejable
      notifyListeners();
      print(e);
      // throw Exception('Failed to post data: $e');
      // return null;

    }
  }


  // String _cedula = "";

// consolidacion/sendForm
// {
//     "Identificacion": "1234567890",
//     "Tipo_Identificacion": "Cedula",
//     "Fecha_Nac": "1990-01-01",
//     "Nombres": "John",
//     "Apellidos": "Doe",
//     "foto": "base64encodedimage",//opcional
//     "Sexo":"M",
//     "EstadoCivil":"soltero",
//     "Zona":"Zona A",
//     "lugar_de_trabajo":"Trabajo",
//     "profesion":"Profesion",
//     "direccion":"Direccion",
//     "esBautizado":true,
//     "perteneceGrupoFamiliar":false,
//     "fechaBautizo":"2021-01-01",
//     "comentario":"comentario",
//     "telefono":"1234567890",
//     "celular":"1234567890",
//     "telTrabajo":"1234567890",
//     "correo":"juan@fmail.com
// }
  Map<String, dynamic> _valores = {
    "Identificacion": "",
    "Tipo_Identificacion": "",
    "Fecha_Nac": "",
    "Nombres": "",
    "Apellidos": "",
    // "foto": "base64encodedimage",//opcional
    "Sexo":"",
    "EstadoCivil":"",
    "Zona":"",
    "lugar_de_trabajo":"",
    "profesion":"",
    "direccion":"",
    "esBautizado":false,
    "perteneceGrupoFamiliar":false,
    "fechaBautizo":"",
    "comentario":"",
    "telefono":"",
    "celular":"",
    "telTrabajo":"",
    "correo":"",
    "reconciliacion":false,
  };

  Map<String, dynamic> get valores => _valores;
  void setValor(String key, dynamic value) {
    _valores[key] = value;
    notifyListeners();
  }


  int get step => _step;
  set step(int value) {
    _step = value;
    notifyListeners();
  }

  void next(){
      _step++;
      notifyListeners();
  }

  void get_info_by_cedula(String cedula){
    // _cedula = cedula;
    _valores['Identificacion'] = cedula;
    notifyListeners();
  }

  bool cedula_ready(){
    if(_valores['Identificacion'].length == 10){
      _show = true;
      return true;
    }
    return false;
  }

  void reset(){
    _step = 0;
    _show = false;
    _valores = {
      "Identificacion": "",
      "Tipo_Identificacion": "",
      "Fecha_Nac": "",
      "Nombres": "",
      "Apellidos": "",
      // "foto": "base64encodedimage",//opcional
      "Sexo":"",
      "EstadoCivil":"",
      "Zona":"",
      "lugar_de_trabajo":"",
      "profesion":"",
      "direccion":"",
      "esBautizado":false,
      "perteneceGrupoFamiliar":false,
      "fechaBautizo":"",
      "comentario":"",
      "telefono":"",
      "celular":"",
      "telTrabajo":"",
      "correo":"",
      "reconciliacion":false,
    };
    notifyListeners();
  }
  // void next(){
  //   if(_step < _steps.length - 1 && _steps.isNotEmpty){
  //     _step++;
      
  //     notifyListeners();
  //   }
  // }

  // String get cedula => _cedula;
  // set cedula(String value) {
  //   _cedula = value;
  //   notifyListeners();
  // }

  bool get show => _show;
  set show(bool value) {
    _show = value;
    notifyListeners();
  }



}