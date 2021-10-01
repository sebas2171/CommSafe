//import 'package:comm_safe/services/post_service.dart';
import 'package:comm_safe/widgets/widgets.dart';
import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';

class PostScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) => PostCard()
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {}
        ),
        

    ) ;
  }
}