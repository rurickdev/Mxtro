class ObjetoSuperEstacion{

  String _id;
  String _nombre;
  String _simbolo;
  String _lineaId;
  int _ubicacionEnLinea;

  String get id => _id;
  String get nombre => _nombre;
  String get simbolo => _simbolo;
  String get lineaId => _lineaId;
  int get ubicacionEnLinea => _ubicacionEnLinea;

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

  String dameNombre(){
    String cadena = nombre +' '+ simbolo +' '+ lineaId +' '+ubicacionEnLinea.toString();
    return cadena;
  }
}