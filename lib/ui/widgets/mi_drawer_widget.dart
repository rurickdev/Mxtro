import 'package:flutter/material.dart';
import '../../models/sistema.dart';
import '../screens/sistema_screen.dart';

class MiDrawer extends StatelessWidget{

  final List<Sistema> sistemas;

  MiDrawer(this.sistemas);
  
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          //ToDo: Cambiar esta imagen por una animacion propia
          Image(image: AssetImage('graphics/iconos_interfaz/drawer_pic.jpg'), fit: BoxFit.fitWidth),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(top: 0),
              itemCount: sistemas.length,
              itemBuilder: (BuildContext context, int index){
                return ListTile(
                  title: Text(sistemas[index].nombre),
                  leading: Image.asset(sistemas[index].simbolo, height: 35,),
                  onTap: (){
                    Navigator.pop(context);
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SistemaScreen(index, sistemas)));
                  },
                );
              },
            ),
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