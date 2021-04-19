import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart' as Dio;
import 'package:flutter/material.dart';
import 'package:flutter_authentication_with_laravel_sanctum/models/usuario.dart';
import 'package:flutter_authentication_with_laravel_sanctum/screen/usuario_screen.dart';
import '../dio.dart';

class UsuariosScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return UsuariosState();

  }
}


class UsuariosState extends State<UsuariosScreen> {
   Future<List<Usuario>> getUsuarios() async {
     Dio.Response response = await dio().get('users',
        options: Dio.Options(
            headers: {'auth': true})); //http://10.0.2.2:8000/api/user/posts
            //print(json.decode(response.toString())['data']);
    List usuarios = json.decode(response.toString());
         List<Usuario> u =
     usuarios.map((usuario) => Usuario.fromJson(usuario)).toList();
    for(int idx = 0; idx < u.length; idx++){
       print('${u[idx].id} = ${u[idx].nombre} ${u[idx].primerapellido} ${u[idx].segundoapellido} ' );
       print('${u[idx].id} = ${u[idx].perfil} ' );
     }
    return u;

     /*Dio.Response response = await dio().get(
       'usuarios',
       options: Dio.Options(
         headers: {'auth': true}));
         print(response.toString());

     List usuarios = json.decode(response.toString());
     
     
     
*/
     
     //return usuarios.map((usuario) => Usuario.fromJson(usuario)).toList();
     

   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.green,
        leading: Icon(
          Icons.menu,
          color: Colors.black,
          //onPressed:
        ),
        actions: <Widget>[
           _agregarUsuario(),
          _recargarUsuarios(),
        ],
        title:Text('Usuarios'),
         ),
         body: Center(
           child: FutureBuilder<List<Usuario>>(
             future: getUsuarios(),
             builder: (context, snapshot) {
               if(snapshot.hasData){
                 return ListView.builder(
                   itemCount: snapshot.data.length,
                   itemBuilder: (context, index){
                     
                     
                     var item = snapshot.data[index];

                     return ListTile(
                       title:Text(item.nombre+' '+item.primerapellido+ ' '+item.segundoapellido),
                       subtitle:Text(item.perfil),
                       leading: CircleAvatar(
                         child: Text(item.perfil.substring(0,1)),
                       ),
                       trailing: Icon(Icons.edit),
                       onTap: () {
                          // log('Agregar al carrito: ' + item.id.toString());
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      UsuarioScreen(usuario: item)));
                        },
                     );
                   }
                   );

               }else if (snapshot.hasError){
                 log(snapshot.error.toString());
                 return Text('Failed to load Usuarios');
               }

               return CircularProgressIndicator();
             }
           ),
           ),
    );
  }

Widget _agregarUsuario() {
  
    return TextButton(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.blueGrey),
          overlayColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.hovered))
                return Colors.blue.withOpacity(0.04);
              if (states.contains(MaterialState.focused) ||
                  states.contains(MaterialState.pressed))
                return Colors.blue.withOpacity(0.12);
              return null; // Defer to the widget's default.
            },
          ),
        ),
        onPressed: () {
          // print('agregar');
          Usuario usuario = Usuario(
              id: 0,
              nombre: '',
              primerapellido: '',
              segundoapellido: '',
              perfil: 'Usuario',
              sexo: 'Masculino',   
              telefono: 'Numero Telefonico'
              );
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => UsuarioScreen(usuario: usuario)));
        },
        child: Icon(Icons.add));
  }

  Widget _recargarUsuarios() {
    return TextButton(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.blueGrey),
          overlayColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.hovered))
                return Colors.blue.withOpacity(0.04);
              if (states.contains(MaterialState.focused) ||
                  states.contains(MaterialState.pressed))
                return Colors.blue.withOpacity(0.12);
              return null; // Defer to the widget's default.
            },
          ),
        ),
        onPressed: () {
          setState(() {});
        },
        child: Icon(Icons.refresh));
  }
}
