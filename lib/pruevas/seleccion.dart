import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prueva_0/main.dart';
//import 'package:prueva_0/screen/login-screen.dart';
//import 'package:prueva_0/screen/register-screen.dart';

class SelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primaryColor: Colors.teal),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text("Healthcare System"),
          ),
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    "https://i.pinimg.com/474x/4c/a5/6a/4ca56a9e8af36e917a67d3d021eaaff5.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Text(
                    "Es la empresa que nace de una situacion"
                    "adversa para ayudar a sus clientes y les da"
                    "confiansa al salir de casa con un grupo de especialistas estan"
                    "apra ayudarlos y estar atentos a las nesesidaes de cada usuario",
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  MyHomePage(title: 'Sanctum Autentiation')));
                    },
                    child: Text(' vive la experiencia '),
                  ),
                ),
              ],
            ),
          ),
        ));
}}
