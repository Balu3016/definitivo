import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueva_0/providers/auth.dart';

class RegisScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RegisState();
  }
}

class RegisState extends State<RegisScreen> {
  final _formKey = GlobalKey<FormState>();
  String _email;
  String _password;
  String _estado;
  String _numero;
  String _sexo;
  String _paterno;
  String _materno;
  String _nombre;
  void submit() {
    Provider.of<Auth>(context, listen: false).login(
      credentials: {
        'estado': _estado,
        'email': _email,
        'password': _password,
        'numero': _numero,
        'sexo': _sexo,
        'paterno': _paterno,
        'materno': _materno,
        'nombre': _nombre,
      },
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registrate'),
      ),
      body: Form(
        child: Scrollbar(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                TextFormField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    labelText: ' Nombre de usuario',
                  ),
                  onSaved: (value) {
                    _nombre = value;
                  },
                ),
                TextFormField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    labelText: 'Apellido Paterno',
                  ),
                  onSaved: (value) {
                    _paterno = value;
                  },
                ),
                TextFormField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    labelText: 'Apellido Materno',
                  ),
                  onSaved: (value) {
                    _materno = value;
                  },
                ),
                TextFormField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    labelText: 'Sexo',
                  ),
                  onSaved: (value) {
                    _sexo = value;
                  },
                ),
                TextFormField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    labelText: 'Numero Telefonico',
                  ),
                  onSaved: (value) {
                    _numero = value;
                  },
                ),
                TextFormField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'ejemplo@correo.com',
                  ),
                  onSaved: (value) {
                    _email = value;
                  },
                ),
                TextFormField(
                  textAlign: TextAlign.center,
                  initialValue: "Toluca Estado de México",
                  decoration: InputDecoration(
                    labelText: 'Direccion',
                  ),
                  onSaved: (value) {
                    _estado = value;
                  },
                ),
                TextFormField(
                  textAlign: TextAlign.center,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                  ),
                  onSaved: (value) {
                    _password = value;
                  },
                ),
                SizedBox(
                  width: double.infinity,
                  child: FlatButton(
                    child: Text('Login'),
                    onPressed: () {
                      _formKey.currentState.save();
                      this.submit();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
