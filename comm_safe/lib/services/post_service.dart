import 'dart:convert';
import 'package:comm_safe/models/models.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PostService with ChangeNotifier{

  final String _baseUrl = 'commsafe-cbacc-default-rtdb.firebaseio.com';
  final List<Post> posts = [];
  Post selectedPost;
  bool isLoading = true;
  bool isSaving = false;

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

    this.isLoading = false;
    notifyListeners();

    return this.posts;

  }

  Future saveOrCreatePost(Post post) async{

    isSaving = true;
    notifyListeners();


    if (post.id == null){

      await this.createPost(post);

    }
    else {
      await this.updatePost(post);
    }


    isSaving = false;
    notifyListeners();

  }

  Future<String> updatePost(Post post)async{
    
    final url = Uri.https(_baseUrl, 'posts/${post.id}.json');
    final resp = await http.put( url, body: post.toJson());
    final decoderData = resp.body;

    final index = this.posts.indexWhere((element) => element.id == post.id);
    this.posts[index] = post;

    return post.id;

  }


  Future<String> createPost(Post post)async{
    
    final url = Uri.https(_baseUrl, 'posts.json');
    final resp = await http.post( url, body: post.toJson());
    final decoderData = json.decode(resp.body);

    post.id = decoderData ['name'];

    this.posts.add(post);

    return post.id;

  }



}