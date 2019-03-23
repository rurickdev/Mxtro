import 'package:flutter/material.dart';
import '../../models/estacion.dart';
import 'estacion_widget.dart';
import 'estacion_info_widget.dart';

class EstacionPagina extends StatelessWidget {
  final Estacion estacion;

  EstacionPagina({
    @required this.estacion,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          EstacionInfoWidget(
            estacion: estacion,
          ),
          Expanded(
            child: Correspondencias(estacion),
          ),
          EstacionesContiguas(
            siguiente: estacion.siguiente,
            anterior: estacion.anterior,
          ),
        ],
      ),
    );
  }
}

class EstacionesContiguas extends StatelessWidget {
  final Estacion siguiente;
  final Estacion anterior;

  EstacionesContiguas({
    @required this.siguiente,
    @required this.anterior,
  });

  List<Widget> llenarContiguas(BuildContext context) {
    final List<Widget> contiguas = [];

    if (anterior != null) {
      contiguas.add(Image.asset(
        anterior.simbolo,
        height: 60,
      ));
      //contiguas.add(EstacionWidget(anterior));
    } else {
      contiguas.add(SizedBox(
        width: MediaQuery.of(context).size.width / 4,
      ));
    }

    if (siguiente != null) {
      contiguas.add(Image.asset(
        siguiente.simbolo,
        height: 60,
      ));
      //contiguas.add(EstacionWidget(siguiente));
    } else {
      contiguas.add(SizedBox(
        width: MediaQuery.of(context).size.width / 4,
      ));
    }

    contiguas.insert(1, Text('Direccion'));

    return contiguas;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> contiguasLocal = llenarContiguas(context);

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          //ToDo: Este texto será traducido
          Text(
            'Estaciones Aledañas',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: contiguasLocal,
          ),
        ],
      ),
    );
  }
}

class Correspondencias extends StatelessWidget {
  final Estacion estacion;

  Correspondencias(this.estacion);

  List<Widget> listaCorrespondencias() {
    final List<Widget> listaCorrespondencias = [];

    if (estacion.correspondencias.isNotEmpty) {
      for (int i = 0; i < estacion.correspondencias.keys.toList().length; i++) {
        if (estacion.lineaId != estacion.correspondencias.keys.toList()[i]) {
          listaCorrespondencias
              .add(Text(estacion.correspondencias.keys.toList()[i]));
        }
      }
    }

    return listaCorrespondencias;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> correspondencias = listaCorrespondencias();

    if (correspondencias.isNotEmpty) {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Correspondencias',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: correspondencias.length,
              itemBuilder: (context, index) {
                return correspondencias[index];
              },
            ),
          ],
        ),
      );
    } else {
      return Container();
    }
  }
}
