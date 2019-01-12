/// Hecho por Rurick Maqueo Poisot
/// mail: rurick.mpoisot@gmail.com
/// github: github.com/skintigth
///
/// MetroScreen es la pantalla que se ve al elegir "Metro" en el drawer
/// consiste de una ActionBar con el boton del Drawer, titulo y 2 Actions,
/// y una BottomNavigationBar con 4 botones:
///   Estaciones: Muestra las estaciones de las lineas, permite filtrar por linea
///   Mapa Linea: Muestra el mapa del Metro CDMX, es una imagen
///   Mapa Calle: Muestra el mapa del metro en Google Maps
///   Info: Muestra informacion sobre el sistema Metro
///

import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:photo_view/photo_view.dart';
import 'package:metroapp/menus/index.dart';
import 'package:metroapp/widgets/widgetinfo.dart';
import 'package:metroapp/widgets/widgetlistaestaciones.dart';
import 'package:metroapp/widgets/widgetdrawer.dart';
import 'package:metroapp/utils/metro_app_font_icons.dart';

class MetroScreen extends StatefulWidget{

  @override
  _MetroScreenState createState() => _MetroScreenState();
}

class _MetroScreenState extends State<MetroScreen>{

  final _scaffolKey = GlobalKey<ScaffoldState>();

  //Lista de opciones para la [AppBar]
  static List<OptionsMenu> opciones = [
    OptionsMenu(texto: 'Generar Ruta',icono: MetroAppFont.icon_actionbar_ruta),
    OptionsMenu(texto: 'Buscar Estacion',icono: Icons.search),
    OptionsMenu(texto: 'Abrir en Google Maps',icono: Icons.map),
  ];

  final String _titulo = 'Metro'; //Titulo Appbar
  int _indexElegido = 1; //indice para BottomNavigationBar
  final _opcionesWidget = [ //Widgets a mostrar segun el indice del BottomNavBar
    ListaEstacionesTabWidget(),
    PhotoView(
      backgroundDecoration: BoxDecoration(color: Colors.white),
      imageProvider: AssetImage('graphics/imagenes_mapas/mapa_metro_cdmx.jpg'),
      minScale: 0.160,
      maxScale: 0.99,
    ),
    InfoWidget(),
    //Web view que muestra el feed de twitter en google maps
    WebviewScaffold(
      url: 'https://twitter.com/MetroCDMX',
      hidden: true,
    ),
  ];

  //Maneja las opciones seleccionadas del app bar
  OptionsMenu _opcionElegida = opciones[0];
  void _seleccion (OptionsMenu opcion){
    setState(() {
      _opcionElegida = opcion;
      if (_opcionElegida == opciones[2]){
        _openMap();
      }else{
        final snackBar = SnackBar(
          content: Text(_opcionElegida.texto),
          duration: Duration(seconds: 2),
        );
        _scaffolKey.currentState.showSnackBar(snackBar);
      }
    });
  }

  //Abre el mapa en google maps
  _openMap() async {
    const url = 'https://www.google.com/maps/d/u/0/viewer?mid=1GA-Gp70Kg2S5QTWBsWkAZwg_ZYaO6eva';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'No se puede abrir $url';
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: _scaffolKey,
      //Action Bar con 2 botones, uno para buscar estaciones y otro para generar una ruta
      //ToDo: crear algoritmos para las funciones de los botones del ActionBar
      appBar: AppBar(
        title: Text(_titulo),
        actions: <Widget>[
          IconButton(
            icon: Icon(opciones[0].icono),
            onPressed: (){
              _seleccion(opciones[0]);
            },
            tooltip: opciones[0].texto,
            color: Colors.white,
          ),
          IconButton(
            icon: Icon(opciones[1].icono),
            onPressed: (){
              _seleccion(opciones[1]);
            },
            tooltip: opciones[1].texto,
            color: Colors.white,
          ),
          PopupMenuButton<OptionsMenu>(
            onSelected: _seleccion,
            itemBuilder: (BuildContext context){
              return opciones.skip(2).map((OptionsMenu opcion){
                return PopupMenuItem<OptionsMenu>(
                  value: opcion,
                  child: Text(opcion.texto),
                );
              }).toList();
            },
          ),
        ],
      ),
      drawer: MiDrawer(),
      body: Center(
        child: _opcionesWidget.elementAt(_indexElegido),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(MetroAppFont.icon_bottombar_estaciones, color: Colors.deepOrange,),
              title: Text('Estaciones', style: TextStyle(color: Colors.deepOrange),),
          ),
          BottomNavigationBarItem(
              icon: Icon(MetroAppFont.icon_bottombar_mapalineas, color: Colors.deepOrange,),
              title: Text('Mapa Lineas', style: TextStyle(color: Colors.deepOrange),)
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.info_outline, color: Colors.deepOrange,),
              title: Text('Informacion', style: TextStyle(color: Colors.deepOrange),)
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.rss_feed, color: Colors.deepOrange,),
              title: Text('Noticias', style: TextStyle(color: Colors.deepOrange),)
          ),
        ],
        currentIndex: _indexElegido,
        fixedColor: Colors.deepOrange,
        onTap: (int indice){
          setState((){
            _indexElegido = indice;
          });
        },
      ),
    );
  }
}
