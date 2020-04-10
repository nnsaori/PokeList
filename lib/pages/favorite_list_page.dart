import 'package:flutter/material.dart';
import 'package:pokes/pokemon_model.dart';
import 'package:pokes/shared_pref.dart';

class Favorite extends StatefulWidget {
  @override
  FavoritePage createState() {
    return FavoritePage();
  }
}

class FavoritePage extends State<Favorite> {
  SharedPref sharedPref = SharedPref();
  List<Pokemon> favoriteList = [];

_loadSharedPrefs() {
  List<String> jsonList = sharedPref.getStringList("demoList");
  favoriteList = jsonList.map((json) => Pokemon.fromJson(json)).toList();
}
  // _loadSharedPrefs() async {
  //   try {
  //     Pokemon user = Pokemon.fromJson(await sharedPref.read("fav"));
  //     setState(() {
  //       favoriteList = user;
  //     });
  //   } catch (e) {
  //     print("eeeeeeeee");
  //     print(e);
  //     Scaffold.of(context).showSnackBar(SnackBar(
  //         content: new Text("Nothing found!"),
  //         duration: const Duration(milliseconds: 500)));
  //   }
  // }

  @override
  void initState() {
    super.initState();
    _loadSharedPrefs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        child: ListView.builder(
          itemCount: favoriteList.length,
          itemBuilder: (context, i) => ListTile(
            title: Text(favoriteList[i].name)
          ),
        ), onRefresh: () async {},
      ),
    );
  }
}