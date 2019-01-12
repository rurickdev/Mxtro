import 'package:flutter/material.dart';
import 'package:metroapp/models/index.dart';

class EstacionScreen extends StatelessWidget{

  final ObjetoSuperEstacion estacion;

  EstacionScreen({this.estacion});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Metro', style: TextStyle(color: Colors.white),),
        automaticallyImplyLeading: true,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.share), onPressed: (){}),
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 200,
            color: Colors.pink,
          ),
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Image(
                    image: AssetImage(estacion.simbolo),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(8.0, 0, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(estacion.nombre, style: TextStyle(fontWeight: FontWeight.bold),),
                        Text(estacion.lineaId, style: TextStyle(color: Colors.grey),),
                      ],
                    ),
                  ),
                ],
              ),
              Text('Aqui va la direccion de la estacion'),
              Text('Estaciones aledañas'),
              Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text('Direccion A'),
                      Image(
                        image: AssetImage('graphics/imagenes_estaciones/metro/linea_a/agricola_oriental.png'),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text('Direccion B'),
                      Image(
                        image: AssetImage('graphics/imagenes_estaciones/metro/linea_1/zaragoza.png'),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text('Direccion C'),
                      Image(
                        image: AssetImage('graphics/imagenes_estaciones/metro/linea_5/hangares.png'),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text('Direccion D'),
                      Image(
                        image: AssetImage('graphics/imagenes_estaciones/metro/linea_9/puebla.png'),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

}