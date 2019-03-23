import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import '../../utils/cargador_listas.dart';
import '../../models/sistema.dart';
import 'sistema_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  CargadorListas cargador = CargadorListas();
  List<Sistema> sistemas;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5, milliseconds: 200), loadDB);
  }

  loadDB() async {
    sistemas = await cargador.cargarListas();
    await afterLoading();
  }

  afterLoading() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => SistemaScreen(sistemas, sistemas[0]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double altura = MediaQuery.of(context).size.height / 3;
    double ancho = MediaQuery.of(context).size.width;

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
