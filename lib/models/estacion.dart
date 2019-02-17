/// Hecho por Rurick Maqueo Poisot
/// mail: rurick.mpoisot@gmail.com
/// github: github.com/skintigth
///
/// objeto Estacion: es la abstraccion a objeto de una estacion,
/// hereda de SuperEstacion consta de los mismos parametros que
/// su clase padre mas:
///   ubicacionEnLinea: marca su posicion en la lista de estaciones de la linea
///

import 'superestacion.dart';

class Estacion extends SuperEstacion{

  int _ubicacionEnLinea;

  int get ubicacionEnLinea => this._ubicacionEnLinea;
  set ubicacionEnLinea (int newUbicacion){
    this._ubicacionEnLinea = newUbicacion;
  }

  //Constructor unamed, necesario para poder crear un
  //constructor nombrado en la clase transbordo
  Estacion();

  //Regresa la estacion siguiente
  Estacion get siguiente{

    //Si es la ultima regresa null
    if(this.ubicacionEnLinea == this.linea.estaciones.length){
      return null;
    }

    return this.linea.estaciones[this.ubicacionEnLinea];
  }
  //Regresa la estacion anteior
  Estacion get anterior{

    //Si es la primera regresa null
    if(this.ubicacionEnLinea == 1){
      return null;
    }

    return this.linea.estaciones[this.ubicacionEnLinea-2];
  }

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
    map['ubicacion_l'] = _ubicacionEnLinea;
    map['e_lat'] = latitud.toString();
    map['e_long'] = longitud.toString();
    map['e_map_id'] = mapsId;

    return map;
  }

  //Convierte Objeto tipo Map -> ObjetoEstacion
  //Hay que crear un constructor que cree el objeto a partir del mapa en la DB
  Estacion.fromMapObject(Map<String, dynamic> map){

    this.id = map['e_id'];
    this.nombre = map['e_nombre'];
    this.simbolo = map['e_simbolo'];
    this.lineaId = map['l_id_e'];
    this._ubicacionEnLinea = map['ubicacion_l'];
    this.latitud = double.parse(map['e_lat']);
    this.longitud = double.parse(map['e_long']);
    this.mapsId = map['e_map_id'];
  }
}