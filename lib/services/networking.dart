import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper(this.url);

  final String url;

  Future getData() async {
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      var result = json.decode(response.body);
      return (result['data']);
    } else {
      print(response.statusCode);
    }
  }
}
