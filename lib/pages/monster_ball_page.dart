import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pokes/http_service.dart';
import 'package:pokes/pokemon_model.dart';
import 'package:pokes/shared_pref.dart';

class MonsterBallPage extends StatefulWidget {

  @override
  _MonsterBallState createState() => _MonsterBallState();
}

class _MonsterBallState extends State<MonsterBallPage> {

  final HttpService httpService = HttpService();
  SharedPref sharedPref = SharedPref();
  String sharedKey = "fav";
  Future<Pokemon> poke;

  @override
  void initState() {
      super.initState();

print("start");
    poke = httpService.fetchPokemon();
print(poke.toString());

  }

  @override
  Widget build(BuildContext context) {   
    poke = httpService.fetchPokemon();
    var nextButton = IconButton(
                  icon: Icon(
                      Icons.refresh,
                        color: Colors.pink,
                        size: 50,
                      ),
                  onPressed: () {
                    setState(() {
                      poke = httpService.fetchPokemon();  
                      // sharedPref.remove("fav");
                    });
                  }
                );

    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: poke,
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
                    List<Pokemon> favList = [];
                    List<String> favjsonList = sharedPref.getStringList("demoList");
                    favList = favjsonList.map((json) => Pokemon.fromJson(json)).toList();

                    favList.add(pokemon);
                    List<String> jsonList = favList.map((pokemon) => pokemon.toJson()).toList();

                    sharedPref.setStringList("demoList", jsonList);

                  }
              );
              return Center(
                child: Column(children: <Widget>[
                  Image.network('https://pokeres.bastionbot.org/images/pokemon/$idString.png', height: 200,),
                  Text(pokemon.name),
                  // Text(pokemon.id.toString()),
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