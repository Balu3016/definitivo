import 'dart:convert';
import 'package:dio/dio.dart' as Dio;
import 'package:flutter/material.dart';
import 'package:prueva_0/dio.dart';
import 'package:prueva_0/models/user.dart';

class PostsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PostsState();
  }
}

class PostsState extends State<PostsScreen> {
  Future<List<User>> getPosts() async {
    Dio.Response response = await dio().get(
      'user/users',
      options: Dio.Options(
        headers: {
          'auth': true,
        },
      ),
    );

    List posts = json.decode(response.toString());

    return posts.map((post) => User.fromJson(post)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post'),
      ),
      body: Center(
        child: FutureBuilder<List<User>>(
          future: getPosts(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  var item = snapshot.data[index];
                  return ListTile(
                    title: Text(item.name + ' ' + item.lastname),
                    subtitle: Text(item.phone + ', Perfil: ' + item.perfil),
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
