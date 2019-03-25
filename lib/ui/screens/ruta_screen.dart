import 'package:flutter/material.dart';
import 'package:community_material_icon/community_material_icon.dart';
import '../widgets/mensaje_con_icono_widget.dart';

class RutaScreen extends StatelessWidget {
  final String heroTag;

  RutaScreen({
    this.heroTag,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text('Buscar Ruta'),
      ),
      body: MensajeConIcono(
        heroTag: heroTag,
        icono: CommunityMaterialIcons.emoticon_sad,
        mensaje: 'Esta caracteristica aun no esta disponible',
      ),
    );
  }
}
