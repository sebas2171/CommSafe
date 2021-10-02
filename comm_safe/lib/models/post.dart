// To parse this JSON data, do
//
//     final post = postFromMap(jsonString);

import 'dart:convert';

class Post {
    Post({
        this.detalle,
        this.picture,
        this.titulo,
    });

    String detalle;
    String picture;
    String titulo;
    String id;

    factory Post.fromJson(String str) => Post.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Post.fromMap(Map<String, dynamic> json) => Post(
        detalle: json["detalle"],
        picture: json["picture"],
        titulo: json["titulo"],
    );

    Map<String, dynamic> toMap() => {
        "detalle": detalle,
        "picture": picture,
        "titulo": titulo,
    };
}
