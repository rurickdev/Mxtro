/// Hecho por Rurick Maqueo Poisot
/// mail: rurick.mpoisot@gmail.com
/// github: github.com/skintigth
///
/// objeto Sistema: es la abstraccion de un sistema de transporte, consta de:
///   id: identificador del sistema de transporte
///   nombre: nombre del sistema de transporte
///   simbolo: logo o simbolo del sistema de transporte
///

import 'linea.dart';

class Sistema{

  //Parametros
  String _id;
  String _nombre;
  String _simbolo;
  int _colorPrimario;
  int _colorSecundario;
  String _mapa;

  List<Linea> listaLineas = [];

  //Constructores
  Sistema(this._id, this._nombre, this._simbolo, this._colorPrimario, this._colorSecundario, this._mapa);

  //Getters
  String get id => _id;
  String get nombre => _nombre;
  String get simbolo => _simbolo;
  int get colorPrimario => _colorPrimario;
  int get colorSecundario => _colorSecundario;
  String get mapa => _mapa;

  //Setters
  set id (String newId){
    this._id = newId;
  }
  set nombre (String newNombre){
    this._nombre = newNombre;
  }
  set simbolo (String newSimbolo){
    this._simbolo = newSimbolo;
  }
  set colorPrimario (int newPrimario){
    this._colorPrimario = newPrimario;
  }
  set colorSecundario (int newSecundario){
    this._colorSecundario = newSecundario;
  }
  set mapa (String newMapa){
    this._mapa = newMapa;
  }

  //Convertir ObjetoSistema -> Objeto tipo Map
  Map<String, dynamic> toMap(){

    var map = Map<String, dynamic>();

    //[if] para confirmar que el Id no existe en la DB
    if (_id != null){
      map['s_id'] = _id;
    }
    map['s_nombre'] = _nombre;
    map['s_simbolo'] = _simbolo;
    map['s_color_p'] = _colorPrimario;
    map['s_color_s'] = _colorSecundario;
    map['s_mapa'] = _mapa;

    return map;
  }

  //Convertir de Objeto tipo Map -> ObjetoSistema
  //Se usa un constructor para construir el objeto desde la DB
  Sistema.fromMapObject(Map<String, dynamic> map){
    this._id = map['s_id'];
    this._nombre = map['s_nombre'];
    this._simbolo = 'graphics/sistemas/' + map['s_simbolo'];
    this._colorPrimario = int.parse(map['s_color_p']);
    this._colorSecundario = int.parse(map['s_color_s']);
    this._mapa = 'graphics/sistemas/mapas/' + map['s_mapa'];
  }

  addLinea(Linea linea) => this.listaLineas.add(linea);

  int get numeroLineas => this.listaLineas.length;

  String toString(){
    return '${this._nombre}\n';
  }

}