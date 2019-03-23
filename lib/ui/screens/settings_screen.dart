import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        //ToDo: Traducir este texto
        title: Text('Ajustes'),
      ),
      body: Container(
        //ToDo: Crear los widgets de los ajustes
        margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
        child: ListView(
          children: <Widget>[
            Text(
              'Comportamiento',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            ListTile(
              title: Text('Sistema de Transporte Favorito'),
              subtitle: Text(
                  'Elije el sistema de transporte que se iniciara de forma predeterminada al abrir la app'),
              leading: Icon(Icons.star),
            ),
            ListTile(
              title: Text('Acciones Rapidas'),
              subtitle: Text(
                  'Elije los sistemas de transporte que apareceran en las acciones rapidas de la app'),
              leading: Icon(Icons.format_list_bulleted),
            ),
            ListTile(
              title: Text('Tipo de Mapa'),
              subtitle: Text('Elige el tipo de mapa que se mostrara'),
              leading: Icon(Icons.map),
            ),
            Text(
              'Apariencia',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            ListTile(
              title: Text('Tema'),
              subtitle: Text('Elije el tipo de tema que tendra la app'),
              leading: Icon(Icons.format_paint),
            ),
          ],
        ),
      ),
    );
  }
}
