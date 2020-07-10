import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class Success extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(
          20.0,
          statusBarHeight + 15.0,
          20.0,
          10.0,
        ),
        width: width,
        height: height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: <Color>[
              const Color(0xFF0014FF),
              const Color(0xFFFF2CDF),
            ],
          ),
        ),
        child: Center(
          child: FlareActor(
            "flare/success.flr",
            alignment: Alignment.center,
            fit: BoxFit.contain,
            animation: "success",
          ),
        ),
      ),
    );
  }
}
