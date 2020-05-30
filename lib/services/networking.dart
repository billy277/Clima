import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkHelper {
  NetworkHelper({this.url});
  final String url;
  String data;

  Future getData() async {
    print(url);
    http.Response response = await http.get(url);
//  print(response.body);
    if (response.statusCode == 200) {
      data = response.body;
    } else {
      print('http response code:  ${response.statusCode}');
    }
    return jsonDecode(data);
  }
}
