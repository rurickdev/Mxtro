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
          DevPic(), //ToDo: Cambiar por una foto redonda e integrar en el [DevInfoCard]
          DevInfoCard(),
          Container(
            margin: EdgeInsets.all(16),
            //ToDO: Agregar informacion de la aplicacion
            child: Text('Mas texto sobre la aplicaion, librerias de codigo abierto, licencia, etc...'),
          ),
        ],
      ),
    );
  }
}

//Foto del desarrollador
class DevPic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return //Foto del desarrollador
    Container(
      height: 100,
      width: 100,
      child: Placeholder(),
    );
  }
}

//Carta con informacion del desarrollador
class DevInfoCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          SocialIcons(),
          //ToDo: Traducir este texto
          Text('Rurick Maqueo Poisot', style: TextStyle(fontWeight: FontWeight.bold),),
          Text('Yo hice posible este proyecto'),
          SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }
}

//Iconos de redes sociales
class SocialIcons extends StatelessWidget {
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