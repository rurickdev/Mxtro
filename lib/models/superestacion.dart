import 'dart:async';

/// Hecho por Rurick Maqueo Poisot
/// mail: rurick.mpoisot@gmail.com
/// github: github.com/skintigth
///
/// Objeto Super Estacion: este objeto sirve para unificar los parametros que
/// tienen en comun las estaciones y los transbordos evitando que se escriba
/// doble el codigo:
///   id: identificador de la linea
///   Nombre: el nombre de la linea, String
///   Simbolo: simbolo de cada estacion o transbordo, String
///   lineaId: id de  la linea a la que pertenece el transbordo o la estacion, String
///   latitud: latitud de la ubicacion geografica de la estacion/transbrodo, double
///   longitud: longitud de la ubicacion geografica de la estacion/transbrodo, double
///   linea: objeto tipo linea al que pertenece la estacion/transbordo
///

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'linea.dart';

class SuperEstacion {
  //Parametros
  String _id;
  String _nombre;
  String _simbolo;
  String _lineaId;
  double _latitud;
  double _longitud;
  Linea _linea;
  String _mapsId;

  //Mapa de correspondencias <lineaId, ubicacionEnLinea>
  //Solo es usado por los transbordos para almacenar todas sus correspondencias
  Map<String, int> _correspondencias = Map<String, int>();

  //Getters
  String get id => _id;
  String get nombre => _nombre;
  String get simbolo => _simbolo;
  String get lineaId => _lineaId;
  double get latitud => _latitud;
  double get longitud => _longitud;
  Linea get linea => _linea;
  Map<String, int> get correspondencias => _correspondencias;
  String get mapsId => _mapsId;
  LatLng get ubiGeo => LatLng(_latitud, _longitud);

  //Setters
  set id(String newId) {
    this._id = newId;
  }

  set nombre(String newNombre) {
    this._nombre = newNombre;
  }

  set simbolo(String newSimbolo) {
    this._simbolo = 'graphics/imagenes_estaciones/' + newSimbolo;
  }

  set lineaId(String newLineaId) {
    this._lineaId = newLineaId;
  }

  set latitud(double newLatitud) {
    this._latitud = newLatitud;
  }

  set longitud(double newLongitud) {
    this._longitud = newLongitud;
  }

  set linea(Linea newLinea) {
    this._linea = newLinea;
  }

  set correspondencias(Map<String, int> newCorrespondencias) {
    this._correspondencias = newCorrespondencias;
  }

  set mapsId(String newMapsId) {
    this._mapsId = newMapsId;
  }

  String toString() {
    return '${this._nombre}\n';
  }
}
