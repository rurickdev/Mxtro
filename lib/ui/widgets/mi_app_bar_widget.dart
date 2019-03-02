import 'package:flutter/material.dart';
import 'package:community_material_icon/community_material_icon.dart';
import '../../utils/metro_app_font_icons.dart';
import '../../models/superestacion.dart';
import '../../models/sistema.dart';
import '../screens/search_screen.dart';
import '../screens/ruta_screen.dart';
import '../screens/test_screen.dart';

class MiAppBar extends AppBar {
  MiAppBar(
      {Key key,
      Widget titulo,
      BuildContext context,
      List<SuperEstacion> estaciones,
      Sistema sistema})
      : super(
          key: key,
          title: titulo,
          actions: <Widget>[
            BotonRuta(),
            BotonBuscar(estaciones),
            BotonTest(sistema),
          ],
        );
}

class BotonBuscar extends StatelessWidget {
  final List<SuperEstacion> estaciones;

  BotonBuscar(this.estaciones);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'BotonBuscar',
      child: IconButton(
        icon: Icon(
          CommunityMaterialIcons.map_search_outline,
        ),
        onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SearchScreen(
                      estaciones: estaciones,
                    ))),
        //Todo: Traducir este texto
        tooltip: 'Buscar Estacion',
      ),
    );
  }
}

class BotonRuta extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(MetroAppFont.icon_actionbar_ruta),
      onPressed: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => RutaScreen())),
      //Todo: Traducir este texto
      tooltip: 'Generar Ruta',
    );
  }
}

class BotonTest extends StatelessWidget {
  final Sistema sistema;

  BotonTest(this.sistema);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(CommunityMaterialIcons.test_tube),
      onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => TestScreen(
                    sistema: sistema,
                  ))),
      //Todo: Traducir este texto
      tooltip: 'Funcion Experimental',
    );
  }
}
