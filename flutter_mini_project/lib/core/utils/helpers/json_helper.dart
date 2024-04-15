import 'dart:convert';

class JsonHelper {
  List<dynamic> decodeJson(String jsonString) {
    return json.decode(jsonString);
  }
}
