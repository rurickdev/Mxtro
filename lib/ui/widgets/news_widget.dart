import 'package:flutter/material.dart';
import 'package:community_material_icon/community_material_icon.dart';

class NewsWidget extends StatelessWidget{

  //Web view que muestra el feed de twitter del sistema
  /*WebviewScaffold(
  url: 'https://twitter.com/MetroCDMX',
  hidden: true,
  ),*/

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(CommunityMaterialIcons.worker, size: 100, color: Colors.grey,),
            //ToDo: Este texto será traducido
            Text(
              'Estamos trabajando para tener esta funcion lista lo antes posible',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

}