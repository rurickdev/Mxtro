import 'package:flutter/material.dart';
import '../../models/sistema.dart';
import 'linea_widget.dart';

class LineasEstacionesWidget extends StatelessWidget{

  final int sistema;
  final List<Sistema> sistemas;

  LineasEstacionesWidget({this.sistema, this.sistemas});

  @override
  Widget build(BuildContext context) {
    if ( sistemas[sistema].numeroLineas < 2){
      return GridView.count(
        crossAxisCount: 3,
        children: List.generate(sistemas[sistema].listaLineas[0].estaciones.length, (index){
          return InkWell(
            child: Column(
              children: <Widget>[
                //Image.asset(sistemas[sistema].listaLineas[0].estaciones[index].simbolo, height: 70,),
                Placeholder(color: Color(sistemas[sistema].listaLineas[0].color),),
                Text(sistemas[sistema].listaLineas[0].estaciones[index].nombre)
              ],
            )
          );
        }),
      );
    }else{
      return ListView.builder(
        scrollDirection: Axis.vertical,
        //Numero de lineas del sistema de transporte
        itemCount: sistemas[sistema].numeroLineas,
        //Construye la lista con cada una de las lineas del sistema
        itemBuilder: (context, index){
          return LineaWidget(sistemas[sistema].listaLineas[index]);
        },
      );
    }
  }

}