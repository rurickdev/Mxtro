import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:metroapp/models/index.dart';
import 'package:metroapp/widgets/contiguaswidget.dart';

//ToDo: Hacer privada la API Key de Google Maps
class EstacionScreen extends StatelessWidget{

  final ObjetoSuperEstacion estacion;
  final Linea linea;

  EstacionScreen({this.estacion, this.linea});

  List<Widget> estacionesContiguas(BuildContext context){

    List<Widget> contiguas = [];

    int posicion = linea.listaEstacionTransbordos.indexOf(estacion);

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
              Text(linea.listaEstacionTransbordos.last.nombre),
            ],
          ),
        ],
      ));
      contiguas.add(ContiguaWidget(linea, linea.listaEstacionTransbordos[1]));
      return contiguas;
    }
    if (posicion == linea.listaEstacionTransbordos.length-1){
      contiguas.add(ContiguaWidget(linea, linea.listaEstacionTransbordos.last));
      contiguas.add(Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Icon(Icons.arrow_back),
              Text(linea.listaEstacionTransbordos.first.nombre),
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
    contiguas.add(ContiguaWidget(linea, linea.listaEstacionTransbordos[posicion-1]));
    contiguas.add(Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Icon(Icons.arrow_back),
            Text(linea.listaEstacionTransbordos.first.nombre),
          ],
        ),
        Text('Direccion'),
        Column(
          children: <Widget>[
            Icon(Icons.arrow_forward),
            Text(linea.listaEstacionTransbordos.last.nombre),
          ],
        ),
      ],
    ));
    contiguas.add(ContiguaWidget(linea, linea.listaEstacionTransbordos[posicion+1]));
    return contiguas;
  }

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
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black54,
                  blurRadius: 1.0
                ),
              ]
            ),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height/3,
            child: GoogleMap(
              options: GoogleMapOptions(
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
                      zoom: 15.5,
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            Text(linea.nombre, style: TextStyle(color: Colors.black45),),
                            Text('Ubicacion geografica', style: TextStyle(color: Colors.black45),),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Text('Informacion sobre la estacion'),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Estaciones Aledañas', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: estacionesContiguas(context),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}