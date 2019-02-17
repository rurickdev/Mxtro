import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../models/linea.dart';
import '../../models/estacion.dart';

class MapaLinea extends StatelessWidget {

  Linea linea;
  Estacion estacion;

  MapaLinea({
    @required this.linea,
    this.estacion,
    });

  @override
  Widget build(BuildContext context) {

    double mapZoom = 12;
    LatLng coordenadas = linea.estaciones[linea.estaciones.length~/2].ubiGeo;

    if (estacion != null){
      mapZoom = 15;
      coordenadas =estacion.ubiGeo;
    }

    return Container(
      height: MediaQuery.of(context).size.height/2,
      child: GoogleMap(
        options: GoogleMapOptions(
          cameraPosition: CameraPosition(
            target: coordenadas,
            //target: LatLng(linea.estaciones[linea.estaciones.length~/2].latitud, linea.estaciones[linea.estaciones.length~/2].longitud),
            zoom: mapZoom,
          ),
        ),
        onMapCreated: (GoogleMapController controller){
          for (var estacion in linea.estaciones){
            controller.addMarker(
              MarkerOptions(
                position: estacion.ubiGeo,
                //position: LatLng(estacion.latitud, estacion.longitud),
                icon: BitmapDescriptor.fromAsset(estacion.simbolo),
              ),
            );
          }
        },
      ),
    );
  }
}