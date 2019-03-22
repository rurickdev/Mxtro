import 'package:flutter/material.dart';

class MensajeConIcono extends StatelessWidget {
  final IconData icono;
  final String mensaje;

  MensajeConIcono({
    @required this.icono,
    @required this.mensaje,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Hero(
              tag: 'BotonBuscar',
              child: Icon(
                icono,
                size: 100,
                color: Colors.grey,
              ),
            ),
            Text(
              mensaje,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
