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
import 'package:photo_view/photo_view.dart';
import 'package:community_material_icon/community_material_icon.dart';
import '../../utils/metro_app_font_icons.dart';
import '../../models/sistema.dart';
import '../../models/superestacion.dart';
import '../widgets/system_info_widget.dart';
import '../widgets/lineas_estaciones_widget.dart';
import '../widgets/mi_drawer_widget.dart';
import '../widgets/mi_app_bar_widget.dart';
import '../widgets/news_widget.dart';

class SistemaScreen extends StatefulWidget{

  final int idSistema;
  final List<Sistema> sistemas;

  SistemaScreen(this.idSistema, this.sistemas);

  @override
  _SistemaScreenState createState() => _SistemaScreenState();
}

class _SistemaScreenState extends State<SistemaScreen>{

  List<Sistema> sistemas;
  int idSistema;
  List<SuperEstacion> estaciones = [];

  Color colorSistema;
  Color colorSistemaSecundario;

  //indice para BottomNavigationBar
  static int _indexElegido = 1;
  //Widgets a mostrar segun el indice del BottomNavBar
  Widget body;

  @override
  void initState() {
    super.initState();
    sistemas = widget.sistemas;
    idSistema = widget.idSistema;
    body = bottomBarOptions(_indexElegido);
    for (var sistema in sistemas){
      for (var linea in sistema.listaLineas){
        estaciones.addAll(linea.estaciones);
      }
    }
    colorSistema = Color(sistemas[widget.idSistema].colorPrimario);
    colorSistemaSecundario = Color(sistemas[widget.idSistema].colorSecundario);
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        primaryColor: Color(sistemas[idSistema].colorPrimario),
        accentColor: Color(sistemas[idSistema].colorSecundario),
        primaryTextTheme: TextTheme(title: TextStyle(color: Color(sistemas[idSistema].colorSecundario))),
        primaryIconTheme: IconThemeData(color: Color(sistemas[idSistema].colorSecundario),),
      ),
      child: Scaffold(
        //Action Bar con 2 botones, uno para buscar estaciones y otro para generar una ruta
        appBar: MiAppBar(titulo: Text(sistemas[widget.idSistema].nombre), context: context, estaciones: estaciones, sistema: sistemas[widget.idSistema],),
        drawer: MiDrawer(sistemas),
        body: Center(
          //child: _opcionesBottomBar.elementAt(_indexElegido),
          child: body,
        ),
        bottomNavigationBar: miBottomBar(),
      ),
    );
  }

  BottomNavigationBar miBottomBar (){

    Color colorIconos;

    if(colorSistema == Color(0xFFFFFFFF)){
      colorIconos = colorSistemaSecundario;
    }else{
      colorIconos = colorSistema;
    }

    //ToDo: Traducir los textos de los botones de la BottomNavBar
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(MetroAppFont.icon_bottombar_estaciones, color: colorIconos,),
          title: Text('Lineas y Estaciones', style: TextStyle(color: colorIconos),),
        ),
        BottomNavigationBarItem(
          icon: Icon(CommunityMaterialIcons.map, color: colorIconos,),
          activeIcon: Icon(CommunityMaterialIcons.map_outline, color: colorIconos,),
          title: Text('Mapa', style: TextStyle(color: colorIconos),)
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.info, color: colorIconos,),
          activeIcon: Icon(Icons.info_outline, color: colorIconos,),
          title: Text('Informacion', style: TextStyle(color: colorIconos),)
        ),
        BottomNavigationBarItem(
          icon: Icon(CommunityMaterialIcons.newspaper, color: colorIconos,),
          title: Text('Noticias', style: TextStyle(color: colorIconos),)
        ),
      ],
      currentIndex: _indexElegido,
      fixedColor: colorIconos,
      onTap: (int indice){
        setState((){
          _indexElegido = indice;
          body = bottomBarOptions(_indexElegido);
        });
      },
    );
  }

  Widget bottomBarOptions(int opcion) {
    switch (opcion){
      case 0:
        return LineasEstacionesWidget(sistema: idSistema, sistemas: sistemas,);
        //return lineasEstaciones;
        break;
      case 1:
        return PhotoView(
          backgroundDecoration: BoxDecoration(color: Colors.white),
          imageProvider: AssetImage(sistemas[idSistema].mapa),
          minScale: 0.160,
          maxScale: 0.99,
        );
        break;
      case 2:
        return SystemInfo();
        break;
      case 3:
        return NewsWidget();
        break;
      default:
        break;
    }
    return null;
  }
}
