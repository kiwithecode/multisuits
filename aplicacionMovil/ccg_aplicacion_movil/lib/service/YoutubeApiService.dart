import 'dart:io';
import 'package:ccg_aplicacion_movil/models/viideos_list.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import 'Constvideo.dart';

class Services {
  //
  static const CHANNEL_ID = 'UCpmNYBHIRIU70VkoIzJ6tTA';
  static const _baseUrl = 'www.googleapis.com';

 

  static Future<VideosList> getVideosList() async {
   Map<String, String> parameters = {
  'part': 'snippet',
  'playlistId': 'PLq8YJCOiTN8y9pWtO0d5w50g69LO2FXhS',
  'key': Constants.API_KEY,
};
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };
    Uri uri = Uri.https(
      _baseUrl,
      '/youtube/v3/playlistItems',
      parameters,
    );
    Response response = await http.get(uri, headers: headers);
    VideosList videosList = videosListFromJson(response.body);
    return videosList;
  }
}
