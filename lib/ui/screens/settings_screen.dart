import 'package:flutter/material.dart';
import 'package:community_material_icon/community_material_icon.dart';
import '../../models/sistema.dart';

class SettingsScreen extends StatelessWidget {
  final List<Sistema> sistemas;

  SettingsScreen(this.sistemas);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        //ToDo: Traducir este texto
        title: Text('Ajustes'),
      ),
      body: Container(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
          children: <Widget>[
            Text(
              'Comportamiento',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SistemaFavorito(sistemas),
            AccionesRapidas(sistemas),
            Mapa(),
            Text(
              'Apariencia',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Tema(),
          ],
        ),
      ),
    );
  }
}

class SistemaFavorito extends StatelessWidget {
  final List<Sistema> sistemas;

  SistemaFavorito(this.sistemas);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('Sistema de Transporte Favorito'),
      subtitle: Text(
          'Elije el sistema de transporte que se iniciara de forma predeterminada al abrir la app'),
      leading: Icon(Icons.star),
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (builder) {
            return ListView.builder(
              itemCount: sistemas.length,
              itemBuilder: (context, index) {
                Sistema sistema = sistemas[index];
                return ListTile(
                  title: Text(sistema.nombre),
                  leading: Image.asset(
                    sistema.simbolo,
                    height: 35,
                  ),
                  onTap: Navigator.of(context).pop,
                );
              },
            );
          },
        );
      },
    );
  }
}

class AccionesRapidas extends StatelessWidget {
  final List<Sistema> sistemas;

  AccionesRapidas(this.sistemas);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('Acciones Rapidas'),
      subtitle: Text(
          'Elije los sistemas de transporte que apareceran en las acciones rapidas de la app'),
      leading: Icon(Icons.format_list_bulleted),
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (builder) {
            return ListView.builder(
              itemCount: sistemas.length,
              itemBuilder: (context, index) {
                Sistema sistema = sistemas[index];
                return ListTile(
                  title: Text(sistema.nombre),
                  leading: Image.asset(
                    sistema.simbolo,
                    height: 35,
                  ),
                  //ToDo: relacionar todos los [CheckBox]
                  trailing: Checkbox(
                    value: false,
                    onChanged: (value) {},
                  ),
                  onTap: Navigator.of(context).pop,
                );
              },
            );
          },
        );
      },
    );
  }
}

class Mapa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('Tipo de Mapa'),
      subtitle: Text('Elige el tipo de mapa que se mostrara'),
      leading: Icon(Icons.map),
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (builder) {
            return Container(
              height: MediaQuery.of(context).size.height / 6,
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: Text('Google Map'),
                    leading: Icon(CommunityMaterialIcons.google_maps),
                    onTap: Navigator.of(context).pop,
                  ),
                  ListTile(
                    title: Text('Croquis Oficial'),
                    leading: Icon(CommunityMaterialIcons.map_legend),
                    onTap: Navigator.of(context).pop,
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

class Tema extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('Tema'),
      subtitle: Text('Elije el tipo de tema que tendra la app'),
      leading: Icon(Icons.format_paint),
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (builder) {
            return Container(
              height: MediaQuery.of(context).size.height / 4,
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: Text('Claro'),
                    onTap: Navigator.of(context).pop,
                    leading: CircleAvatar(
                      backgroundColor: Colors.white,
                    ),
                  ),
                  ListTile(
                    title: Text('Oscuro'),
                    onTap: Navigator.of(context).pop,
                    leading: CircleAvatar(
                      backgroundColor: Color(0xFF2c3e50),
                    ),
                  ),
                  ListTile(
                    title: Text('Negro'),
                    onTap: Navigator.of(context).pop,
                    leading: CircleAvatar(
                      backgroundColor: Colors.black,
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
