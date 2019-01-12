//ToDo: Darle uso a este widget para mostrar las lineas donde hace transbordo una correspondencia.

import 'package:flutter/material.dart';

class TransbordoWidgets extends StatelessWidget{

  static const String simboloAuxiliar = 'graphics/imagenes_estaciones/metro/transbordos/';

  //final String linea;
  final String simbolo;
  final String nombre;
  final List<String> lineas;

  TransbordoWidgets({this.simbolo, this.nombre, this.lineas});

  @override
  Widget build(BuildContext context) {
    return InkWell( //Inkwell permite el onTap
      onTap: (){
        print('Taped: estacion $nombre');
      },
      child: Container( //Contenedor para contener los subwidgets
        padding: EdgeInsets.symmetric(
          vertical:8.0,
          horizontal: 8.0,
        ),
        child: Row( //Row para ordenar el contenedor
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Image.asset( //Imagen, muestra el simbolo de la estacion
              simbolo,
              scale: 1.5, //Se escala para que se vea bien
            ),
            //Text(nombre, style: TextStyle(fontWeight: FontWeight.bold),),
            //Text('Transbordo con:\n$lineas')
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Column( //Organiza los textos a mostrar
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(nombre, style: TextStyle(fontWeight: FontWeight.bold),),
                  Text('Transbordo con: $lineas'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
