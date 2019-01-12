/// Hecho por Rurick Maqueo Poisot
/// mail: rurick.mpoisot@gmail.com
/// github: github.com/skintigth
///
/// objeto Sistema: es la abstraccion de un sistema de transporte, consta de:
///   id: identificador del sistema de transporte
///   nombre: nombre del sistema de transporte
///   simbolo: logo o simbolo del sistema de transporte
///

import 'package:metroapp/models/linea.dart';

class Sistema{

  //Parametros
  String _id;
  String _nombre;
  String _simbolo;

  List<Linea> listaLineas = [];

  //Constructores
  Sistema(this._nombre, this._simbolo);
  Sistema.conId(this._id, this._nombre, this._simbolo);

  //Getters
  String get id => _id;
  String get nombre => _nombre;
  String get simbolo => _simbolo;

  //Setters
  set id (String newId){
    this._id = newId;
  }
  set nombre (String newNombre){
    this._nombre = newNombre;
  }
  set simbolo (String newSimbolo){
    this._simbolo = 'graphics/sistemas/' + newSimbolo;
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

    return map;
  }

  //Convertir de Objeto tipo Map -> ObjetoSistema
  //Se usa un constructor para construir el objeto desde la DB
  Sistema.fromMapObject(Map<String, dynamic> map){

    this._id = map['s_id'];
    this._nombre = map['s_nombre'];
    this._simbolo = map['s_simbolo'];
  }

  setLineas(Linea linea){
    this.listaLineas.add(linea);
  }

  int getNumeroLineas(){
    int numeroLineas;
    numeroLineas = this.listaLineas.length;
    return numeroLineas;
  }
}