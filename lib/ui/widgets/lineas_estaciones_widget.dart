import 'package:flutter/material.dart';
import '../../models/sistema.dart';
import 'linea_widget.dart';

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
        return TwoLinesOrLess(
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
            return LineaWidget(sistema.listaLineas[index]);
          },
        );
    }
  }
}

//Widget para mostrar sistemas con pocas lineas
class TwoLinesOrLess extends StatelessWidget {
  final Sistema sistema;

  TwoLinesOrLess({@required this.sistema});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: EdgeInsets.only(top: 20),
      crossAxisCount: 3,
      children:
          List.generate(sistema.listaLineas[0].estaciones.length, (index) {
        return InkWell(
          child: Column(
            children: <Widget>[
              //Image.asset(sistema.listaLineas[0].estaciones[index].simbolo, height: 70,),
              Container(
                  width: 70,
                  height: 70,
                  child: Placeholder(
                    color: Color(sistema.listaLineas[0].color),
                  )),
              Text(sistema.listaLineas[0].estaciones[index].nombre)
            ],
          ),
        );
      }),
    );
  }
}

//Widget que informa que no hay informacion sobre el sistema de transporte elegido
class NoDataBaseInfoFound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.error_outline,
              size: 100,
              color: Colors.grey,
            ),
            //ToDo: Este texto será traducido
            Text(
              'No hay estaciones en la DataBase aun',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
