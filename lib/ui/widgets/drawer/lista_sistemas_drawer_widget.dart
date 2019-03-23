import 'package:flutter/material.dart';
import '../../../models/sistema.dart';
import '../../screens/sistema_screen.dart';

class ListaSistemasDrawerWidget extends StatelessWidget {
  final List<Sistema> sistemas;

  ListaSistemasDrawerWidget({
    @required this.sistemas,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 0),
        itemCount: sistemas.length,
        itemBuilder: (BuildContext context, int index) {
          Sistema sistema = sistemas[index];
          return ListTile(
            title: Text(sistema.nombre),
            leading: Image.asset(
              sistema.simbolo,
              height: 35,
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => SistemaScreen(sistemas, sistema),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
