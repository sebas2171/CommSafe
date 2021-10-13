// To parse this JSON data, do
//
//     final post = postFromMap(jsonString);

import 'dart:convert';

class Post {
  Post({this.detalle, this.picture, this.titulo, this.id, this.comentarios});
  List<dynamic> comentarios;
  String detalle;
  String picture;
  String titulo;
  String id;

  factory Post.fromJson(String str) => Post.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Post.fromMap(Map<String, dynamic> json) => Post(
        comentarios: json["comentarios"],
        detalle: json["detalle"],
        picture: json["picture"],
        titulo: json["titulo"],
      );

  Map<String, dynamic> toMap() => {
        "comentarios": comentarios,
        "detalle": detalle,
        "picture": picture,
        "titulo": titulo,
      };

  Post copy() => Post(
      comentarios: this.comentarios,
      detalle: this.detalle,
      picture: this.picture,
      titulo: this.titulo,
      id: this.id);
}
