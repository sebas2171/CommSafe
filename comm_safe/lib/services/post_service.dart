import 'package:flutter/material.dart';

class PostService with ChangeNotifier{

  List headlines;

  PostService(){

    this.getTopheadlines();
  }


  getTopheadlines(){

    print('cargando ... ');
    
  }

}