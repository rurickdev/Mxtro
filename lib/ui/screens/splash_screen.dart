import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import '../../utils/cargador_listas.dart';
import '../../models/sistema.dart';
import 'sistema_screen.dart';

class SplashScreen extends StatelessWidget {
  final CargadorListas cargador = CargadorListas();

  loadDB(context) {
    Timer(
      Duration(seconds: 5),
      () async {
        List<Sistema> sistemas;
        sistemas = await cargador.cargarListas();
        await afterLoading(context, sistemas);
      },
    );
  }

  afterLoading(context, List<Sistema> sistemas) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => SistemaScreen(sistemas, sistemas[0]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double altura = MediaQuery.of(context).size.height / 3;
    double ancho = MediaQuery.of(context).size.width;

    loadDB(context);

    return Container(
      color: Colors.white,
      width: ancho,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            height: altura,
            //child: RaisedButton(onPressed: afterLoading),
          ),
          Container(
            height: altura,
            child: Icon(
              Icons.train,
              color: Colors.deepOrange,
              size: 100,
            ),
          ),
          Container(
            height: altura,
            //width: MediaQuery.of(context).size.width,
            child: FlareActor(
              'assets/animaciones/train.flr',
              animation: 'MoveTrain',
              fit: BoxFit.fitWidth,
            ),
          ),
        ],
      ),
    );
  }
}
