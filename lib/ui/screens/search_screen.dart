import 'package:flutter/material.dart';
import '../../models/superestacion.dart';
import '../widgets/resultados_busqueda_estaciones_widget.dart';

class SearchScreen extends StatefulWidget {
  final List<SuperEstacion> estaciones;

  SearchScreen({this.estaciones});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<SuperEstacion> nombresFiltrados = [];
  bool noHayBusqueda = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: TextField(
            autofocus: true,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ),
            decoration: InputDecoration(
              //ToDo: Este texto será traducido
              hintText: 'Nombre de la Estacion',
              hintStyle: TextStyle(color: Colors.white70),
            ),
            onChanged: (busqueda) {
              setState(() {
                if (busqueda.isNotEmpty) {
                  noHayBusqueda = false;
                  nombresFiltrados.clear();
                  for (var estacion in widget.estaciones) {
                    if (estacion.nombre
                            .toLowerCase()
                            .replaceAll('á', 'a')
                            .replaceAll('é', 'e')
                            .replaceAll('í', 'i')
                            .replaceAll('ó', 'o')
                            .replaceAll('ú', 'u')
                            .contains(busqueda.toLowerCase()) ||
                        estacion.nombre
                            .toLowerCase()
                            .contains(busqueda.toLowerCase())) {
                      nombresFiltrados.add(estacion);
                    }
                  }
                } else {
                  nombresFiltrados.clear();
                  noHayBusqueda = true;
                }
              });
            }),
      ),
      body: ResultadosBusqueda(
        noHayBusqueda: noHayBusqueda,
        nombresFiltrados: nombresFiltrados,
      ),
    );
  }
}
