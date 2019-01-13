/// Hecho por Rurick Maqueo Poisot
/// mail: rurick.mpoisot@gmail.com
/// github: github.com/skintigth
///
/// objeto Transbordo: es la abstraccion a objeto de un transbordo, consta de:
///   id: identificador del transbordo
///   simbolo: icono de la estacion, string al asset
///   nombre: nombre d ela estacion, string
///

class Transbordo{

  //Parametros
  String _id;
  String _nombre;
  String _simbolo;
  double _latitud;
  double _longitud;

  //Constructores
  Transbordo(this._nombre, this._simbolo);
  Transbordo.conId(this._id, this._nombre, this._simbolo);

  //Getters
  String get id => _id;
  String get nombre => _nombre;
  String get simbolo => _simbolo;
  double get latitud => _latitud;
  double get longitud => _longitud;

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
  set latitud (double newLatitud){
    this._latitud = newLatitud;
  }
  set longitud (double newLongitud){
    this._longitud = newLongitud;
  }

  //Convertir el ObjetoTransbordo -> Objeto tipo Map
  Map<String, dynamic> toMap(){

    var map = Map<String, dynamic>();

    //[if] para comprobar si el ID ya existe en la DB
    if ( _id != null){
      map['t_id'] = _id;
    }
    map['t_nombre'] = _nombre;
    map['t_simbolo'] = _simbolo;
    map['t_lat'] = latitud.toString();
    map['t_long'] = longitud.toString();

    return map;
  }

  //Convertir el objeto tipo Map -> ObjetoTransbordo
  //Se crea un constructor que constrira el objeto a partir del mapa en la DB
  Transbordo.fromMapObject(Map<String, dynamic> map){

    this._id = map['t_id'];
    this._nombre = map['t_nombre'];
    this._simbolo = map['t_simbolo'];
    this.latitud = double.parse(map['t_lat']);
    this.longitud = double.parse(map['t_long']);
  }
}