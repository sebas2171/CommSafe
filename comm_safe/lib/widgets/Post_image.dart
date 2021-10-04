import 'package:flutter/material.dart';

class PostImage extends StatelessWidget {

   final String url;
  const PostImage( this.url);
   

  @override
  Widget build(BuildContext context) {
    return Padding(

      padding: EdgeInsets.only(left: 10, right: 10, top: 10),
      child: Container(
    
        decoration: _buildBoxDecoration(),
        width: double.infinity,
        height: 450,
        child: ClipRRect(
          borderRadius: BorderRadius.only( topLeft: Radius.circular(45) , topRight: Radius.circular(45) ),
          
          child: this.url == null
          ? Image(image: AssetImage('assets/no-image.png'), fit: BoxFit.cover) 
          : FadeInImage(
            image: NetworkImage(this.url),
            placeholder: AssetImage('assets/1.gif'),
            fit: BoxFit.cover,
          ),
        ),
        
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => BoxDecoration(

    color: Colors.red,
    borderRadius: BorderRadius.only( topLeft: Radius.circular(45) , topRight: Radius.circular(45) ),
    boxShadow: [

      BoxShadow(
        color: Colors.black.withOpacity(0.05),
        blurRadius: 10,
        offset: Offset(0,5)

      )

    ]

  );
}