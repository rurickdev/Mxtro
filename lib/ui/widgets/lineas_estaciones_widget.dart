import 'package:flutter/material.dart';
import '../../models/sistema.dart';
import 'linea_widget.dart';

class LineasEstacionesWidget extends StatelessWidget{

  final int sistema;
  final List<Sistema> sistemas;

  LineasEstacionesWidget({this.sistema, this.sistemas});

  @override
  Widget build(BuildContext context) {
    switch (sistemas[sistema].numeroLineas) {
      case 0:
        return Center(
          child: Container(
            child: Column(children: <Widget>[Icon(Icons.error_outline), Text('No hay estaciones en la DataBase aun')],),
          ),
        );
        break;
      case 1:
        return GridView.count(
          padding: EdgeInsets.only(top: 20),
          crossAxisCount: 3,
          children: List.generate(
              sistemas[sistema].listaLineas[0].estaciones.length, (index) {
            return InkWell(
                child: Column(
                  children: <Widget>[
                    //Image.asset(sistemas[sistema].listaLineas[0].estaciones[index].simbolo, height: 70,),
                    Container(width: 70,
                        height: 70,
                        child: Placeholder(
                          color: Color(sistemas[sistema].listaLineas[0].color),)),
                    Text(
                        sistemas[sistema].listaLineas[0].estaciones[index].nombre)
                  ],
                )
            );
          }),
        );
        break;
      default:
        return ListView.builder(
          scrollDirection: Axis.vertical,
          //Numero de lineas del sistema de transporte
          itemCount: sistemas[sistema].numeroLineas,
          //Construye la lista con cada una de las lineas del sistema
          itemBuilder: (context, index) {
            return LineaWidget(sistemas[sistema].listaLineas[index]);
          },
        );
    }
  }

}