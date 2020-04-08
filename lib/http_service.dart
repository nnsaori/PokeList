import 'dart:math';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:pokes/pokemon_model.dart';

class HttpService {
  final String baseURL = "https://pokeapi.co/api/v2";
  final int speciesCount = 807; //https://pokeapi.co/api/v2/pokemon-species?limit=0

  Future<Pokemon> fetchPokemon() async {
    var randomId = Random().nextInt(speciesCount);
    var url = '/pokemon-species/$randomId/';

    http.Response response = await http.get(baseURL + url);
    print(response.statusCode);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      var itemCount = jsonResponse['count'];
      print('Number of books about http: $itemCount.');

      Pokemon pokemon = Pokemon.fromJson(jsonResponse);
      print(pokemon.name);
      return pokemon;
   
    } else {
      print('Error! Request failed with status: ${response.statusCode}.');
    }
  }
}
