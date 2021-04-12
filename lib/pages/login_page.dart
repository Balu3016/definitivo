import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  static const String ROUTE = "/login";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //appBar: AppBar(
        //title: Text("guardar"),
        // ),
        body: Container(
      child: _FromSave(),
    ));
  }
}

class _FromSave extends StatelessWidget {
  final _formkey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final contentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(
                "https://i.pinimg.com/474x/9e/b1/51/9eb15181fd0d1d6961b984dd7fddb0aa.jpg"),
            fit: BoxFit.cover),
      ),
      padding: EdgeInsets.all(40),
      child: Form(
          key: _formkey,
          child: ListView(
            children: [], // <Widget>
          )),
    );
  }
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
