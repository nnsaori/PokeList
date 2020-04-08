import 'package:flutter/material.dart';
import 'package:pokes/http_service.dart';
import 'package:pokes/pokemon_model.dart';

class MonsterBallPage extends StatelessWidget {
  final HttpService httpService = HttpService();

  @override
  Widget build(BuildContext context) {    
    return Scaffold(
      appBar: AppBar(
        title: Text("Monster Ball")
      ),
      body: Center(
        child: FutureBuilder(
          future: httpService.aaa(),
          builder: (BuildContext context, AsyncSnapshot<Pokemon> snapshot) { 
            if (snapshot.hasData) {
              Pokemon pokemon = snapshot.data;
              var idString = pokemon.id.toString();
              return Center(
                child: Column(children: <Widget>[
                  Image.network('https://pokeres.bastionbot.org/images/pokemon/$idString.png'),
                  Text(pokemon.name),
                  Text(pokemon.id.toString()),
                ],
                )
              );
            }
          },
        ),
      ),
    ); 
  }
}