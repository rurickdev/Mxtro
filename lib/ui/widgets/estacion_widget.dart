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
import '../screens/estacion_screen.dart';
import '../../models/index.dart';
import 'estacion_info_widget.dart';

class EstacionWidget extends StatelessWidget {
  static const String simboloAuxiliar = 'graphics/sistemas/';

  final Estacion estacion;

  //Constructor
  EstacionWidget(
    this.estacion,
  );

  //Genera el widget toucheable con los datos de la estacion.
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      child: InkWell(
        onTap: () => navigateToEstacionScreen(context),
        onLongPress: () {
          showModalBottomSheet(
            context: context,
            builder: (builder) {
              return Container(
                height: MediaQuery.of(context).size.height / 4,
                child: Column(
                  children: <Widget>[
                    EstacionInfoWidget(
                      estacion: estacion,
                    ),
                    ButtonTheme(
                      minWidth: MediaQuery.of(context).size.width - 16,
                      child: RaisedButton(
                        onPressed: () => navigateToEstacionScreen(context),
                        child: Text(
                          'Detalles de la estacion',
                        ),
                        color: Color(estacion.linea.color),
                        textColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
        child: tieneImagen(),
      ),
    );
  }

  Widget tieneImagen() {
    //ToDo: Cambiarlo por algo mas generico
    if (estacion.simbolo.contains('metro')) {
      return Image.asset(estacion.simbolo);
    }
    return Image.asset('graphics/imagenes_estaciones/sin_icono_estacion.png');
  }

  navigateToEstacionScreen(context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EstacionScreen(
              estacion: estacion,
              linea: estacion.linea,
            ),
      ),
    );
  }
}
