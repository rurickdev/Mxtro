import 'package:flutter/material.dart';
import 'package:community_material_icon/community_material_icon.dart';
import '../../models/superestacion.dart';
import '../screens/estacion_screen.dart';
import '../widgets/estacion_info_widget.dart';

class SearchScreen extends StatefulWidget{

  final List<SuperEstacion> estaciones;

  SearchScreen({this.estaciones});

  @override
  _SearchScreenState createState() => _SearchScreenState();

}

class _SearchScreenState extends State<SearchScreen>{

  List<SuperEstacion> nombresFiltrados = [];
  bool noHayBusqueda = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: TextField(
          autofocus: true,
          style: TextStyle(color: Colors.white, fontSize: 20.0,),
          decoration: InputDecoration(
            //ToDo: Este texto será traducido
            hintText: 'Nombre de la Estacion',
            hintStyle: TextStyle(color: Colors.white70),
          ),
          onChanged: (busqueda){
            setState(() {
              if(busqueda.isNotEmpty){
                noHayBusqueda = false;
                nombresFiltrados.clear();
                for (var estacion in widget.estaciones){
                  if (estacion.nombre.toLowerCase().replaceAll('á', 'a')
                      .replaceAll('é', 'e').replaceAll('í', 'i')
                      .replaceAll('ó', 'o').replaceAll('ú', 'u')
                      .contains(busqueda.toLowerCase()) || estacion.nombre.toLowerCase().contains(busqueda.toLowerCase())){
                    nombresFiltrados.add(estacion);
                  }
                }
              }else{
                nombresFiltrados.clear();
                noHayBusqueda = true;
              }
            });
          }
        ),
      ),
      body: resultadosBusqueda(),
    );
  }

  //Cambia el body del scaffold segun haya o no resultados de busqueda
  Widget resultadosBusqueda() {
    //Si no hay busqueda muestra un icono de una lupa con una texto
    if (noHayBusqueda){
      return mensajeBusqueda(CommunityMaterialIcons.map_search_outline, 'Solo Escribe el Nombre de la Estacion');
    }else{
      // Si no hay resultados muestra un icono y un mensaje indicando que no hubo resultados
      if (nombresFiltrados.isEmpty){
        return mensajeBusqueda(CommunityMaterialIcons.emoticon_sad, 'Lo sentimos, no pudimos encontrar la estacion que buscas');
      }else{
        //Si hay resultados muestra la lista de resultados
        return ListView.builder(
          itemCount: nombresFiltrados.length,
          itemBuilder: (context, index){
            return InkWell(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => EstacionScreen(estacion: nombresFiltrados[index],))),
              child: EstacionInfoWidget(estacion: nombresFiltrados[index],),
            );
          },
        );
      }
    }
  }

  Widget mensajeBusqueda(IconData icono, String mensaje){
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              icono,
              size: 100,
              color: Colors.grey,
            ),
            Text(
              mensaje,
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