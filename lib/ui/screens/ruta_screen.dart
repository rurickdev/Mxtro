import 'package:flutter/material.dart';
/*import 'package:community_material_icon/community_material_icon.dart';
import '../../models/superestacion.dart';
import '../screens/estacion_screen.dart';*/
import '../widgets/news_widget.dart';

class RutaScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text('Buscar Ruta'),
      ),
      body: NewsWidget(),
    );
  }

}