import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15 ),
      child: Container(
        
        margin: EdgeInsets.only(top: 30, bottom: 20),
        width: double.infinity,
        height: 450,
        decoration: _borderStyle(),
        child: Stack(
          children: [

            Positioned(child: _PostTitle(), top: 0, left: 0, right: 50,),

            Positioned(child: _PostDescription(), top: 60, left: 25, right: 25),

            Positioned(child: _Backgroundimage(), top: 130, left: 25, right: 25, bottom: 0)

          ],),
    
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

  @override
  Widget build(BuildContext context) {
    return Container(
        child: 
        Center(
          child: Text('TITULO DE LA PUBLICACION COMMSAFE', 
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

  @override
  Widget build(BuildContext context) {
    return Container(

      child: Center(
        child: Text('breve descripcion de lo sucedido', 
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

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
        child: FadeInImage(
          placeholder: AssetImage('assets/1.gif'),
          image: NetworkImage('https://via.placeholder.com/400x300/f6f6f6'),
          fit: BoxFit.contain,
        ),
    );
  }
}


