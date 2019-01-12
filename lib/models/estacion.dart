/// Hecho por Rurick Maqueo Poisot
/// mail: rurick.mpoisot@gmail.com
/// github: github.com/skintigth
///
/// objeto Estacion: es la abstraccion a objeto de una estacion, consta de:
///   id: identificador de la estacion
///   simbolo: icono de la estacion, string al asset
///   nombre: nombre d ela estacion, string
///   lineaId: id de la linea a la que pertenece
///   ubicacionEnLinea: marca su posicion en la lista de estaciones de la linea
///

import 'package:metroapp/models/objetosuperestacion.dart';

class Estacion extends ObjetoSuperEstacion{

  //Convierte ObjetoEstacion -> Objeto tipo Map
  Map<String, dynamic> toMap(){

    var map = Map<String, dynamic>();

    //el [if] Comprueba si existe o no en la base de datos
    if (id != null ) {
      map['e_id'] = id;
    }
    map['e_nombre'] = nombre;
    map['e_simbolo'] = simbolo;
    map['l_id_e'] = lineaId;
    map['ubicacion_l'] = ubicacionEnLinea;

    return map;
  }

  //Convierte Objeto tipo Map -> ObjetoEstacion
  //Hay que crear un constructor que cree el objeto apartir del mapa en la DB
  Estacion.fromMapObject(Map<String, dynamic> map){

    this.id = map['e_id'];
    this.nombre = map['e_nombre'];
    this.simbolo = map['e_simbolo'];
    this.lineaId = map['l_id_e'];
    this.ubicacionEnLinea = map['ubicacion_l'];
  }
}