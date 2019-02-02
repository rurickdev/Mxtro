import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:share/share.dart';
import '../../models/estacion.dart';
import '../widgets/contiguas_widget.dart';
import '../widgets/estacion_info_widget.dart';

//ToDo: Hacer privada la API Key de Google Maps
class EstacionScreen extends StatelessWidget{

  final Estacion estacion;

  EstacionScreen({this.estacion});

  List<Widget> estacionesContiguas(BuildContext context){

    List<Widget> contiguas = [];

    int posicion = estacion.linea.estaciones.indexOf(estacion);

    if (posicion == 0){
      contiguas.add(Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width/3,
          ),
          Text('Direccion'),
          Column(
            children: <Widget>[
              Icon(Icons.arrow_forward),
              Text(estacion.linea.direccionB.nombre),
            ],
          ),
        ],
      ));
      contiguas.add(ContiguaWidget(estacion.linea.estaciones[1]));
      return contiguas;
    }
    if (posicion == estacion.linea.numeroEstaciones-1){
      contiguas.add(ContiguaWidget(estacion.linea.direccionB));
      contiguas.add(Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Icon(Icons.arrow_back),
              Text(estacion.linea.direccionA.nombre),
            ],
          ),
          Text('Direccion'),
          Container(
            width: MediaQuery.of(context).size.width/3,
          ),
        ],
      ));
      return contiguas;
    }
    contiguas.add(ContiguaWidget(estacion.linea.estaciones[posicion-1]));
    contiguas.add(Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Icon(Icons.arrow_back),
            Text(estacion.linea.direccionA.nombre),
          ],
        ),
        Text('Direccion'),
        Column(
          children: <Widget>[
            Icon(Icons.arrow_forward),
            Text(estacion.linea.direccionB.nombre),
          ],
        ),
      ],
    ));
    contiguas.add(ContiguaWidget(estacion.linea.estaciones[posicion+1]));
    return contiguas;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(estacion.linea.color),
        title: Text(estacion.nombre, style: TextStyle(color: Colors.white),),
        automaticallyImplyLeading: true,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.share), onPressed: (){
            Share.share('${estacion.nombre} de la ${estacion.linea.nombre}\nhttps://www.google.com/maps/search/?api=1&query=${estacion.latitud},${estacion.longitud}&query_place_id=${estacion.mapsId}');
          }),
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height/3,
            child: mapaEstacion(),
          ),
          EstacionInfoWidget(
            estacion: estacion,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  //ToDo: Mostrar la informacion de la estacion
                  Text('Informacion sobre la estacion'),
                  estacionesContiguasWidget(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  GoogleMap mapaEstacion(){

    //bool pagado = false;

    return GoogleMap(
      options: GoogleMapOptions(
        //ToDo: Convertir en opcion de pago la interaccion con el mapa
        /*rotateGesturesEnabled: pagado,
        scrollGesturesEnabled: pagado,
        tiltGesturesEnabled: pagado,
        zoomGesturesEnabled: pagado,
        myLocationEnabled: pagado,*/
        cameraPosition: CameraPosition(
          target: estacion.ubiGeo,
          //target: LatLng(estacion.latitud, estacion.longitud),
          zoom: 5
        ),
      ),
      onMapCreated: (GoogleMapController controller){
        controller.addMarker(
          //Marcador con el icono de la estacion
          MarkerOptions(
            position: estacion.ubiGeo,
            //position: LatLng(estacion.latitud, estacion.longitud),
            icon: BitmapDescriptor.fromAsset(estacion.simbolo),
          ),
        );
        controller.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: estacion.ubiGeo,
              //target: LatLng(estacion.latitud, estacion.longitud),
              zoom: 15.5,
            ),
          ),
        );
      },
    );
  }

  Column estacionesContiguasWidget(BuildContext context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        //ToDo: Este texto será traducido
        Text('Estaciones Aledañas', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: estacionesContiguas(context),
        ),
      ],
    );
  }
}