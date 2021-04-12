import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:prueva_0/pages/home_pages.dart';
import 'package:prueva_0/pages/list_page.dart';
import 'package:prueva_0/providers/auth.dart';

class LoginScreen extends StatefulWidget {
  static const String ROUTE = "/login1";

  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}

class LoginState extends State<LoginScreen> {
  final _formkey = GlobalKey<FormState>();
  String _correo;
  String _contra;

  void submit() {
    Provider.of<Auth>(context, listen: false)
        .login(credentials: {'correo': _correo, 'contraseña': _contra});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
          key: _formkey,
          child: Scrollbar(
              child: SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                SizedBox(
                  height: 350,
                ),
                TextFormField(
                  initialValue: 'al221910413@gmail.com',
                  decoration: InputDecoration(
                    labelText: 'Correo Electronico',
                    hintText: 'Ejemplo@gmail.com ',
                  ),
                  onSaved: (value) {
                    _correo = value;
                  },
                ),
                TextFormField(
                  initialValue: 'balu3016_',
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Contraseña',
                    hintText: ' 9 digitos ',
                  ),
                  onSaved: (value) {
                    _contra = value;
                  },
                ),
                SizedBox(
                  width: double.infinity,
                  child: FlatButton(
                    child: Text('Login'),
                    onPressed: () {
                      _formkey.currentState.save();
                      this.submit();
                      Navigator.pushNamed(context, ListPage.ROUTE);
                    },
                  ),
                )
              ],
            ),
          ))),
    );
  }
}
