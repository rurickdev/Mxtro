import 'package:flutter/material.dart';
import '../../models/estacion.dart';
import 'estacion_widget.dart';

class EstacionPagina extends StatelessWidget {

  Estacion estacion;

  EstacionPagina({
    @required this.estacion
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: EstacionesContiguas(siguiente: estacion.siguiente, anterior: estacion.anterior,),
    );
  }
}

class EstacionesContiguas extends StatelessWidget {

  Estacion siguiente;
  Estacion anterior;

  List<Widget> contiguas = [];

  EstacionesContiguas({
    @required this.siguiente,
    @required this.anterior,    
  });

  List<Widget> llenarContiguas(BuildContext context){

    if(anterior != null){
      contiguas.add(EstacionWidget(anterior));
    }else{
      contiguas.add(SizedBox(width: MediaQuery.of(context).size.width/4,));
    }
    
    if(siguiente != null){
      contiguas.add(EstacionWidget(siguiente));
    }else{
      contiguas.add(SizedBox(width: MediaQuery.of(context).size.width/4,));
    }

    contiguas.insert(1, Text('Texto de prueba'));

    return contiguas;
  }

  @override
  Widget build(BuildContext context) {

    List<Widget> contiguasLocal = llenarContiguas(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        //ToDo: Este texto será traducido
        Text('Estaciones Aledañas', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: contiguasLocal,
        ),
      ],
    );
  }
}