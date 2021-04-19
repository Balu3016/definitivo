import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart' as Dio;
import 'package:flutter/material.dart';
import 'package:flutter_authentication_with_laravel_sanctum/models/emergencia.dart';

import '../dio.dart';

class EmergenciasScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return EmergenciasState();

  }
}


class EmergenciasState extends State<EmergenciasScreen> {
   Future<List<Emergencia>> getDispositivos() async {
     Dio.Response response = await dio().get('emergencias',
        options: Dio.Options(
            headers: {'auth': true})); //http://10.0.2.2:8000/api/user/posts
            //print(json.decode(response.toString())['data']);
    List emergencias = json.decode(response.toString());
  //   return posts.map((post) => Producto.fromJson(post)).toList();
  // }
        List<Emergencia> e =
      emergencias.map((emergencia) => Emergencia.fromJson(emergencia)).toList();
   for(int emer = 0; emer < e.length; emer++){
       print('${e[emer].id} = ${e[emer].nombreinstitucion} ${e[emer].zonainstitucion} ' );
       
     }
     return e;

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
        backgroundColor: Colors.red,
        leading: Icon(
          Icons.menu,
          color: Colors.black,
          //onPressed:
        ),
        actions: <Widget>[
          _recargarEmergencias(),
        ],
        title:Text('Emergencias'),
         ),
         body: Center(
           child: FutureBuilder<List<Emergencia>>(
             future: getDispositivos(),
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
                       title:Text("${item.nombreinstitucion} - ${item.zonainstitucion}"),
                       subtitle:Text("Telefono: ${item.telefonoinstitucion}",
                       style: const TextStyle(fontSize:18, color: Colors.black)),
                       leading: Container(
                         width:100,
                         height:100,
                         color: Colors.blue,
                         child:Image.network("http://10.0.2.2:8000/Imagenes/${item.img}", fit: BoxFit.cover,),
                         
                       ), //Image.asset("assets/images/${item.img}"),
                       
                     );
                   });

               }else if (snapshot.hasError){
                 log(snapshot.error.toString());
                 return Text('No se encontro dispositivos');
               }

               return CircularProgressIndicator();
             }
           ),
           ),
    );
  }
  
  Widget _recargarEmergencias() {
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


//Necesitaremos un statefulWidget para las categorias de estudios_medicos
class Categorias extends StatefulWidget {
  @override
  _CategoriasState createState() => _CategoriasState();
  
}



class _CategoriasState extends State<Categorias> {
  List<String> categorias = ["Componentes", "Dispositivos", "Paquetes" ];
  // Por defecto Laboratorio, al abrir
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categorias.length,
        itemBuilder:(context, index) => Text(categorias[index],),
         ),
      
    );
  }
}