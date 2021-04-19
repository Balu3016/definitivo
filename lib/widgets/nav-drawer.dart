import 'package:flutter/material.dart';
import 'package:flutter_authentication_with_laravel_sanctum/providers/auth.dart';
import 'package:flutter_authentication_with_laravel_sanctum/screen/login-screen.dart';
import 'package:flutter_authentication_with_laravel_sanctum/screen/usuarios-screen.dart';
import 'package:flutter_authentication_with_laravel_sanctum/screen/citas_screen.dart';
import 'package:flutter_authentication_with_laravel_sanctum/screen/emergencias_screen.dart';
import 'package:provider/provider.dart';
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return  Drawer(
        child: Consumer<Auth>(
          builder:(context, auth, child){
            if(auth.authenticated){
              return ListView(
          children: <Widget> [
            UserAccountsDrawerHeader(
              accountName: Text(auth.user.name,style: TextStyle(fontWeight: FontWeight.bold),),
              accountEmail: Text(auth.user.email),
            ),
                         
            ListTile(
              leading: Icon(
                Icons.supervised_user_circle_outlined,
              ),
              title: Text('Usuarios'),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder:(context)=>UsuariosScreen()));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.medical_services_outlined,
              ),
              title: Text('Citas'),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder:(context)=>CitasScreen()));
              },
            ),
             ListTile(
              leading: Icon(
                Icons.local_taxi_outlined,
              ),
              title: Text('Emergencias'),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder:(context)=>EmergenciasScreen()));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.logout ,
              ),
                      title: Text('Cerrar sesion'),
                          onTap: (){
                            Provider.of<Auth>(context,listen: false).logout();
                          },
                         ),
          ],
        );
            }else{
              return ListView(
                children: [
                  ListTile(
                    leading: Icon(
                Icons.logout ,
              ),
                      title: Text('Login'),
                       onTap: (){
                         Navigator.push(context, MaterialPageRoute(builder:(context)=>LoginScreen()));
                         },
                         ),
                         ListTile(
                           leading: Icon(
                Icons.app_registration  ,
              ),
                      title: Text('Register'),
                       onTap: (){
                         Navigator.push(context, MaterialPageRoute(builder:(context)=>LoginScreen()));
                         },
                         ),
                ],
              );
            }
          },
      ),
    );
  }
}