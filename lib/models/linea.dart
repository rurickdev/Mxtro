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
///

import 'package:metroapp/widgets/estacionwidget.dart';
import 'package:metroapp/models/objetosuperestacion.dart';


class Linea {

  //Parametros
  String _id;
  String _nombre;
  String _simbolo;
  String _color;
  String _sistemaId;

  List<ObjetoSuperEstacion> listaEstacionTransbordos = [];

  List<EstacionWidget> listaWidgetEstaciones = [];

  //Getters
  String get id => _id;
  String get nombre => _nombre;
  String get simbolo => _simbolo;
  String get color => _color;
  String get sistemaId=> _sistemaId;

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
  set color (String newColor){
    this._color = newColor;
  }
  set sistemaId(String newSistemaId){
    this._sistemaId = newSistemaId;
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
    map['l_color'] = _color;
    map['s_id_l'] = _sistemaId;

    return map;
  }

  //Convertir Objeto tipo Map -> ObjetoLinea
  //Hay que crear el contructor que creará el objeto a partir del mapa en la DB
  Linea.fromMapObject(Map<String, dynamic> map){

    this._id = map['l_id'];
    this._nombre = map['l_nombre'];
    this._simbolo = map['l_simbolo'];
    this._color = map['l_color'];
    this._sistemaId = map['s_id_l'];
  }

  setEstaciones(ObjetoSuperEstacion estacion){
    this.listaEstacionTransbordos.add(estacion);
  }
  setTransbordo(ObjetoSuperEstacion transbordo){
    if (transbordo.ubicacionEnLinea < this.listaEstacionTransbordos.length) {
      this.listaEstacionTransbordos.insert(
          transbordo.ubicacionEnLinea - 1, transbordo);
    } else {
      this.listaEstacionTransbordos.add(transbordo);
    }
  }

  int getNumeroEstaciones(){
    int numeroEstaciones;
    numeroEstaciones = this.listaEstacionTransbordos.length;
    return numeroEstaciones;
  }
  printLinea(){
    for (var estacion in this.listaEstacionTransbordos) {
      print('${estacion.nombre} ${estacion.ubicacionEnLinea} ${estacion.lineaId}');
    }
  }
}