import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:metroapp/models/index.dart';
//ToDo: Hacer privada la API Key de Google Maps
class EstacionScreen extends StatelessWidget{

  final ObjetoSuperEstacion estacion;

  EstacionScreen({this.estacion});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Metro', style: TextStyle(color: Colors.white),),
        automaticallyImplyLeading: true,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.share), onPressed: (){}),
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height/3,
            child: GoogleMap(
              options: GoogleMapOptions(
                /*cameraPosition: CameraPosition(
                  zoom: 16,
                  target: LatLng(estacion.latitud, estacion.longitud),
                ),*/
                //ToDo: Convertir en oopciones de pago la interaccion con el mapa
                rotateGesturesEnabled: false,
                scrollGesturesEnabled: false,
                tiltGesturesEnabled: false,
                zoomGesturesEnabled: false,
                myLocationEnabled: false,
                mapType: MapType.normal,
              ),
              onMapCreated: (GoogleMapController controller){
                controller.addMarker(
                  MarkerOptions(
                    position: LatLng(estacion.latitud, estacion.longitud),
                    icon: BitmapDescriptor.fromAsset(estacion.simbolo),
                  ),
                );
                controller.animateCamera(
                  CameraUpdate.newCameraPosition(
                    CameraPosition(
                      target: LatLng(estacion.latitud, estacion.longitud),
                      zoom: 16,
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0),
            width: MediaQuery.of(context).size.width,
            height: (MediaQuery.of(context).size.height - MediaQuery.of(context).size.height/3),
            child:
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Image(
                      image: AssetImage(estacion.simbolo),
                      height: 70,
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(8.0, 0, 0, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(estacion.nombre, style: TextStyle(fontWeight: FontWeight.bold),),
                          Text(estacion.lineaId, style: TextStyle(color: Colors.grey),),
                          Text('Direccion', style: TextStyle(color: Colors.grey),),
                        ],
                      ),
                    ),
                  ],
                ),
                Text('Estaciones aledañas'),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text('Direccion A'),
                        Image(
                          height: 50,
                          image: AssetImage('graphics/imagenes_estaciones/metro/linea_a/agricola_oriental.png'),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text('Direccion B'),
                        Image(
                          height: 50,
                          image: AssetImage('graphics/imagenes_estaciones/metro/linea_1/zaragoza.png'),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text('Direccion C'),
                        Image(
                          height: 50,
                          image: AssetImage('graphics/imagenes_estaciones/metro/linea_5/hangares.png'),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text('Direccion D'),
                        Image(
                          height: 50,
                          image: AssetImage('graphics/imagenes_estaciones/metro/linea_9/puebla.png'),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}