import 'package:flutter/material.dart';
import 'opcionesmenu.dart';

class MenuAppBar extends StatelessWidget{

  final OptionsMenu opcion;

  const MenuAppBar({Key key, this.opcion}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(opcion.icono, color: Colors.black54,),
            Text(opcion.texto, style: TextStyle(color: Colors.black54),),
          ],
        ),
      ),
    );
  }

}