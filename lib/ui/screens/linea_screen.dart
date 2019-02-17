import 'package:flutter/material.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../widgets/mapa_linea_widget.dart';
import '../../models/linea.dart';

class LineaScreen extends StatelessWidget{

  final Linea linea;

  LineaScreen({this.linea});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(linea.color),
        title: Text(linea.nombre, style: TextStyle(color: Colors.white),),
        automaticallyImplyLeading: true,
      ),
      body: MapaLinea(linea: linea,),
    );
  }

  // Container mapaLinea(context){
  //   return Container(
  //     height: MediaQuery.of(context).size.height/2,
  //     child: GoogleMap(
  //       options: GoogleMapOptions(
  //         cameraPosition: CameraPosition(
  //           target: linea.estaciones[linea.estaciones.length~/2].ubiGeo,
  //           //target: LatLng(linea.estaciones[linea.estaciones.length~/2].latitud, linea.estaciones[linea.estaciones.length~/2].longitud),
  //           zoom: 12,
  //         ),
  //       ),
  //       onMapCreated: (GoogleMapController controller){
  //         for (var estacion in linea.estaciones){
  //           controller.addMarker(
  //             MarkerOptions(
  //               position: estacion.ubiGeo,
  //               //position: LatLng(estacion.latitud, estacion.longitud),
  //               icon: BitmapDescriptor.fromAsset(estacion.simbolo),
  //             ),
  //           );
  //         }
  //       },
  //     ),
  //   );
  // }
}