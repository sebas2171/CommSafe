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
  GoogleMapController _googleMapController;

  @override
  Widget build(BuildContext context) {
    var userLocation = Provider.of<UserLocation>(context);
    return Scaffold(
      body: userLocation != null
          ? GoogleMap(
              //zoomControlsEnabled: false,
              initialCameraPosition: CameraPosition(
                  target: LatLng(userLocation.latitude, userLocation.longitude),
                  zoom: 15.5),
              onMapCreated: (controller) => _googleMapController = controller,
            )
          : Container(),
      bottomNavigationBar: AlertButtom(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black.withOpacity(0.6),
        onPressed: () => _googleMapController.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
                target: LatLng(userLocation.latitude, userLocation.longitude),
                zoom: 15.5),
          ),
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
    var userLocation = Provider.of<UserLocation>(context);
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
            Align(
              alignment: FractionalOffset.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 10.0),
                child: userLocation != null
                    ? Text(
                        'Localización: ${userLocation.latitude}, ${userLocation.longitude}',
                        style: TextStyle(
                            fontSize: 15, color: Colors.black.withOpacity(0.8)))
                    : Text('Esperando Localización.',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black.withOpacity(0.8))),
              ),
            ),
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
          padding: EdgeInsets.all(10),
          color: Colors.red,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
              side: BorderSide(color: Colors.red)),
          child: Text('Generar Alerta',
              style: TextStyle(
                  fontSize: 28, color: Colors.black.withOpacity(0.6))),
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
                      Navigator.of(context).pop('Cancelar');
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
