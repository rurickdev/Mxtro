import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../models/sistema.dart';

class TestScreen extends StatelessWidget{

  final Sistema sistema;

  TestScreen({this.sistema});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text('Funciones Beta'),
      ),
      body: GoogleMap(
        options: GoogleMapOptions(
          cameraPosition: CameraPosition(
              target: LatLng(19.4257912, -99.132911),
              zoom: 11
          ),
        ),
        onMapCreated: (GoogleMapController controller) {
          for (var linea in sistema.listaLineas){
            for (var estacion in linea.estaciones){
              controller.addMarker(
                MarkerOptions(
                  position: estacion.ubiGeo,
                  icon: BitmapDescriptor.fromAsset(estacion.simbolo),
                ),
              );
            }
          }
        },
      ),
    );
  }

}