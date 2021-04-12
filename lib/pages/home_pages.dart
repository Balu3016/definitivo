import 'package:flutter/material.dart';
import 'package:prueva_0/botones/boton1_home.dart';
import 'package:prueva_0/botones/boton2_home.dart';
//import 'package:prueva_0/botones/boton2_home.dart';

class HomePage extends StatelessWidget {
  static const String ROUTE = "/home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: cuerpo(),
    );
  }
}

Widget cuerpo() {
  return Container(
    decoration: BoxDecoration(
      image: DecorationImage(
          image: NetworkImage(
              "https://i.pinimg.com/originals/f3/6a/f2/f36af2cd47e98121d5c1318a41a58004.jpg"),
          fit: BoxFit.cover),
    ),
    child: Center(
      child: ListView(
        children: <Widget>[
          SizedBox(
            height: 150,
          ),
          nombre(),
          SizedBox(
            height: 40,
          ),
          //aki va cuadro de texto para info de la app
          Boton2(),
          SizedBox(
            height: 50,
          ),
          Boton1(),
        ],
      ),
    ),
  );
}

Widget nombre() {
  return Container(
    child: Center(
        child: Text(
      'Healthcare System (HS)',
      style: TextStyle(color: Colors.black, fontSize: 30.0),
    )),
  );
}
