import 'package:flutter/material.dart';
import 'package:metroapp/models/index.dart';
import '../screens/linea_screen.dart';
import 'estacion_widget.dart';

class LineaWidget extends StatelessWidget{

  final Linea linea;

  LineaWidget(this.linea);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[
          SizedBox(height: 10,),
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(linea.nombre, style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, color: Color(linea.color)),),
                InkWell(
                  child: Icon(Icons.arrow_forward, color: Color(linea.color),),
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => LineaScreen(linea: linea,))),
                ),
              ],
            ),
          ),
          Container(
            height: 65,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: linea.numeroEstaciones,
              itemBuilder: (context, index){
                return EstacionWidget(linea.estaciones[index],);
              },
            ),
          ),
          SizedBox(height: 10,),
        ],
      ),
    );
  }

}