import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../models/linea.dart';
import '../../models/estacion.dart';

class MapaLinea extends StatelessWidget {
  final Linea linea;
  final Estacion estacion;

  MapaLinea({
    @required this.linea,
    this.estacion,
  });

  static GoogleMapController mapController;
  static double mapZoom;

  @override
  Widget build(BuildContext context) {
    mapZoom = 12;
    LatLng coordenadas = linea.estaciones[linea.estaciones.length ~/ 2].ubiGeo;

    if (estacion != null) {
      mapZoom = 15;
      coordenadas = estacion.ubiGeo;
    }

    Set<Marker> listarMarcadores() {
      Set<Marker> marcadores = {};

      for (var estacion in linea.estaciones) {
        marcadores.add(
          Marker(
            markerId: MarkerId(estacion.nombre),
            icon: BitmapDescriptor.fromAsset(estacion.simbolo),
            position: estacion.ubiGeo,
          ),
        );
        // controller.addMarker(
        //   MarkerOptions(
        //     position: estacion.ubiGeo,
        //     icon: BitmapDescriptor.sfromAsset(estacion.simbolo),
        //   ),
        // );
      }
      return marcadores;
    }

    return Container(
      child: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: coordenadas,
          zoom: mapZoom,
        ),
        markers: listarMarcadores(),
      ),
    );
  }

  //Actualiza la posicion de la camara del mapa respecto a las coordenadas de la nueva estacion
  actualizarCoordenadas(LatLng coordenadas) {
    mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: coordenadas,
      zoom: mapZoom,
    )));
  }
}
