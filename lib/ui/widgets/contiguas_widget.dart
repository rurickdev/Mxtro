import 'package:flutter/material.dart';
import '../screens/estacion_screen.dart';
import '../../models/index.dart';

class ContiguaWidget extends StatelessWidget{

  final SuperEstacion estacion;

  ContiguaWidget(this.estacion);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => EstacionScreen(estacion: estacion,)),),
      child: Container(
        child: Column(
          children: <Widget>[
            Image.asset(estacion.simbolo, scale: 1.9,),
          ],
        ),
      ),
    );
  }

}