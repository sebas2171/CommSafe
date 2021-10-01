import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15 ),
      child: Container(
        
        margin: EdgeInsets.only(top: 30, bottom: 30),
        width: double.infinity,
        height: 300,
        decoration: _borderStyle(),
        child: Stack(
          children: [

            _Backgroundimage(),

            _Postdetails()

          ],),
    
      ),
    );
  }

  BoxDecoration _borderStyle() => BoxDecoration(

    color: Colors.white,
    borderRadius: BorderRadius.circular(15),
    boxShadow: [
      BoxShadow(
        color: Colors.black26,
        offset: Offset(0,5),
        blurRadius: 10
      )
    ]

  );
}

class _Postdetails extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      color: Colors.lightBlue,
      child: Column(
        children: [
          
        ],),
    );
  }
}

class _Backgroundimage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        width: double.infinity,
        height: 300,
        child: FadeInImage(
          placeholder: AssetImage('assets/1.gif'),
          image: NetworkImage('https://via.placeholder.com/400x300/f6f6f6'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}