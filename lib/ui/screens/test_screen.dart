import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../models/sistema.dart';

class TestScreen extends StatelessWidget {
  final Sistema sistema;

  TestScreen({
    this.sistema,
  });

  Set<Marker> listarMarcadores() {
    Set<Marker> marcadores = {};

    for (var linea in sistema.listaLineas) {
      for (var estacion in linea.estaciones) {
        marcadores.add(
          Marker(
            markerId: MarkerId(estacion.nombre),
            icon: BitmapDescriptor.fromAsset(estacion.simbolo),
            position: estacion.ubiGeo,
          ),
        );
      }
    }

    return marcadores;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text('Funciones Beta'),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(19.4257912, -99.132911),
          zoom: 11,
        ),
        markers: listarMarcadores(),
      ),
    );
  }
}
