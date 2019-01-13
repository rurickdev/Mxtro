class ObjetoSuperEstacion{

  String _id;
  String _nombre;
  String _simbolo;
  String _lineaId;
  int _ubicacionEnLinea;
  double _latitud;
  double _longitud;

  String get id => _id;
  String get nombre => _nombre;
  String get simbolo => _simbolo;
  String get lineaId => _lineaId;
  int get ubicacionEnLinea => _ubicacionEnLinea;
  double get latitud => _latitud;
  double get longitud=> _longitud;

  set id (String newId){
    this._id = newId;
  }
  set nombre (String newNombre){
    this._nombre = newNombre;
  }
  set simbolo (String newSimbolo){
    this._simbolo = 'graphics/imagenes_estaciones/' + newSimbolo;
  }
  set lineaId (String newLineaId){
    this._lineaId = newLineaId;
  }
  set ubicacionEnLinea (int newUbicacion){
    this._ubicacionEnLinea = newUbicacion;
  }
  set latitud (double newLatitud){
    this._latitud = newLatitud;
  }
  set longitud (double newLongitud){
    this._longitud = newLongitud;
  }
}