import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import '../../models/sistema.dart';
import '../screens/sistema_screen.dart';
import '../screens/about_screen.dart';
import '../screens/settings_screen.dart';

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
          DrawerHeader(),
          ListaSistemas(
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

class DrawerHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('graphics/fondo_copilco.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      height: 150,
      child: FlareActor(
        'assets/animaciones/train.flr',
        animation: 'MoveTrain',

        //fit: BoxFit.fitHeight,
      ),
    );
  }
}

class ListaSistemas extends StatelessWidget {
  final List<Sistema> sistemas;

  ListaSistemas({
    @required this.sistemas,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 0),
        itemCount: sistemas.length,
        itemBuilder: (BuildContext context, int index) {
          Sistema sistema = sistemas[index];
          return ListTile(
            title: Text(sistema.nombre),
            leading: Image.asset(
              sistema.simbolo,
              height: 35,
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => SistemaScreen(sistemas, sistema),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
