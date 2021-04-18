import 'package:flutter/material.dart';
import 'package:prueva_0/pruevas/seleccion.dart';
//import 'package:prueva_0/pruevas/seleccion.dart';
//import 'package:prueva_0/pruevas/selectbuton.dart';

//void main() {
//  runApp(MaterialApp(
//    title: 'Returning Data',
//    home: HomeScreen(),
//  ));
//}

class PrintScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Healthcare System '),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Text(
                  'Es la empresa que nace de una situacion adversa para ayudar a sus clientes y les da confiansa al salir de casa'),
            ),
            SizedBox(),
            SelectionButton()
          ],
        ),
      ),
    );
  }
}
