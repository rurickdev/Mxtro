/// Hecho por Rurick Maqueo Poisot
/// mail: rurick.mpoisot@gmail.com
/// github: github.com/skintigth
///

/// El Widget que regresa es un InkWell con:
///   la imagen de la estacion
///   Su nombre
///   Su linea
/// permite hacer Tap a los elementos
///
/// Tambien contiene al final del documento todas las estaciones
/// de todos los sistemas de transporte
///

import 'package:flutter/material.dart';
import 'package:metroapp/ui/screens/estacion_screen.dart';
import 'package:metroapp/models/index.dart';
import 'estacion_info_widget.dart';

class EstacionWidget extends StatelessWidget{

  static const String simboloAuxiliar = 'graphics/sistemas/';

  final Estacion estacion;

  //Constructor
  EstacionWidget(this.estacion,);

  //Genera el widget toucheable con los datos de la estacion.
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 4.0),
        child: InkWell(
          onTap: () => navigateToEstacionScreen(context),
          onLongPress: (){
            showModalBottomSheet(
              context: context,
              builder: (builder){
                return InkWell(
                  onTap: (){
                    Navigator.pop(context);
                    navigateToEstacionScreen(context);
                  },
                  child: EstacionInfoWidget(
                    estacion: estacion,
                  ),
                );
              },
            );
          },
          child: Image.asset(estacion.simbolo),
        ),
    );
  }

  navigateToEstacionScreen(context){
    Navigator.push(context, MaterialPageRoute(builder: (context) => EstacionScreen(estacion: estacion,)));
  }
}

