///
/// InfoWidget es el conjunto de widgets a mostrar
/// En la pesataña info
///

import 'package:flutter/material.dart';
//ToDo: Detallar este widget

class SystemInfo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Card(
          child: Container(
            padding: EdgeInsets.all(8.0),
            width: double.infinity,
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.attach_money, color: Colors.deepOrange,),
                  title: Text('Costo:'),
                  subtitle: Text('\$5.00 mxn por boleto'),
                ),
                Divider(

                ),
                ListTile(
                  leading: Icon(Icons.money_off, color: Colors.deepOrange,),
                  title: Text('Acceso Gratuito:'),
                  subtitle: Text('- Adultos mayores\n- Personas con discapacidad\n- Niños menores de 5 años\n- Jóvenes del INJUVE\n- Policías.'),
                ),
              ],
            ),
          ),
        ),
        Card(
          child: Container(
            padding: EdgeInsets.all(8.0),
            width: double.infinity,
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.access_time, color: Colors.deepOrange,),
                  title: Text('Horario de Servicio:'),
                  subtitle: Text('- Días Laborales de 5:00 a 24:00 hrs.\n- Sábados de 6:00 a 24:00 hrs.\n- Domingos y días festivos de 7:00 a 24:00 hrs.'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}