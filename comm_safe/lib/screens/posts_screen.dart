import 'package:comm_safe/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: SingleChildScrollView(
        child: Column(
          children: [

            Stack(

              children: [

                PostImage(),
                Positioned(
                  child: IconButton(
                  onPressed: () => Navigator.of(context).pop(), 
                  icon: Icon(Icons.arrow_back_ios, size: 40, color: Colors.white)),
                  top: 60,
                  left: 20,
                  
                  ),

                Positioned(
                  child: IconButton(
                  onPressed: () {}, 
                  icon: Icon(Icons.camera_alt_rounded, size: 40, color: Colors.white)),
                  top: 60,
                  right: 20,
                  
                  )

              ],

            ),

            _PostForm(),

            SizedBox(height: 100),


          ],)
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save_outlined),
        onPressed: (){},
      )


    );
  }
}

class _PostForm extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        width: double.infinity,
        decoration: _buildBoxDecoration(),
        child: Form(
          child: Column(
            children: [
              SizedBox(height: 10),

              TextField(
                maxLength: 35,
                decoration: InputDecoration(
                  
                  enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue)),
                  
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: 2,
                    ),
                  ),
                  
                  labelStyle: TextStyle(color: Colors.grey),

                  hintText: 'Titulo',
                  labelText: 'Titulo de la publicacion'

              ),
              ),

              SizedBox(height: 30),
              

              TextField(
                maxLength: 200 ,
                maxLines: null,
                decoration: InputDecoration(
                  labelText: 'Descripcion de lo sucedido',
                  border: OutlineInputBorder(),
                  
                ),
               
                ),

              Center(child: SizedBox(height: 20, child: Text('Especifique el tipo de inseguridad:', textAlign: TextAlign.center))),
              
              _CheckForm()


              
              
            ],
          ),
        ),    
      ),
    );
  }


  BoxDecoration _buildBoxDecoration() => BoxDecoration(

    color: Colors.white,
    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25)),
    boxShadow: [

      BoxShadow(
        color: Colors.black.withOpacity(0.05),
        offset: Offset(0,5),
        blurRadius: 10

      )

    ]
  );
}

class _CheckForm extends StatefulWidget {
  
  @override
  __CheckFormState createState() => __CheckFormState();
}

class __CheckFormState extends State<_CheckForm> {
   bool value = false;
     final notification = [
    
    CheckBoxState(title: 'Robo a mano armada'),
    CheckBoxState(title: 'Robo a motociclista'),
    CheckBoxState(title: 'Accidente de transito'),
    CheckBoxState(title: 'Riña'),
    CheckBoxState(title: 'Altercado publico')

  ];

  @override
  Widget build(BuildContext context) {
    return 
    Column(
      children:[ 

        ... notification.map(buildbox).toList()
      ]
    );
  }
  
  Widget buildbox(CheckBoxState checkbox) => CheckboxListTile(
        value: checkbox.value,
        controlAffinity: ListTileControlAffinity.leading,
        title: Text(checkbox.title),
        onChanged: (bool value) => setState(() => checkbox.value = value),
      );
}

class CheckBoxState{
  
  final String title;
  bool value;
  CheckBoxState({this.title, this.value = false});

}