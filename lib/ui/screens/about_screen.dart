import 'package:flutter/material.dart';
import 'package:community_material_icon/community_material_icon.dart';
//ToDo: Remover esta libreria en el release
import 'package:flutter_lorem/flutter_lorem.dart';

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
          DevInfoCard(),
          Container(
            margin: EdgeInsets.all(16),
            //ToDO: Agregar informacion de la aplicacion
            child: Text(
              lorem(paragraphs: 3, words: 120),
            ),
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
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Icon(
        Icons.person,
        color: Colors.black,
        size: 100,
      ),
    );
  }
}

//Carta con informacion del desarrollador
class DevInfoCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(
              top: 50,
            ),
            child: Card(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 30,
                  ),
                  SocialIcons(),
                  //ToDo: Traducir este texto
                  Text(
                    'Rurick Maqueo Poisot',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text('Yo hice posible este proyecto'),
                  SizedBox(
                    height: 8,
                  ),
                ],
              ),
            ),
          ),
          DevPic(),
        ],
      ),
    );
  }
}

//Iconos de redes sociales
class SocialIcons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
            icon: Icon(
              CommunityMaterialIcons.twitter,
            ),
            onPressed: () {}),
        IconButton(
          icon: Icon(
            CommunityMaterialIcons.linkedin,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(
            CommunityMaterialIcons.github_face,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(
            CommunityMaterialIcons.instagram,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(
            CommunityMaterialIcons.facebook,
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
