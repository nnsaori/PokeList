import 'package:flutter/material.dart';
import 'package:pokes/http_service.dart';
import 'package:pokes/pokemon_model.dart';

class MonsterBallPage extends StatelessWidget {
  final HttpService httpService = HttpService();
  @override
  Widget build(BuildContext context) {    
  var nextButton = IconButton(
                icon: Icon(
                    Icons.refresh,
                      color: Colors.pink,
                      size: 50,
                    ),
                onPressed: () {
                  httpService.fetchPokemon();
                }
              );

    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: httpService.fetchPokemon(),
          builder: (BuildContext context, AsyncSnapshot<Pokemon> snapshot) { 
            if (snapshot.hasData) {
              Pokemon pokemon = snapshot.data;
              var idString = pokemon.id.toString();
              var favoriteButton = IconButton(icon: 
                  Icon(
                    Icons.favorite,
                      color: Colors.pink,
                      size: 50,
                  ), 
                  onPressed: () {
                    print(pokemon.name);
                  }
              );
              return Center(
                child: Column(children: <Widget>[
                  Image.network('https://pokeres.bastionbot.org/images/pokemon/$idString.png', height: 200,),
                  Text(pokemon.name),
                  Text(pokemon.id.toString()),
                  favoriteButton,
                  nextButton,
                ],
                )
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    ); 
  }
}