import 'package:flutter/material.dart';

class Pokemon {
  final int id;
  final String name;

  Pokemon({
    @required this.id,
    @required this.name,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      id: json['id'] as int,
      name: json['name'] as String,
      );
  }
}