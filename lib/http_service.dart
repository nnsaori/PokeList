import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class HttpService {
  final String baseURL = "https://pokeapi.co/api/v2";
  Future<void> aaa() async {
    var url = '/pokemon-species/?limit=0';

    var response = await http.get(baseURL + url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      var itemCount = jsonResponse['count'];
      print('Number of books about http: $itemCount.');
    } else {
      print('Error! Request failed with status: ${response.statusCode}.');
    }
  }
}
