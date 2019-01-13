import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:metroapp/models/estacion.dart';
import 'package:metroapp/models/transbordo.dart';
import 'package:metroapp/models/correspondencia.dart';
import 'package:metroapp/models/linea.dart';
import 'package:metroapp/models/sistema.dart';

class DatabaseHelper{

  //Instanciar el objeto Singleton de la clase
  static DatabaseHelper _dbHelper;
  //Var de Base de datos a utilizar dentro de la App
  Database _db;

  //Constructor y Fabrica del singleton para ejecutar ua sola vez
  //Sin importar que se use la DB en otras pantallas de la App
  DatabaseHelper._crearInstancia();

  factory DatabaseHelper() {

    if (_dbHelper == null) {
      _dbHelper= DatabaseHelper._crearInstancia();
    }
    return _dbHelper;
  }

  Future<Database> get db async {

    if (_db == null) {
      _db = await inicializarDB();
    }
    return _db;
  }

  //inicializar DB, regresa la base de datos que se va a usar
  Future<Database> inicializarDB() async{
    //obtener el directorio donde esta la DB
    var dbPath = await getDatabasesPath();
    var path = join(dbPath, 'metro_3_from_asset.db');

    //Intenta abrir la DB si ya existe en almacenamiento
    try{
      _db = await openDatabase(path, readOnly: true);
    }catch (e){
      print('Error $e');
    }

    //copiara a almacenamiento del dispositivo la DB si es que no existe en almacenamiento
    if (_db == null){
      print('Creando copia desde asset');

      //proceso de copiado
      ByteData data = await rootBundle.load(join('assets', 'metro_3.db'));
      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await new File(path).writeAsBytes(bytes);

      //Abrir DB
      _db = await openDatabase(path, readOnly: true);
    }

    return _db;
  }

  ///obtener los objetos

  //Get Lista de Map<String, dynamic> de Objetos
  //Estaciones
  Future<List<Map<String, dynamic>>> getListaMapEstacion() async{

    Database dataBase = await this._db;
    var resultados = await dataBase.query('estacion');

    return resultados;

  }
  //Transbordos
  Future<List<Map<String, dynamic>>> getListaMapTransbordo() async{

    Database dataBase = await this._db;
    var resultados = await dataBase.query('transbordo');

    return resultados;

  }
  //Correspondencia
  Future<List<Map<String, dynamic>>> getListaMapCorrespondencia() async{

    Database dataBase = await this._db;
    var resultados = await dataBase.query('trans_lin');

    return resultados;

  }
  //Lineas
  Future<List<Map<String, dynamic>>> getListaMapLinea() async{

    Database dataBase = await this._db;
    var resultados = await dataBase.query('linea');

    return resultados;

  }
  //Sistemas
  Future<List<Map<String, dynamic>>> getListaMapSistema() async{

    Database dataBase = await this._db;
    var resultados = await dataBase.query('sistemaTransporte');

    return resultados;

  }


  //Get Lista de Objetos
  //Estaciones
  Future<List<Estacion>> getListaEstaciones() async {

    var listaMaps = await getListaMapEstacion();
    int contador = listaMaps.length;

    List<Estacion> listaEstaciones = List<Estacion>();
    for (int i=0; i<contador; i++){
      listaEstaciones.add(Estacion.fromMapObject(listaMaps[i]));
    }

    return listaEstaciones;
  }
  //Transbordos
  Future<List<Transbordo>> getListaTransbordos() async {

    var listaMaps = await getListaMapTransbordo();
    int contador = listaMaps.length;

    List<Transbordo> listaTransbordos = List<Transbordo>();
    for (int i=0; i<contador; i++){
      listaTransbordos.add(Transbordo.fromMapObject(listaMaps[i]));
    }

    return listaTransbordos;
  }
  //Transbordos - Lineas
  Future<List<Correspondencia>> getListaCorrespondencias() async {

    var listaMaps = await getListaMapCorrespondencia();
    int contador = listaMaps.length;

    List<Correspondencia> listaTransLineas = List<Correspondencia>();
    for (int i=0; i<contador; i++){
      listaTransLineas.add(Correspondencia.fromMapObject(listaMaps[i]));
    }

    return listaTransLineas;
  }
  //Lineas
  Future<List<Linea>> getListaLineas() async {

    var listaMaps = await getListaMapLinea();
    int contador = listaMaps.length;

    List<Linea> listaLineas= List<Linea>();
    for (int i=0; i<contador; i++){
      listaLineas.add(Linea.fromMapObject(listaMaps[i]));
    }

    return listaLineas;
  }
  //Sistemas
  Future<List<Sistema>> getListaSistemas() async {

    var listaMaps = await getListaMapSistema();
    int contador = listaMaps.length;

    List<Sistema> listaSistemas = List<Sistema>();
    for (int i=0; i<contador; i++){
      listaSistemas.add(Sistema.fromMapObject(listaMaps[i]));
    }

    return listaSistemas;
  }


}