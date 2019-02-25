import 'package:flutter/material.dart';
import 'package:share/share.dart';
import '../../models/estacion.dart';
import '../widgets/mapa_linea_widget.dart';
import '../widgets/estacion_pagina_widget.dart';

//! ToDo: Hacer privada la API Key de Google Maps - Urgente
class EstacionScreen extends StatelessWidget{

  final Estacion estacion;

  EstacionScreen({this.estacion});  

  @override
  Widget build(BuildContext context) {

    PageController pageController = PageController(
      initialPage: estacion.ubicacionEnLinea-1,
    );

    MapaLinea mapa = MapaLinea(
      linea: estacion.linea, 
      estacion: estacion,
    );

    String shareText = changeShareText(estacion);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(estacion.linea.color),
        title: Text(estacion.linea.nombre, style: TextStyle(color: Colors.white),),
        automaticallyImplyLeading: true,
        actions: <Widget>[
          //Boton de compartir estacion actual
          IconButton(icon: Icon(Icons.share), onPressed: (){
            Share.share(shareText);
          }),
        ],
      ),
      body: Column(
        children: <Widget>[
          //Mapa con pin de la estacion
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height/3,
            child: mapa
          ),
          Expanded(
            child: PageView.builder(
              controller: pageController,
              onPageChanged: (indice) {
                mapa.actualizarCoordenadas(estacion.linea.estaciones[indice].ubiGeo,);
                shareText = changeShareText(estacion.linea.estaciones[indice]);
                print(estacion.linea.estaciones[indice]);
              },
              itemCount: estacion.linea.estaciones.length,
              itemBuilder: (context, index){
                return EstacionPagina(
                  estacion: estacion.linea.estaciones[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  //Actualiza el texto que compartira la aplicacion al presionar el boton "Share Estacion"
  String changeShareText(Estacion estacionInfo){
    return '${estacionInfo.nombre} de la ${estacionInfo.linea.nombre}\nhttps://www.google.com/maps/search/?api=1&query=${estacionInfo.latitud},${estacionInfo.longitud}&query_place_id=${estacionInfo.mapsId}';

  }
}