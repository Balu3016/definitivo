import 'package:flutter/material.dart';
import 'package:prueva_0/pages/list_page.dart';

class SavePage extends StatelessWidget {
  static const String ROUTE = "/save";
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
  final nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(
                "https://i.pinimg.com/474x/ae/57/0d/ae570d588ba24667cc2f11a09a868d38.jpg"),
            fit: BoxFit.cover),
      ),
      padding: EdgeInsets.all(40),
      child: Form(
          key: _formkey,
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: 180,
              ),
              TextFormField(
                  controller: nameController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return " Ingrese Nombre Completo";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      labelText: ("Nombre Completo"),
                      border: OutlineInputBorder())),
              SizedBox(
                height: 19,
              ),
              TextFormField(
                  controller: titleController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return " Ingrese Correo";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      labelText: ("Correo Electronico"),
                      border: OutlineInputBorder())),
              SizedBox(
                height: 19,
              ),
              TextFormField(
                  controller: contentController,
                  maxLength: 9,
                  validator: (value) {
                    if (value.isEmpty) {
                      return " Contraseña no encontrada";
                    }
                    return null;
                  },
                  //este se ocupa para esconder la contraseña
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: ("Contraseña"), border: OutlineInputBorder())),

              // aen navigator cambiar o agregar ruta de base de datos
              RaisedButton(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(Icons.switch_account),
                    SizedBox(
                      width: 10,
                    ),
                    Text(" Registrarte")
                  ],
                ),
                onPressed: () => {
                  if (_formkey.currentState.validate())
                    {
                      print(nameController.text +
                          "  Valido:  " +
                          titleController.text +
                          "   valido  " +
                          contentController.text),
                      Navigator.pushNamed(context, ListPage.ROUTE),
                    },
                },
              )
            ],
          )),
    );
  }
}

//void _exitoso(BuildContext context) {
//  showDialog(
//    context: context,
//    child: AlertDialog(
//      title: Text("hola"),
//      content: Text("que haces"),
//    ),
//  );
//}
