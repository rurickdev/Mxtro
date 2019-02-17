import 'package:flutter/material.dart';
import 'package:community_material_icon/community_material_icon.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        //ToDo: traducir este texto
        title: Text('Sobre Nosotros'),
      ),
      body: Column(
        children: <Widget>[
          //ToDo: Cambiar por una foto redonda
          Container(
            height: 100,
            width: 100,
            child: Placeholder(),
          ), 
          Card(
            child: Column(
              children: <Widget>[
                DevIcons(),
                //ToDo: Traducir este texto
                Text('Rurick Maqueo Poisot', style: TextStyle(fontWeight: FontWeight.bold),),
                Text('Yo hice posible este proyecto'),
                SizedBox(
                  height: 8,
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(16),
            child: Text('Mas texto sobre la aplicaion, librerias de codigo abierto, licencia, etc...'),
          ),
        ],
      ),
    );
  }
}

class DevIcons extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
          icon: Icon(CommunityMaterialIcons.twitter,),
          onPressed: (){},  
        ),
        IconButton(
          icon: Icon(CommunityMaterialIcons.linkedin,),
          onPressed: (){},  
        ),
        IconButton(
          icon: Icon(CommunityMaterialIcons.github_face,),
          onPressed: (){},  
        ),
        IconButton(
          icon: Icon(CommunityMaterialIcons.instagram,),
          onPressed: (){},  
        ),
        IconButton(
          icon: Icon(CommunityMaterialIcons.facebook,),
          onPressed: (){},  
        ),
      ],
    );
  }
}