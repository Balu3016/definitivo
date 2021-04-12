import 'package:flutter/material.dart';

class PostsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PostsState();
  }
}

class PostsState extends State<PostsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('posts'),
        ),
        body: Center(
          child: Text('posts x2 jajaj'),
        ));
  }
}
