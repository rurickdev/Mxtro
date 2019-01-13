import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:metroapp/utils/database_helper.dart';
import 'package:metroapp/models/index.dart';
import 'package:metroapp/widgets/estacionwidget.dart';


class ListaEstacionesTabWidget extends StatefulWidget{

  @override
  _ListaEstacionesTabState createState() => _ListaEstacionesTabState();

}

class _ListaEstacionesTabState extends State<ListaEstacionesTabWidget>{

  //Widget auxiliar dinamico que mostrara una barra de carga y luego
  //Cambiara al Custom Scroll View con la lista de lineas
  static Widget aux = CircularProgressIndicator(
    value: null,
    strokeWidth: 5,
  );

  static List<Estacion> listaEstaciones; //Contiene todas las estaciones de la DB
  static List<Transbordo> listaTransbordos; //Contiene todas los transbordos de la DB
  static List<Correspondencia> listaCorrespondencias; //Contiene todas las uniones de Lineas-Transbordos de la DB
  static List<Linea> listaLineas; //Contiene todas las lineas de la DB
  static List<Sistema> listaSistemas; //Contiene todas los sistemas de transporte de la DB

  List<bool> valoresSwitches = [];
  List<Switch> listaSwitches = [];
  List<Widget> csvWidgetList = [];

  DatabaseHelper dbHelper = DatabaseHelper();

  //Ejecuta todos los metodos de los getLista para cargar las listas
  // locales con los datos de la DB
  llenarListasFromDB(){

    if(listaEstaciones == null && listaTransbordos == null && listaCorrespondencias == null && listaSistemas == null && listaLineas == null){
      //Inicializar listas vacias
      listaEstaciones = List<Estacion>();
      listaTransbordos = List<Transbordo>();
      listaCorrespondencias = List<Correspondencia>();
      listaSistemas = List<Sistema>();
      listaLineas = List<Linea>();

      //Llenar listas con los datos de la DB
      getListasFromDB();
    }
  }
  getListasFromDB(){

    //abrir DB
    final Future<Database> dbFuture = dbHelper.inicializarDB();
    dbFuture.then((database){
      //Obtener las listas de la DB
      //Estaciones
      Future<List<Estacion>> futuroEstaciones = dbHelper.getListaEstaciones();
      futuroEstaciones.then((estaciones){
        listaEstaciones = estaciones;
        //Transbordos
        Future<List<Transbordo>> futuroTransbordos = dbHelper.getListaTransbordos();
        futuroTransbordos.then((transbordos){
          listaTransbordos = transbordos;
          //Correspondencias
          Future<List<Correspondencia>> futuroCorrespondencias = dbHelper.getListaCorrespondencias();
          futuroCorrespondencias.then((correspondencias){
            listaCorrespondencias = correspondencias;
            //Lineas
            Future<List<Linea>> futuroLineas = dbHelper.getListaLineas();
            futuroLineas.then((lineas){
              listaLineas = lineas;
              for (var linea in listaLineas) {
                //Agregar estaciones a su respectiva linea
                for (var estacion in listaEstaciones) {
                  if (estacion.lineaId == linea.id) {
                    linea.setEstaciones(estacion);
                  }
                }
                //Agregar transbordos a su respectiva linea
                for (var transbordo in listaTransbordos){
                  for (var correspondencia in listaCorrespondencias){
                    if (transbordo.id == correspondencia.transIdLin){
                      if (correspondencia.linIdTrans == linea.id){
                        correspondencia.nombre = transbordo.nombre;
                        correspondencia.latitud = transbordo.latitud;
                        correspondencia.longitud = transbordo.longitud;
                        correspondencia.lineaId = linea.id;
                        correspondencia.simbolo = transbordo.simbolo;
                        linea.setTransbordo(correspondencia);
                      }
                    }
                  }
                }
              }
              //Sistemas
              Future<List<Sistema>> futuroSistemas = dbHelper.getListaSistemas();
              futuroSistemas.then((sistemas){
                listaSistemas = sistemas;
                //asignas las lineas al sistema al que perteneces
                for (var x in listaSistemas){
                  for (var y in listaLineas){
                    if (y.sistemaId == x.id) {
                      x.setLineas(y);
                    }
                  }
                }
                //Se vuelve a ejecutar el build para entonces general la [CustomScrollView]
                setState(() {
                });
              });//Sistemas
            });//Lineas
          });//Corespondencias
        });//Transbordos
      });//Estaciones
    });
  }

