/// Hecho por Rurick Maqueo Poisot
/// mail: rurick.mpoisot@gmail.com
/// github: github.com/skintigth
///
/// Aplicacion que permite ver los datos de los sistemas de transporte de México
///

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'ui/screens/splash_screen.dart';

void main() {
  //debugPaintSizeEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Metro App',
      home: SplashScreen(),
      theme: ThemeData(
        //ToDo: Cambiar los colores segun el sistema predilecto del usuario guardado en [SharedPreferences]
        primaryColor: Colors.deepOrange,
        accentColor: Colors.deepOrangeAccent,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
