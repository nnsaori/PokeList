import 'dart:convert';

class Pokemon {
  int id;
  String name;

  Pokemon({
    this.name,
    this.id,
  });

  factory Pokemon.fromJson(String str) => Pokemon.fromMap(json.decode(str));
  Pokemon.fromJ(Map<String, dynamic> json)
      : id = json['id'],
       name = json['name'];

  String toJson() => json.encode(toMap());

  factory Pokemon.fromMap(Map<String, dynamic> json) => Pokemon(
        name: json["name"],
        id: json["id"],
  );

  Map<String, dynamic> toMap() => {
    "name": name,
    "id": id,
  };

// // TODO what..
//   Pokemon.fromJson(Map<String, dynamic> json)
//       : id = json['id'],
//        name = json['name'];

//   Map<String, dynamic> toJson() => {
//     'id': id,
//     'name': name
//   };
}