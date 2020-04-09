import 'package:flutter/material.dart';
import 'package:pokes/pokemon_model.dart';

class FavoliteList extends StatefulWidget {

  @override
  _FavoriteListState createState() => _FavoriteListState();
}

class _FavoriteListState extends State<FavoliteList> {
  List<Pokemon> favorites = [
    Pokemon(id: 1, name: "f"),
    Pokemon(id: 2, name: "h"),
    Pokemon(id: 3, name: "r"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: favorites.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              onTap: () {},
              title: Text(favorites[index].name),
              )
          );
        }
      )
    );
  }
}