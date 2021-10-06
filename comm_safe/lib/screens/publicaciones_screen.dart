import 'package:comm_safe/models/models.dart';
import 'package:comm_safe/screens/screens.dart';
import 'package:comm_safe/services/services.dart';
import 'package:comm_safe/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final postService = Provider.of<PostService>(context);

    if (postService.isLoading) {
      return LoadingScreen();
    } else {
      return Scaffold(
        body: ListView.builder(
          itemCount: postService.posts.length,
          //el metodo PostCard() se encuentra dentro de la carpeta widgets en el archivo Post_card.dart
          itemBuilder: (BuildContext context, int index) =>
              PostCard(posts: postService.posts[index]),
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              postService.selectedPost = new Post(titulo: '', detalle: '');

              Navigator.pushNamed(context, 'post');
            }),
      );
    }
  }
}
