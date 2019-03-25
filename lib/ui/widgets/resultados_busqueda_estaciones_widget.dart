import 'package:flutter/material.dart';
import 'package:community_material_icon/community_material_icon.dart';
import '../../models/superestacion.dart';
import '../screens/estacion_screen.dart';
import '../widgets/mensaje_con_icono_widget.dart';
import '../widgets/estacion_info_widget.dart';

class ResultadosBusqueda extends StatelessWidget {
  final bool noHayBusqueda;
  final List<SuperEstacion> nombresFiltrados;
  final String heroTag;

  ResultadosBusqueda({
    @required this.noHayBusqueda,
    @required this.nombresFiltrados,
    @required this.heroTag,
  });

  @override
  Widget build(BuildContext context) {
    if (noHayBusqueda) {
      return MensajeConIcono(
          heroTag: heroTag,
          icono: CommunityMaterialIcons.map_search_outline,
          mensaje: 'Solo Escribe el Nombre de la Estacion');
    } else {
      // Si no hay resultados muestra un icono y un mensaje indicando que no hubo resultados
      if (nombresFiltrados.isEmpty) {
        return MensajeConIcono(
            heroTag: heroTag,
            icono: CommunityMaterialIcons.emoticon_sad,
            mensaje:
                'Lo sentimos, no pudimos encontrar la estacion que buscas');
      } else {
        //Si hay resultados muestra la lista de resultados
        return ListView.builder(
          itemCount: nombresFiltrados.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EstacionScreen(
                            estacion: nombresFiltrados[index],
                            linea: nombresFiltrados[index].linea,
                          ),
                    ),
                  ),
              child: EstacionInfoWidget(
                estacion: nombresFiltrados[index],
              ),
            );
          },
        );
      }
    }
  }
}