  //Funciones auxiliares que van creando los elementos para el [Custom Scroll View]
  crearListaSwitches(){

    print(valoresSwitches);

    for (int i=0; i<listaLineas.length; i++){
      valoresSwitches.add(true);
      listaSwitches.add(Switch(
        value: valoresSwitches[i],
        onChanged: (bool valor){
          setState(() {
            valoresSwitches[i] = valor;
            print('El switch ${i+1} fue tapeado');
            print(listaSwitches[i].value);
            print(valoresSwitches);
            //ToDo: implementar las funciones del if-else
            if (valor){
              csvWidgetList.insert(i+1, crearSliverStickyHeader(listaLineas[i]));
              print(listaSwitches[i].value);
            }else {
              csvWidgetList.removeAt(i+1);
              print(listaSwitches[i].value);
            }
          });
        },
        activeColor: Color(int.parse(listaLineas[i].color)),
        activeThumbImage: AssetImage('graphics/imagenes_estaciones/'+listaLineas[i].simbolo),
        inactiveThumbImage: AssetImage('graphics/imagenes_estaciones/'+listaLineas[i].simbolo+'.disable'),
      ));
    }

    //return listaSwitches;

  }
  SliverAppBar crearSliverAppBar(){
    //Agrega el [SliverAppBar] a la lista para el CustomScrollView
    return SliverAppBar(
      automaticallyImplyLeading: false,
      flexibleSpace: GridView.count(
        crossAxisCount: (listaLineas.length~/2),
        children: listaSwitches,
        childAspectRatio: 2,
        physics: NeverScrollableScrollPhysics(),
      ),
      pinned: false,
      expandedHeight: 66.5,
      backgroundColor: Colors.white,
      floating: true,
    );
  }
  SliverStickyHeader crearSliverStickyHeader(Linea linea){
    //Agregar los [SliverStickyHeader] con sus [SliverFixedExtentList] al CustomScrollView
    return SliverStickyHeader(
      header: Container(
        color: Color(int.parse(linea.color)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Linea ', style: TextStyle(color: Colors.white),),
            Image(
              image: AssetImage('graphics/imagenes_estaciones/'+linea.simbolo),
              height: 20,
            ),
          ],
        ),
      ),
      sliver: SliverFixedExtentList(
        itemExtent: 70.0,
        delegate: SliverChildListDelegate(crearListaWidEstLinActual(linea)),
      ),
    );
  }
  List<EstacionWidget> crearListaWidEstLinActual(Linea lineaLocal){
    List<EstacionWidget> listaWidgetsLinActual = [];

    for(int i=0; i<lineaLocal.getNumeroEstaciones(); i++){
      listaWidgetsLinActual.add(EstacionWidget(lineaLocal.listaEstacionTransbordos[i]));
    }

    return listaWidgetsLinActual;
  }

  //Crear el [Custom Scroll View] donde ira la lista de estaciones
  List<Widget> crearCSVwidgetList(){
      for(var linea in listaLineas)
        csvWidgetList.add(crearSliverStickyHeader(linea));

    return csvWidgetList;
  }

  @override
  Widget build(BuildContext context){
    if(listaLineas == null){
      llenarListasFromDB();
      return aux;
    }else {
      return CustomScrollView(
        slivers: crearCSVwidgetList(),
      );
    }
  }
}
