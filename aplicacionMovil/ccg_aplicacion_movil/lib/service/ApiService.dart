import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  final String _baseUrl = 'http://10.0.2.2:5000'; //ip para emulador 
                                                  //ip para tlf http://127.0.0.1:5000

  String getServiceUrl(String serviceUrl) {
    return "$_baseUrl/$serviceUrl";
  }

  Future<Map<String, dynamic>> getData(String endpoint, String jwtToken) async {
    var url = Uri.parse(_baseUrl + endpoint);
    http.Response response = await http.get(
      url,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $jwtToken",
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }


  Future<String> getDataJson(String endpoint, String jwtToken) async {
    var url = Uri.parse(_baseUrl + endpoint);
    http.Response response = await http.get(
      url,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $jwtToken",
      },
    );

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<Map<String, dynamic>> postData(
      String endpoint, Map<String, dynamic> data, String jwtToken) async {
    var url = Uri.parse(_baseUrl + endpoint);
    var headers = {
      "Content-Type": "application/json",
    };
    if (jwtToken.isNotEmpty) {
      headers["Authorization"] = "Bearer $jwtToken";
    }
    http.Response response = await http.post(
      url,
      headers: headers,
      body: jsonEncode(data),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to post data');
    }
  }

  Future<void> putData(
      String endpoint, Map<String, dynamic> data, String jwtToken) async {
    var url = Uri.parse(_baseUrl + endpoint);
    http.Response response = await http.put(
      url,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $jwtToken",
      },
      body: jsonEncode(data),
    );

    if (response.statusCode != 200 && response.statusCode != 204) {
      throw Exception('Failed to put data');
    }
  }

  Future<void> deleteData(String endpoint, String jwtToken) async {
    var url = Uri.parse(_baseUrl + endpoint);
    http.Response response = await http.delete(
      url,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $jwtToken",
      },
    );

    if (response.statusCode != 200 && response.statusCode != 204) {
      throw Exception('Failed to delete data');
    }
  }
}
