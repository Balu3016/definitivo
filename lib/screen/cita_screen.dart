import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart' as Dio;

import '../dio.dart';
import '../models/cita.dart';

class CitaScreen extends StatefulWidget {
  final Cita cita;

  CitaScreen({Key key, this.cita}) : super(key: key);

  @override
  _CitaScreenState createState() => _CitaScreenState();
}

class _CitaScreenState extends State<CitaScreen> {
  final _formKey = GlobalKey<FormState>();
  final List<String> _estatus = [
    'Pendiente',
    'En Proceso',
    'Terminado',
  ];
  final List<String> _tipocita = [
    'Consultorio',
    'Domicilio',
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
          title: Text(
              (widget.cita.id <= 0 ? 'Crear ' : 'Editar ') + 'cita')),
      body: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            children: <Widget>[
              _listaEstatus(),
              Divider(),
              _listaTipoCita(),
              Divider(),
              _inputNombre(),
               Divider(),
              _inputDireccion(),
              Divider(),
              _inputCosto(),
               Divider(),
              _inputFechaCita(),
              Divider(),
              _inputTelefono(),
              Divider(),
              _boton()
            ],
          )),
    );
  }

  List<DropdownMenuItem<String>> _getOpcionesEstatus() {
    List<DropdownMenuItem<String>> lista = List();
    _estatus.forEach((estatus) {
      lista.add(DropdownMenuItem(child: Text(estatus), value: estatus));
    });
    return lista;
  }
  List<DropdownMenuItem<String>> _getOpcionesTipoCita() {
    List<DropdownMenuItem<String>> lista = List();
    _tipocita.forEach((tipocita) {
      lista.add(DropdownMenuItem(child: Text(tipocita), value: tipocita));
    });
    return lista;
  }



  Widget _listaEstatus() {
    return DropdownButtonFormField(
      value: widget.cita.estatus, //la opción seleccionada inicialmente
      items: _getOpcionesEstatus(),
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Estatus',
          labelText: 'Estatus',
          helperText: 'Estatus',
          suffixIcon: Icon(Icons.keyboard),
          icon: Icon(Icons.keyboard)),
      onChanged: (value) {
        widget.cita.estatus = value;
        print(value);
      },
    );
  }

  Widget _listaTipoCita() {
    return DropdownButtonFormField(
      value: widget.cita.tipocita, //la opción seleccionada inicialmente
      items: _getOpcionesTipoCita(),
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Tipo Cita',
          labelText: 'Tipo Cita',
          helperText: 'Tipo Cita',
          suffixIcon: Icon(Icons.keyboard),
          icon: Icon(Icons.keyboard)),
      onChanged: (value) {
        widget.cita.tipocita = value;
        print(value);
      },
    );
  }

 

  Widget _inputDireccion() {
    return TextFormField(
      // autofocus: true,
      initialValue: widget.cita.direccion,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Direccion',
          labelText: 'Direccion',
          helperText: 'Direccion',
          suffixIcon: Icon(Icons.keyboard),
          icon: Icon(Icons.keyboard)),
      onSaved: (value) {
        widget.cita.direccion = value;
      },
    );
  }

   Widget _inputFechaCita() {
    return TextFormField(
      // autofocus: true,
      initialValue: widget.cita.fechacita,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Fecha Cita',
          labelText: 'Fecha Cita',
          helperText: 'Fecha Cita',
          suffixIcon: Icon(Icons.keyboard),
          icon: Icon(Icons.keyboard)),
      onSaved: (value) {
        widget.cita.fechacita = value;
      },
    );
  }

  Widget _inputCosto() {
    return TextFormField(
      keyboardType: TextInputType.number,
      // autofocus: true,
      initialValue: widget.cita.costo.toString(),
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Costo',
          labelText: 'Costo',
          helperText: 'Costo',
          suffixIcon: Icon(Icons.keyboard),
          icon: Icon(Icons.keyboard)),
      onSaved: (value) {
        widget.cita.costo = double.parse(value);
      },
    );
  }


  Widget _inputTelefono() {
    return TextFormField(
      initialValue: widget.cita.telefono,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Telefono',
          labelText: 'Telefono',
          helperText: 'Telefono',
          suffixIcon: Icon(Icons.keyboard),
          icon: Icon(Icons.keyboard)),
      onSaved: (value) {
        widget.cita.telefono = value;
      },
    );
  }
  Widget _inputNombre() {
    return TextFormField(
      initialValue: widget.cita.nombrepaciente,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Nombre de Paciente',
          labelText: 'Nombre de Paciente',
          helperText: 'Nombre de Paciente',
          suffixIcon: Icon(Icons.keyboard),
          icon: Icon(Icons.keyboard)),
      onSaved: (value) {
        widget.cita.nombrepaciente = value;
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
    if (0 >= widget.cita.id) {
      //crear, no existe
      Dio.Response response = await dio().post('citas',
          data: json.encode(widget.cita.toJson()),
          options: Dio.Options(headers: {'auth': true}));
      if (200 == response.statusCode) {
        _alerta(context, 'Cita', 'Cita creado');
      }
    } else {
      //actualizar
      print(widget.cita.toJson());
      print('citas/' + widget.cita.id.toString());
      Dio.Response response = await dio().put(
          'citas/' + widget.cita.id.toString(),
          data: json.encode(widget.cita.toJson()),
          options: Dio.Options(headers: {'auth': true}));
      if (200 == response.statusCode) {
        _alerta(context, 'Cita', 'Cita actualizada');
      }
    }

    // Navigator.pop(context); //regresar a pantalla previa
    // return true;
  }
}
