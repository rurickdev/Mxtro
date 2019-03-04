import 'package:flutter/material.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:url_launcher/url_launcher.dart';
//ToDo: Remover esta libreria en el release
import 'package:flutter_lorem/flutter_lorem.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        //ToDo: traducir este texto
        title: Text('Acerca de'),
      ),
      body: ListView(
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

//Foto del desarrollador circular
class DevPic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(
          width: 3,
          color: Colors.black87,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black45,
            blurRadius: 5,
          ),
        ],
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage('graphics/dev_pic.jpg'),
        ),
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
            child: Card(
              child: Column(
                children: <Widget>[
                  Container(
                    //height: MediaQuery.of(context).size.height / 4,
                    //width: MediaQuery.of(context).size.width,
                    child: Image.asset(
                      'graphics/iconos_interfaz/drawer_pic.jpg',
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  SizedBox(
                    height: 10,
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
          Positioned(
            bottom: 80,
            left: (MediaQuery.of(context).size.width / 2) - 50,
            child: DevPic(),
          ),
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
          onPressed: () {
            launchURL('https://twitter.com/skintigth');
          },
        ),
        IconButton(
          icon: Icon(
            CommunityMaterialIcons.linkedin,
          ),
          onPressed: () {
            launchURL('https://www.linkedin.com/in/rurickmpdev');
          },
        ),
        IconButton(
          icon: Icon(
            CommunityMaterialIcons.github_face,
          ),
          onPressed: () {
            launchURL('https://github.com/skintigth');
          },
        ),
        IconButton(
          icon: Icon(
            CommunityMaterialIcons.instagram,
          ),
          //ToDo: Cambiar a un perfil publico de desarrollo
          onPressed: () {
            launchURL('https://www.instagram.com/skintigth_/');
          },
        ),
        IconButton(
          icon: Icon(
            CommunityMaterialIcons.medium,
          ),
          onPressed: () {
            launchURL('https://medium.com/@skintigth');
          },
        ),
      ],
    );
  }

  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
