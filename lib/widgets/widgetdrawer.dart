import 'package:flutter/material.dart';
import 'package:metroapp/utils/metro_app_font_icons.dart';

class MiDrawer extends StatelessWidget{
  
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              //ToDo: Comprar la imagen o hacer una propia
              image: DecorationImage(image: AssetImage('graphics/iconos_interfaz/drawer_pic.jpg'),),
            ),
          ),
          ListTile(
            title: Text('Metro'),
            leading: Icon(MetroAppFont.icon_drawer_metro),
            onTap: (){},
          ),
          ListTile(
            title: Text('MetroBus'),
            leading: Icon(MetroAppFont.icon_drawer_metrobus),
            onTap: (){},
          ),
          ListTile(
            title: Text('Tren Ligero'),
            leading: Icon(MetroAppFont.icon_drawer_trenligero),
            onTap: (){},
          ),
          ListTile(
            title: Text('Tren Suburbano'),
            leading: Icon(MetroAppFont.icon_drawer_trensuburbano),
            onTap: (){},
          ),
          ListTile(
            title: Text('Pumabus'),
            leading: Icon(MetroAppFont.icon_drawer_pumabus),
            onTap: (){},
          ),
          Divider(),
          ListTile(
            title: Text('Acerca de'),
            leading: Icon(Icons.info),
            onTap: (){},
          ),
          ListTile(
            title: Text('Ajustes'),
            leading: Icon(Icons.settings),
            onTap: (){},
          ),
        ],
      ),
    );
  }
  
}