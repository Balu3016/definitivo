import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart' as Dio;
import 'package:flutter/material.dart';
import 'package:flutter_authentication_with_laravel_sanctum/models/cita.dart';
import 'package:flutter_authentication_with_laravel_sanctum/screen/cita_screen.dart';

import '../dio.dart';

class CitasScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CitasState();

  }
}


class CitasState extends State<CitasScreen> {
   Future<List<Cita>> getCitas() async {
     Dio.Response response = await dio().get('citas',
        options: Dio.Options(
            headers: {'auth': true})); //http://10.0.2.2:8000/api/user/posts
            //print(json.decode(response.toString())['data']);
    List citas = json.decode(response.toString());
  //   return posts.map((post) => Producto.fromJson(post)).toList();
  // }
        List<Cita> c =
      citas.map((cita) => Cita.fromJson(cita)).toList();
   for(int cit = 0; cit < c.length; cit++){
       print('${c[cit].id} = ${c[cit].tipocita} ${c[cit].estatus} ' );
       
     }
     return c;

     /*Dio.Response response = await dio().get(
       'estudios',
       options: Dio.Options(
         headers: {'auth': true}));
         print(response.toString());

     List estudios = json.decode(response.toString());
     
     
     
*/
     
     //return estudios.map((estudio) => estudio.fromJson(estudio)).toList();
     

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
           _agregaCita(),
          _recargarCitas(),
        ],
        title:Text('Citas'),
         ),
         body: Center(
           child: FutureBuilder<List<Cita>>(
             future: getCitas(),
             builder: (context, snapshot) {
               if (snapshot.connectionState != ConnectionState.done) {
                return CircularProgressIndicator();
              } else if (snapshot.hasData) {
                 return ListView.builder(
                   itemCount: snapshot.data.length,
                   itemBuilder: (context, index){
                     var item = snapshot.data[index];
                     print(item.toString());
                     return ListTile(
                       title:Text("Cita de ${item.nombrepaciente}"),
                       subtitle:Text("Estado: ${item.estatus}                \$ ${item.costo}",
                       style: const TextStyle(fontSize:18, color: Colors.black)),
                       trailing: Icon(Icons.edit),
                       leading: Container(
                         width:100,
                         height:100,
                         child:Image.asset("assets/images/Cita.png"),
                         
                       ), //Image.asset("assets/images/${item.img}"),
                       onTap: () {
                          // log('Agregar al carrito: ' + item.id.toString());
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      CitaScreen(cita: item)));
                        },
                     );
                   });

               }else if (snapshot.hasError){
                 log(snapshot.error.toString());
                 return Text('No se encontro citas');
               }

               return CircularProgressIndicator();
             }
           ),
           ),
    );
  }
   Widget _agregaCita() {
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
          Cita cita = Cita(
              id: 0,
              estatus: 'Pendiente',
              costo: 0,
              tipocita: 'Domicilio',
              direccion: '',
              fechacita: '');
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CitaScreen(cita: cita)));
        },
        child: Icon(Icons.add));
  }

  Widget _recargarCitas() {
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

