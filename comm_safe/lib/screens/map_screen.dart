import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'package:comm_safe/models/models.dart';
import 'package:comm_safe/services/services.dart';
import 'package:provider/provider.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  static const _initialCameraPosition = CameraPosition(
    target: LatLng(7.11591, -73.11221),
    zoom: 12.5,
  );

  GoogleMapController _googleMapController;

  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        //zoomControlsEnabled: false,
        initialCameraPosition: _initialCameraPosition,
        onMapCreated: (controller) => _googleMapController = controller,
      ),
      bottomNavigationBar: AlertButtom(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black.withOpacity(0.6),
        onPressed: () => _googleMapController.animateCamera(
          CameraUpdate.newCameraPosition(_initialCameraPosition),
        ),
        child: const Icon(Icons.center_focus_strong),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}

class AlertButtom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        height: 160,
        width: double.infinity,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, -5),
          ),
        ]),
        child: Stack(
          children: [
            _Buttom(),
          ],
        ),
      ),
    );
  }
}

class _Buttom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final postService = Provider.of<PostService>(context);
    return Scaffold(
      body: Center(
        child: RaisedButton(
          padding: EdgeInsets.all(15),
          color: Colors.red,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
              side: BorderSide(color: Colors.red)),
          child: Text('Generar Alerta',
              style: TextStyle(
                  fontSize: 30, color: Colors.black.withOpacity(0.6))),
          onPressed: () {
            showDialog(
              context: context,
              builder: (contex) => AlertDialog(
                title: Text('La alerta se ha registrado satisfactoriamente.'),
                content: Text('¿Desea publicar una Noticia?'),
                actions: <Widget>[
                  FlatButton(
                    child: Text('Aceptar', style: TextStyle(fontSize: 16)),
                    onPressed: () {
                      postService.selectedPost =
                          new Post(titulo: '', detalle: '');
                      Navigator.pushNamed(context, 'post');
                    },
                  ),
                  FlatButton(
                    child: Text('Cancelar', style: TextStyle(fontSize: 16)),
                    onPressed: () {
                      Navigator.of(context).pop('Cancel');
                    },
                  ),
                ],
              ),
            ).then((result) {});
          },
        ),
      ),
    );
  }
}
