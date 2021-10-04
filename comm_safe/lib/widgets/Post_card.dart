import 'package:comm_safe/models/models.dart';
import 'package:flutter/material.dart';

//Positioned(child: _PostDescription(posts.detalle), top: 60, left: 25, right: 25),

 //Positioned(child: _Backgroundimage(posts.picture), top: 130, left: 25, right: 25, bottom: 0)

class PostCard extends StatelessWidget {


  final Post posts;

  const PostCard({
    Key key, 
    this.posts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15 ),
      child: Container(
        
        margin: EdgeInsets.only(top: 30, bottom: 20),
        width: double.infinity,
        decoration: _borderStyle(),
        child: Stack(
          children: [

            Positioned(child: _PostTitle(posts.titulo), top: 0, left: 0, right: 50,),

            Container(

              margin: EdgeInsets.all(10),

              child: Column(children:[ 
              
              SizedBox(height: 60),
              
              _PostDescription(posts.detalle),
              
              SizedBox(height: 20),
              
              _Backgroundimage(posts.picture)
            
                      ],
                      ),
            ),
        ]
        )
      ),
    );
  }

  BoxDecoration _borderStyle() => BoxDecoration(

    color: Colors.white,
    borderRadius: BorderRadius.circular(10),
    boxShadow: [
      BoxShadow(
        color: Colors.black26,
        offset: Offset(0,5),
        blurRadius: 10
      )
    ]

  );
}


class _PostTitle extends StatelessWidget {

  final titulo;

  const _PostTitle(this.titulo);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: 
        Center(
          child: Text('$titulo', 
            style: TextStyle(color: Colors.white, fontSize: 18, fontStyle: FontStyle.italic),textAlign: TextAlign.center),
        ),
        
        decoration: 
        BoxDecoration(color: Colors.lightBlue.shade300, 
        borderRadius: BorderRadius.only( bottomRight: Radius.circular(20))
        ),
        
        height: 50
        
    );
  }
}

class _PostDescription extends StatelessWidget {

  final String descripcion;

  const _PostDescription( this.descripcion);

  @override
  Widget build(BuildContext context) {
    return Container(

      child: Center(
        child: Text('$descripcion', 
        textAlign: TextAlign.center, 
        style: TextStyle(fontSize: 16),)
        ),
      
      decoration: 
      BoxDecoration(border: Border.all(width: 0.7,color: Colors.grey.shade400), 
      borderRadius: BorderRadius.circular(10)
      ),
      height: 100,
      //margin: const EdgeInsets.only(bottom: 175),

    );
  }
}


class _Backgroundimage extends StatelessWidget {
  final String url;

  const _Backgroundimage( this.url);
  
  @override
  Widget build(BuildContext context) {



    return Container(
        height: 300,
          child: url == null
          ? Image(
            image: AssetImage('assets/no-image.png'), 
            fit: BoxFit.cover)
          : FadeInImage(
            placeholder: AssetImage('assets/1.gif'),
            image: NetworkImage(url),
            fit: BoxFit.contain,
          ),
      );
  }
}


