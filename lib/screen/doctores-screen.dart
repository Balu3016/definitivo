import 'dart:convert';
import 'package:dio/dio.dart' as Dio;
import 'package:flutter/material.dart';
import 'package:prueva_0/models/doctores.dart';

import '../dio.dart';

class EmergenciasScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return EmergenciasState();
  }
}

class EmergenciasState extends State<EmergenciasScreen> {
  Future<List<Doctores>> getPosts() async {
    Dio.Response response = await dio().get(
      'user/doctores',
      options: Dio.Options(
        headers: {
          'auth': true,
        },
      ),
    );

    List posts = json.decode(response.toString());

    return posts.map((post) => Doctores.fromJson(post)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Healthcare System/Medicos'),
      ),
      body: Center(
        child: FutureBuilder<List<Doctores>>(
          future: getPosts(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  var item = snapshot.data[index];
                  return ListTile(
                    title: Text(
                        item.name + item.lastname + '. Perfil: ' + item.perfil),
                    subtitle: Text(item.phone +
                        '. Cedula(s): ' +
                        item.cedulas +
                        ', Especialidades: ' +
                        item.especialidades +
                        ', email: ' +
                        item.email +
                        ', zona: ' +
                        item.zona),
                    leading: CircleAvatar(
                      child: Text(item.name.substring(0, 1)),
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text("Error al cargar la información");
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
