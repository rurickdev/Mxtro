import 'package:flutter/material.dart';
import 'package:share/share.dart';
import '../../models/estacion.dart';
import '../../models/linea.dart';
import '../widgets/mapa_linea_widget.dart';
import '../widgets/estacion_pagina_widget.dart';

//! ToDo: Hacer privada la API Key de Google Maps - Urgente
class EstacionScreen extends StatelessWidget {
  final Linea linea;
  final Estacion estacion;

  EstacionScreen({this.estacion, this.linea});

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController(
      initialPage: estacion.ubicacionEnLinea - 1,
    );

    MapaLinea mapa = MapaLinea(
      linea: linea,
      estacion: estacion,
    );

    String shareText = changeShareText(estacion);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(linea.color),
        title: Text(
          linea.nombre,
          style: TextStyle(color: Colors.white),
        ),
        automaticallyImplyLeading: true,
        actions: <Widget>[
          //Boton de compartir estacion actual
          IconButton(
              icon: Icon(Icons.share),
              onPressed: () {
                Share.share(shareText);
              }),
        ],
      ),
      body: Column(
        children: <Widget>[
          //Mapa con pin de la estacion
          Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3,
              child: mapa),
          Expanded(
            child: PageView.builder(
              controller: pageController,
              onPageChanged: (index) {
                mapa.actualizarCoordenadas(
                  linea.estaciones[index].ubiGeo,
                );
                shareText = changeShareText(linea.estaciones[index]);
                print(linea.estaciones[index]);
              },
              itemCount: linea.estaciones.length,
              itemBuilder: (context, index) {
                return EstacionPagina(
                  estacion: linea.estaciones[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  //Actualiza el texto que compartira la aplicacion al presionar el boton "Share Estacion"
  String changeShareText(Estacion estacion) {
    return '${estacion.nombre} de la ${estacion.linea.nombre}\nhttps://www.google.com/maps/search/?api=1&query=${estacion.latitud},${estacion.longitud}&query_place_id=${estacion.mapsId}';
  }
}
