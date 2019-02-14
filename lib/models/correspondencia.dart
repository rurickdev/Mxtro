/// Hecho por Rurick Maqueo Poisot
/// mail: rurick.mpoisot@gmail.com
/// github: github.com/skintigth
///
/// objeto Correspondencia: es un objeto auxiliar que permite relacionar una
/// linea con sus transbordos, consta de:
///   transIdLin: id del transbordo en la linea
///   linIdTrans: id de la linea en el transbordo
///   ubicacionEnLinea: marca la posicion del transbordo en la lista de estaciones de la linea
///
/// Tenerlo evita que se use un solo objeto transbordo y se sobreescriban sus datos
///

class  Correspondencia {

  //Parametros
  String _transIdLin;
  String _linIdTrans;
  int _ubicacionEnLinea;

  //Getters
  String get transIdLin => _transIdLin;
  String get linIdTrans => _linIdTrans;
  int get ubicacionEnLinea => _ubicacionEnLinea;

  //Convertir el ObjetoTransLinea -> Objeto tipo Map
  Map<String, dynamic> toMap(){

    var map = Map<String, dynamic>();

    map['t_id_l'] = _transIdLin;
    map['l_id_t'] = _linIdTrans;
    map['ubicacion_l'] = _ubicacionEnLinea;

    return map;
  }

  //Convertir Objeto tipo Map -> ObjetoTransLinea
  //Usamos un constructor que cree el objeto apartir del map
  Correspondencia.fromMapObject(Map<String, dynamic> map){

    this._transIdLin = map['t_id_l'];
    this._linIdTrans = map['l_id_t'];
    this._ubicacionEnLinea = map['ubicacion_l'];
  }
}
