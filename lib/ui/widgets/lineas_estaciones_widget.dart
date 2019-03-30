import 'package:flutter/material.dart';
import 'package:community_material_icon/community_material_icon.dart';
import '../../models/sistema.dart';
import 'mensaje_con_icono_widget.dart';
import 'linea_widget.dart';
import 'estacion_widget.dart';

class LineasEstacionesWidget extends StatelessWidget {
  final Sistema sistema;

  LineasEstacionesWidget({
    this.sistema,
  });

  @override
  Widget build(BuildContext context) {
    switch (sistema.numeroLineas) {
      case 0:
        return NoDataBaseInfoFound();
        break;
      case 1:
        return OneLine(
          sistema: sistema,
        );
        break;
      default:
        return ListView.builder(
          scrollDirection: Axis.vertical,
          //Numero de lineas del sistema de transporte
          itemCount: sistema.numeroLineas,
          //Construye la lista con cada una de las lineas del sistema
          itemBuilder: (context, index) {
            return LineaWidget(
              linea: sistema.listaLineas[index],
            );
          },
        );
    }
  }
}

//Widget para mostrar sistemas con pocas lineas
class OneLine extends StatelessWidget {
  final Sistema sistema;

  OneLine({
    @required this.sistema,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(8.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 0.9,
        mainAxisSpacing: 16.0,
        crossAxisSpacing: 16.0,
      ),
      itemCount: sistema.listaLineas[0].estaciones.length,
      itemBuilder: (context, index) {
        return Column(
          children: <Widget>[
            EstacionWidget(
              sistema.listaLineas[0].estaciones[index],
            ),
            Text(sistema.listaLineas[0].estaciones[index].nombre),
          ],
        );
      },
    );
  }
}

//Widget que informa que no hay informacion sobre el sistema de transporte elegido
class NoDataBaseInfoFound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //ToDo: Este texto será traducido
    return MensajeConIcono(
      icono: CommunityMaterialIcons.database_remove,
      mensaje: 'No hay Estaciones en la DataBase aun',
    );
  }
}
