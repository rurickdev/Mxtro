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
import '../widgets/drawer/drawer_widget.dart';
import '../widgets/mi_app_bar_widget.dart';
import '../widgets/news_widget.dart';

class SistemaScreen extends StatefulWidget {
  final List<Sistema> sistemas;
  final Sistema sistema;

  SistemaScreen(this.sistemas, this.sistema);

  @override
  _SistemaScreenState createState() => _SistemaScreenState();
}

class _SistemaScreenState extends State<SistemaScreen> {
  List<Sistema> sistemas;
  List<SuperEstacion> estaciones = [];
  Sistema sistema;

  Color colorSistema;
  Color colorSistemaSecundario;

  //indice para BottomNavigationBar
  static int _indexElegido = 0;
  //Widgets a mostrar segun el indice del BottomNavBar
  Widget body;

  @override
  void initState() {
    super.initState();
    sistema = widget.sistema;
    sistemas = widget.sistemas;
    body = bottomBarOptions(_indexElegido);
    for (var sis in sistemas) {
      for (var linea in sis.listaLineas) {
        estaciones.addAll(linea.estaciones);
      }
    }
    colorSistema = Color(sistema.colorPrimario);
    colorSistemaSecundario = Color(sistema.colorSecundario);
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        primaryColor: colorSistema,
        accentColor: colorSistemaSecundario,
        primaryTextTheme:
            TextTheme(title: TextStyle(color: colorSistemaSecundario)),
        primaryIconTheme: IconThemeData(
          color: colorSistemaSecundario,
        ),
      ),
      child: Scaffold(
        //Action Bar con 3 botones:
        // -buscar estaciones
        // -generar una ruta
        // -funciones experimentales
        appBar: MiAppBar(
          titulo: Text(sistema.nombre),
          context: context,
          estaciones: estaciones,
          sistema: sistema,
        ),
        drawer: DrawerWidget(sistemas),
        body: Center(
          child: body,
        ),
        bottomNavigationBar: miBottomBar(),
      ),
    );
  }

  BottomNavigationBar miBottomBar() {
    //color de los iconos de la NavBar segun el color del sistema actual
    Color colorIconos;

    colorSistema == Color(0xFFFFFFFF)
        ? colorIconos = colorSistemaSecundario
        : colorIconos = colorSistema;

    //ToDo: Traducir los textos de los botones de la BottomNavBar
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            MetroAppFont.icon_bottombar_estaciones,
            color: Colors.black,
          ),
          activeIcon: Icon(
            MetroAppFont.icon_bottombar_estaciones,
            color: colorIconos,
          ),
          title: Text(
            'Lineas y Estaciones',
            style: TextStyle(color: colorIconos),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            CommunityMaterialIcons.map_outline,
            color: Colors.black,
          ),
          activeIcon: Icon(
            CommunityMaterialIcons.map,
            color: colorIconos,
          ),
          title: Text(
            'Mapa',
            style: TextStyle(color: colorIconos),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.info_outline,
            color: Colors.black,
          ),
          activeIcon: Icon(
            Icons.info,
            color: colorIconos,
          ),
          title: Text(
            'Informacion',
            style: TextStyle(color: colorIconos),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            CommunityMaterialIcons.newspaper,
            color: Colors.black,
          ),
          activeIcon: Icon(
            CommunityMaterialIcons.newspaper,
            color: colorIconos,
          ),
          title: Text(
            'Noticias',
            style: TextStyle(color: colorIconos),
          ),
        ),
      ],
      currentIndex: _indexElegido,
      fixedColor: colorIconos,
      onTap: (int indice) {
        setState(() {
          _indexElegido = indice;
          body = bottomBarOptions(_indexElegido);
        });
      },
    );
  }

  Widget bottomBarOptions(int opcion) {
    switch (opcion) {
      case 0:
        return LineasEstacionesWidget(
          sistema: sistema,
        );
        break;
      case 1:
        return PhotoView(
          backgroundDecoration: BoxDecoration(color: Colors.white),
          imageProvider: AssetImage(sistema.mapa),
          minScale: 0.160,
          maxScale: 0.99,
        );
        break;
      case 2:
        //ToDo: este Widget debe recibir un [Sistema] para mostrar la info de dicho sistema
        return SystemInfo();
        break;
      case 3:
        //ToDo: este widget debe recibir el [TwitterUser] del sistema para mostrar su feed
        return NewsWidget();
        break;
      default:
        break;
    }
    return null;
  }
}
