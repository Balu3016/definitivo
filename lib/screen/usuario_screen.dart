import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart' as Dio;
import 'package:intl/intl.dart';
import '../dio.dart';
import '../models/usuario.dart';

class UsuarioScreen extends StatefulWidget {
  final Usuario usuario;

  UsuarioScreen({Key key, this.usuario}) : super(key: key);

  @override
  _UsuarioScreenState createState() => _UsuarioScreenState();
}

class _UsuarioScreenState extends State<UsuarioScreen> {
  final _formKey = GlobalKey<FormState>();
  final List<String> _perfil = [
    'Admin',
    'Usuario',
    'Medico',
  ];
  final List<String> _sexo = [
    'Masculino',
    'Femenino',
    'Indefenido',
  ];

  



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
          title: Text(
              (widget.usuario.id <= 0 ? 'Crear ' : 'Editar ') + 'usuario')),
      body: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            children: <Widget>[
              _inputname(),
              Divider(),
              _inputprimerapellido(),
              Divider(),
              _inputsegundoapellido(),
              Divider(),
              _listaperfil(),
              Divider(),
              _listasexo(),
              Divider(),
              _inputtelefono(),
              Divider(),
              _boton()
            ],
          )),
    );
  }

  List<DropdownMenuItem<String>> _getOpcionesPerfil() {
    List<DropdownMenuItem<String>> lista = List();
    _perfil.forEach((perfil) {
      lista.add(DropdownMenuItem(child: Text(perfil), value: perfil));
    });
    return lista;
  }

    List<DropdownMenuItem<String>> _getOpcionesSexo() {
    List<DropdownMenuItem<String>> lista = List();
    _sexo.forEach((sexo) {
      lista.add(DropdownMenuItem(child: Text(sexo), value: sexo));
    });
    return lista;
  }



  Widget _listaperfil() {
    return DropdownButtonFormField(
      value: widget.usuario.perfil, //la opción seleccionada inicialmente
      items: _getOpcionesPerfil(),
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Perfil',
          labelText: 'Perfil',
          helperText: 'Perfil',
          suffixIcon: Icon(Icons.keyboard),
          icon: Icon(Icons.keyboard)),
      onChanged: (value) {
        widget.usuario.perfil = value;
        print(value);
      },
    );
  }

    Widget _listasexo() {
    return DropdownButtonFormField(
      value: widget.usuario.sexo, //la opción seleccionada inicialmente
      items: _getOpcionesSexo(),
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Sexo',
          labelText: 'Sexo',
          helperText: 'Sexo',
          suffixIcon: Icon(Icons.keyboard),
          icon: Icon(Icons.keyboard)),
      onChanged: (value) {
        widget.usuario.sexo = value;
        print(value);
      },
    );
  }

 

  Widget _inputname() {
    return TextFormField(
      // autofocus: true,
      initialValue: widget.usuario.nombre,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Nombre',
          labelText: 'Nombre',
          helperText: 'Nombre',
          suffixIcon: Icon(Icons.keyboard),
          icon: Icon(Icons.keyboard)),
      onSaved: (value) {
        widget.usuario.nombre = value;
      },
    );
  }

  Widget _inputprimerapellido() {
    return TextFormField(
      // autofocus: true,
      initialValue: widget.usuario.primerapellido,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Primer Apellido',
          labelText: 'Primer Apellido',
          helperText: 'Primer Apellido',
          suffixIcon: Icon(Icons.keyboard),
          icon: Icon(Icons.keyboard)),
      onSaved: (value) {
        widget.usuario.primerapellido = value;
      },
    );
  }

    Widget _inputsegundoapellido() {
    return TextFormField(
      // autofocus: true,
      initialValue: widget.usuario.segundoapellido,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Segundo Apellido',
          labelText: 'Segundo Apellido',
          helperText: 'Segundo Apellido',
          suffixIcon: Icon(Icons.keyboard),
          icon: Icon(Icons.keyboard)),
      onSaved: (value) {
        widget.usuario.segundoapellido = value;
      },
    );
  }




        Widget _inputtelefono() {
    return TextFormField(
      // autofocus: true,
      initialValue: widget.usuario.telefono,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Telefono',
          labelText: 'Telefono',
          helperText: 'Telefono',
          suffixIcon: Icon(Icons.keyboard),
          icon: Icon(Icons.keyboard)),
      onSaved: (value) {
        widget.usuario.telefono = value;
      },
    );
  }
  
  Widget _boton() {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        child: Text('Guardar'),
        onPressed: () {
          _formKey.currentState.save();
          _submit();
        },
      ),
    );
  }

  void _alerta(BuildContext context, String titulo, String mensaje) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            title: Text(titulo),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(mensaje),
                // FlutterLogo(size: 100.0),
              ],
            ),
            actions: <Widget>[
              TextButton(
                child: Text('Aceptar'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  void _submit() async {
    if (0 >= widget.usuario.id) {
      //crear, no existe
      Dio.Response response = await dio().post('users',
          data: json.encode(widget.usuario.toJson()),
          options: Dio.Options(headers: {'auth': true}));
      if (200 == response.statusCode) {
        _alerta(context, 'Usuario', 'Usuario creado');
      }
    } else {
      //actualizar
      print(widget.usuario.toJson());
      print('users/' + widget.usuario.id.toString());
      Dio.Response response = await dio().put(
          'users/' + widget.usuario.id.toString(),
          data: json.encode(widget.usuario.toJson()),
          options: Dio.Options(headers: {'auth': true}));
      if (200 == response.statusCode) {
        _alerta(context, 'Usuario', 'Usuario actualizado');
      }
    }

    // Navigator.pop(context); //regresar a pantalla previa
    // return true;
  }
}
