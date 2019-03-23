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
                nombresFiltrados.clear();
                String nombreBuscado = busqueda.toLowerCase();
                if (nombreBuscado.isNotEmpty) {
                  noHayBusqueda = false;
                  for (var estacion in widget.estaciones) {
                    String nombre = estacion.nombre.toLowerCase();
                    if (nombre.replaceAllMapped(RegExp(r'([áéíóú])'),
                            (Match m) {
                          switch (m[0]) {
                            case 'á':
                              return 'a';
                              break;
                            case 'é':
                              return 'e';
                              break;
                            case 'í':
                              return 'i';
                              break;
                            case 'ó':
                              return 'o';
                              break;
                            case 'ú':
                              return 'u';
                              break;
                            default:
                          }
                        }).contains(nombreBuscado) ||
                        nombre.contains(nombreBuscado)) {
                      nombresFiltrados.add(estacion);
                    }
                  }
                } else {
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
