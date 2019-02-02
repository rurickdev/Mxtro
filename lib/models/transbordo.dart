/// Hecho por Rurick Maqueo Poisot
/// mail: rurick.mpoisot@gmail.com
/// github: github.com/skintigth
///
/// objeto Transbordo: es la abstraccion a objeto de un transbordo.
/// Hereda de Estacion que a su vez hereda de
///

import 'estacion.dart';

class Transbordo extends Estacion{

  //Agrega un correspondencia a su mapa de correspondnecias
  addCorrespondencia (String idLinea, int ubicacionEnLinea) => correspondencias[idLinea] = ubicacionEnLinea;

  //Regresa true si existe la correspondencia con X linea
  bool tieneCorrespondencia (String idLinea) => correspondencias.containsKey(idLinea);

  //Regresa su posicion en la linea que se pide
  getUbicacionEnLinea (String idLinea) => correspondencias[idLinea];

  //Convertir el ObjetoTransbordo -> Objeto tipo Map
  @override
  Map<String, dynamic> toMap(){

    var map = Map<String, dynamic>();

    //[if] para comprobar si el ID ya existe en la DB
    if ( id != null){
      map['t_id'] = id;
    }
    map['t_nombre'] = nombre;
    map['t_simbolo'] = simbolo;
    map['t_lat'] = latitud.toString();
    map['t_long'] = longitud.toString();
    map['t_map_id'] = mapsId;

    return map;
  }

  //Convertir el objeto tipo Map -> ObjetoTransbordo
  //Se crea un constructor que constrira el objeto a partir del mapa en la DB
  Transbordo.fromMapObject(Map<String, dynamic> map){
    this.id = map['t_id'];
    this.nombre = map['t_nombre'];
    this.simbolo = map['t_simbolo'];
    this.latitud = double.parse(map['t_lat']);
    this.longitud = double.parse(map['t_long']);
    this.mapsId = map['t_map_id'];
  }

}