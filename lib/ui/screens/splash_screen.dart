import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
// import 'package:quick_actions/quick_actions.dart';
import '../../utils/cargador_listas.dart';
import '../../models/sistema.dart';
// import '../../main.dart';
import 'sistema_screen.dart';
// import 'settings_screen.dart';

class SplashScreen extends StatelessWidget {
  final CargadorListas cargador = CargadorListas();
  // final QuickActions quickActions = const QuickActions();
  // int sistemaIndex = 0;
  // List<Sistema> sistemas;

  // createQuickActions() {
  //   var context = MyApp.navigatorKey.currentState;
  //   quickActions.initialize(
  //     (String shortcutId) {
  //       switch (shortcutId) {
  //         case 'metro':
  //           print(shortcutId);
  //           sistemaIndex = 0;
  //           break;
  //         case 'metrobus':
  //           print(shortcutId);
  //           sistemaIndex = 1;
  //           break;
  //         case 'trenligero':
  //           print(shortcutId);
  //           sistemaIndex = 2;
  //           break;
  //         case 'pumabus':
  //           print(shortcutId);
  //           sistemaIndex = 5;
  //           break;
  //         default:
  //           print(shortcutId);
  //       }
  //       print('hello from: $shortcutId');
  //       print(context);
  //       print(context.context);
  //       try {
  //         Navigator.push(
  //           MyApp.navigatorKey.currentContext,
  //           MaterialPageRoute(
  //             builder: (context) => SettingsScreen(sistemas),
  //           ),
  //         );
  //       } catch (e) {
  //         print(e);
  //       }
  //       print('bye from: $shortcutId');
  //     },
  //   );

  //   quickActions.setShortcutItems(
  //     <ShortcutItem>[
  //       const ShortcutItem(
  //         type: 'metro',
  //         localizedTitle: 'Metro',
  //         icon: 'train',
  //       ),
  //       const ShortcutItem(
  //           type: 'metrobus',
  //           localizedTitle: 'Metrobus',
  //           icon: 'directions_bus'),
  //       const ShortcutItem(
  //         type: 'trenligero',
  //         localizedTitle: 'Tren Ligero',
  //         icon: 'tram',
  //       ),
  //       const ShortcutItem(
  //         type: 'pumabus',
  //         localizedTitle: 'Pumabus',
  //         icon: 'directions_bus',
  //       ),
  //     ],
  //   );
  // }

  loadDB(context, {index = 0}) {
    Timer(
      Duration(seconds: 5),
      () async {
        List<Sistema> sistemas;
        sistemas = await cargador.cargarListas();
        await afterLoading(context, sistemas, index: index);
      },
    );
  }

  afterLoading(context, List<Sistema> sistemas, {index}) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => SistemaScreen(sistemas, sistemas[index]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double altura = MediaQuery.of(context).size.height / 3;
    double ancho = MediaQuery.of(context).size.width;

    // createQuickActions();
    loadDB(context);

    return Container(
      color: Colors.white,
      width: ancho,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            height: altura,
            //child: RaisedButton(onPressed: afterLoading),
          ),
          Container(
            height: altura,
            child: Icon(
              Icons.train,
              color: Colors.deepOrange,
              size: 100,
            ),
          ),
          Container(
            height: altura,
            //width: MediaQuery.of(context).size.width,
            child: FlareActor(
              'assets/animaciones/train.flr',
              animation: 'MoveTrain',
              fit: BoxFit.fitWidth,
            ),
          ),
        ],
      ),
    );
  }
}
