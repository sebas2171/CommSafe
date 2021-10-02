import 'dart:convert';
import 'package:comm_safe/models/models.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PostService with ChangeNotifier{

  final String _baseUrl = 'commsafe-cbacc-default-rtdb.firebaseio.com';
  final List<Post> posts = [];
  bool isLoading = true;

  PostService (){

    this.loadPosts();
  }

  Future<List<Post>> loadPosts() async {

    this.isLoading = true;
    notifyListeners();

    final url = Uri.https(_baseUrl, 'posts.json');
    final resp = await http.get( url );

    final Map<String , dynamic> postsMap = json.decode(resp.body);
    
    postsMap.forEach((key, value) {
      
      final tempPost = Post.fromMap(value);
      tempPost.id = key;
      this.posts.add(tempPost);

    });

    //this.isLoading = false;
    notifyListeners();

    return this.posts;

  }



}