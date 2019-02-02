import 'package:flutter/material.dart';
import 'package:metroapp/models/index.dart';

class EstacionInfoWidget extends StatelessWidget{

  Estacion estacion;

  EstacionInfoWidget({
    @required this.estacion,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(width: 8.0,),
          Image.asset(estacion.simbolo, height: 70,),
          Padding(
            padding: EdgeInsets.fromLTRB(8.0, 0, 0, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(estacion.nombre, style: TextStyle(fontWeight: FontWeight.bold),),
                nombreLinea(estacion.linea),
                Text('Ubicacion geografica', style: TextStyle(color: Colors.black45),),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Text nombreLinea(Linea linea){
    return Text(estacion.linea.nombre, style: TextStyle(color: Colors.black45),);
  }

}