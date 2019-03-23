import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

class HeaderDrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('graphics/header_background.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      height: 150,
      child: Container(
        margin: EdgeInsets.only(top: 75),
        height: 80,
        child: FlareActor(
          'assets/animaciones/train.flr',
          animation: 'MoveTrain',
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}
