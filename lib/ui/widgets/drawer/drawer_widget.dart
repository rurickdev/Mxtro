import 'package:flutter/material.dart';
import 'package:community_material_icon/community_material_icon.dart';
import '../../../models/sistema.dart';
import '../../screens/about_screen.dart';
import '../../screens/settings_screen.dart';
import 'header_drawer_widget.dart';
import 'lista_sistemas_drawer_widget.dart';

class DrawerWidget extends StatelessWidget {
  final List<Sistema> sistemas;

  DrawerWidget(this.sistemas);

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
            leading: Icon(
              CommunityMaterialIcons.information_outline,
              color: Colors.black,
            ),
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => AboutScreen())),
          ),
          ListTile(
            title: Text('Ajustes'),
            leading: Icon(
              CommunityMaterialIcons.settings_outline,
              color: Colors.black,
            ),
            onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsScreen(sistemas),
                  ),
                ),
          ),
        ],
      ),
    );
  }
}
