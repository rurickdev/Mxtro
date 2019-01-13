import 'package:flutter/material.dart';
import 'package:metroapp/screens/estacionscreen.dart';
import 'package:metroapp/models/index.dart';

class ContiguaWidget extends StatelessWidget{

  final ObjetoSuperEstacion estacion;
  final Linea linea;

  ContiguaWidget(this.linea, this.estacion);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => EstacionScreen(estacion: estacion, linea: linea,)),
        );
      },
      child: Container(
        child: Column(
          children: <Widget>[
            Image.asset(estacion.simbolo, scale: 1.9,),
            //Text(estacion.nombre),
          ],
        ),
      ),
    );
  }

}