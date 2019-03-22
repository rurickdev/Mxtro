import 'package:flutter/material.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'mensaje_con_icono_widget.dart';

class NewsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //ToDo: Implementar el feed de twitter
    return MensajeConIcono(
      icono: CommunityMaterialIcons.worker,
      mensaje:
          'Estamos trabajando para tener esta funcion lista lo antes posible',
    );
  }
}
