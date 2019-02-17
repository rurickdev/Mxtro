import 'package:flutter/material.dart';
import '../widgets/mapa_linea_widget.dart';
import '../../models/linea.dart';

class LineaScreen extends StatelessWidget{

  final Linea linea;

  LineaScreen({this.linea});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(linea.color),
        title: Text(linea.nombre, style: TextStyle(color: Colors.white),),
        automaticallyImplyLeading: true,
      ),
      body: MapaLinea(linea: linea,),
    );
  }
}