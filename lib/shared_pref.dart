import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class SharedPref {
  static List<String> store;

  setStringList(String key, List<String> value) async {
    store = value;
    return true;
  } 
  List<String> getStringList(String key) => store;

  // read(String key) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   return json.decode(prefs.getString(key));
  // }

  // save(String key, value) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   prefs.setString(key, json.encode(value));
  // }

  // remove(String key) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   prefs.remove(key);
  // }
}