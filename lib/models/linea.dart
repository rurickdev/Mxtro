/// Hecho por Rurick Maqueo Poisot
/// mail: rurick.mpoisot@gmail.com
/// github: github.com/skintigth
///
/// Objeto Linea: es la abstraccion de una linea en los sistemas de transporte
/// consiste de:
///   id: identificador de la linea
///   Simbolo: simbolo para identificar rapido la linea, Icon
///   Nombre: el nombre de la linea, String
///   Color: solor con el que se identifica la linea, Color
///   sistemaId: id del sistema al que pertenece
///   listaEstaciones: la lista de estaciones/transbordos que pertenecen a la estacion
///

import 'superestacion.dart';
import 'estacion.dart';
import 'transbordo.dart';
import 'sistema.dart';

class Linea {

  //Parametros
  String _id;
  String _nombre;
  String _simbolo;
  int _color;
  String _sistemaId;
  Sistema _sistema;

  //Lista con todas las estaciones de la linea
  List<Estacion> _listaEstaciones = [];

  //Getters
  String get id => _id;
  String get nombre => _nombre;
  String get simbolo => _simbolo;
  int get color => _color;
  String get sistemaId => _sistemaId;
  Sistema get sistema => _sistema;

  //Regresa el numero de estaciones que tiene la linea
  int get numeroEstaciones => _listaEstaciones.length;
  //Regresa una lista con todas las estaciones de la linea
  List<SuperEstacion> get estaciones => _listaEstaciones;
  //Regresa la primera estacion de la linea, se conoce como direccion A
  SuperEstacion get direccionA => _listaEstaciones.first;
  //Regresa la primera ultima de la linea, se conoce como direccion B
  SuperEstacion get direccionB => _listaEstaciones.last;

  //Setters
  set id (String newId){
    this._id = newId;
  }
  set nombre (String newNombre){
    this._nombre = newNombre;
  }
  set simbolo (String newSimbolo){
    this._simbolo = 'graphics/imagenes_estaciones/' + newSimbolo;
  }
  set color (int newColor){
    this._color = newColor;
  }
  set sistemaId(String newSistemaId){
    this._sistemaId = newSistemaId;
  }
  set sistema(Sistema newSistema){
    this._sistema = newSistema;
  }

  //Convertir ObjetoLinea -> Objeto tipo Map
  Map<String, dynamic> toMap(){

    var map = Map<String, dynamic>();

    //[if] para comprobar si existe el id en la base de datos
    if (_id != null){
      map['l_id'] = _id;
    }
    map['l_nombre'] = _nombre;
    map['l_simbolo'] = _simbolo;
    map['l_color'] = _color.toString();
    map['s_id_l'] = _sistemaId;

    return map;
  }

  //Convertir Objeto tipo Map -> ObjetoLinea
  //Hay que crear el contructor que creará el objeto a partir del mapa en la DB
  Linea.fromMapObject(Map<String, dynamic> map){
    this._id = map['l_id'];
    this._nombre = map['l_nombre'];
    this._simbolo = map['l_simbolo'];
    this._color = int.parse(map['l_color']);
    this._sistemaId = map['s_id_l'];
  }

  //Agrega una estacion a la lista de estaciones
  addEstacion(Estacion estacion) => this._listaEstaciones.add(estacion);

  //Agrega una estacion, que recibe datos de un transbordo, a la lista de estaciones
  addTransbordo(Transbordo transbordo){

    Estacion est = Estacion();
    est.nombre = transbordo.nombre;
    est.lineaId = this._id;
    est.ubicacionEnLinea = transbordo.getUbicacionEnLinea(this._id);
    est.simbolo = transbordo.simbolo.substring(29);
    est.longitud = transbordo.longitud;
    est.latitud = transbordo.latitud;
    est.correspondencias = transbordo.correspondencias;
    est.linea = transbordo.linea;
    est.mapsId = transbordo.mapsId;

    this._listaEstaciones.add(est);
  }

  //Ordenas las estaciones de la linea segun su ubicacionEnLinea
  ordenarEstaciones(){
      int aux=0;
      Estacion estacion;
      while(aux!=this._listaEstaciones.length){
        estacion = this._listaEstaciones[aux];
        if(estacion.ubicacionEnLinea-1 == this._listaEstaciones.indexOf(estacion)){
          aux++;
        }else{
          this._listaEstaciones.remove(estacion);
          this._listaEstaciones.insert(estacion.ubicacionEnLinea-1, estacion);
        }
      }
  }
}