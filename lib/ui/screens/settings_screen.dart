import 'package:flutter/material.dart';
import '../widgets/news_widget.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        //ToDo: Traducir este texto
        title: Text('Ajustes'),
      ),
      body: Center(
        //ToDo: Crear los widgets de los ajustes
        child: NewsWidget(),
      ),
    );
  }
}