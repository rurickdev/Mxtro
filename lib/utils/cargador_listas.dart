import 'package:sqflite/sqflite.dart';
import '../models/index.dart';
import 'database_helper.dart';

class CargadorListas{

  //Lista con todas las estaciones de la DB
  List<Estacion> estaciones;
  //Lista con todas los transbordos de la DB
  List<Transbordo> transbordos;
  //Lista con todas las correspondencias de la DB
  List<Correspondencia> correspondencias;
  //Lista con todas las lineas de la DB
  List<Linea> lineas;
  //Lista con todas los sistemas de transporte de la DB
  List<Sistema> sistemas;

  DatabaseHelper dbHelper = DatabaseHelper();

  //Obtiene las listas de objetos de la base de datos y las copia
  //a las variables locales correspondientes
  Future<List<Sistema>> cargarListas() async{

    //abrir DB
    final Database miDataBase = await dbHelper.inicializarDB();

    //Estaciones
    estaciones = await dbHelper.getListaEstaciones();

    //Correspondencias
    correspondencias = await dbHelper.getListaCorrespondencias();

    //Transbordos
    transbordos = await dbHelper.getListaTransbordos();

    //Lineas
    lineas = await dbHelper.getListaLineas();

    //Sistemas
    sistemas = await dbHelper.getListaSistemas();

    //Funciones que configuran y setean los datos de los
    // sistemas, lineas, transbordos y estaciones
    asignarCorrespondenciasATransbordo();
    asignarEstacionesTransbordosALineas();
    asignarLineasASistemas();

    //Cerrar base de datos
    miDataBase.close();
    return sistemas;
  }

  //Asignar a los transbordos sus correspondencias
  asignarCorrespondenciasATransbordo(){
    for (var transbordo in transbordos) {
      for (var correspondencia in correspondencias) {
        //Agrega la correspondencias al transbordo si le pertenece (su id es el mismo)
        if (transbordo.id == correspondencia.transIdLin) {
          transbordo.addCorrespondencia(correspondencia.linIdTrans,
              correspondencia.ubicacionEnLinea);
        }
      }
    }
  }

  //Llena las lineas con sus respectivas estaciones y transbordos, y las ordena
  asignarEstacionesTransbordosALineas(){
    for (var linea in lineas) {
      for (var estacion in estaciones) {
        //Agregar estaciones a su respectiva linea si el id es el mismo
        if (estacion.lineaId == linea.id) {
          estacion.linea = linea;
          linea.addEstacion(estacion);
        }
      }
      for (var transbordo in transbordos) {
        //Agregar transbordos a la linea si el transbordo contiene una correspondencia a la linea
        if (transbordo.tieneCorrespondencia(linea.id)) {
          transbordo.linea = linea;
          linea.addTransbordo(transbordo);
        }
      }
      //Ordena la linea despues de llenarla con sus transbordos y estaciones
      linea.ordenarEstaciones();
    }
  }

  //Asignas las lineas al sistema al que perteneces
  asignarLineasASistemas(){
    for (var sistema in sistemas){
      for (var linea in lineas){
        //Agrega la linea a un sistema si los id corresponden
        if (linea.sistemaId == sistema.id) {
          //widget.todasLasEstaciones.addAll(linea.estaciones);
          sistema.addLinea(linea);
        }
      }
    }
  }

}