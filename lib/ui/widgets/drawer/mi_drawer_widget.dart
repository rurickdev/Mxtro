import 'package:flutter/material.dart';
import '../../../models/sistema.dart';
import '../../screens/about_screen.dart';
import '../../screens/settings_screen.dart';
import 'header_drawer_widget.dart';
import 'lista_sistemas_drawer_widget.dart';

class MiDrawerWidget extends StatelessWidget {
  final List<Sistema> sistemas;

  MiDrawerWidget(this.sistemas);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          //ToDo: Cambiar esta imagen por una animacion propia
          HeaderDrawerWidget(),
          ListaSistemasDrawerWidget(
            sistemas: sistemas,
          ),
          Divider(),
          ListTile(
            title: Text('Acerca de'),
            leading: Icon(Icons.info),
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => AboutScreen())),
          ),
          ListTile(
            title: Text('Ajustes'),
            leading: Icon(Icons.settings),
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => SettingsScreen())),
          ),
        ],
      ),
    );
  }
}
