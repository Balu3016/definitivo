import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:prueva_0/models/doctores.dart';
import 'package:prueva_0/providers/auth.dart';
import 'package:prueva_0/screen/doctores-screen.dart';
import 'package:prueva_0/screen/emergencias-screen.dart';
import 'package:prueva_0/screen/login-screen.dart';
import 'package:prueva_0/screen/post-screen.dart';
import 'package:prueva_0/screen/register-screen.dart';
import 'package:prueva_0/screen/user-screen.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(child: Consumer<Auth>(
      builder: (context, auth, child) {
        if (auth.authenticated) {
          return ListView(
            children: [
              ListTile(
                title: Text(auth.user.name),
              ),
              ListTile(
                title: Text("Post"),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PostsScreen()));
                },
              ),
              ListTile(
                title: Text("Servicios de emergencias"),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EmergenciasScreen()));
                },
              ),
              ListTile(
                title: Text(" Doctores  "),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EmergenciasScreen1()));
                },
              ),
              ListTile(
                title: Text(" Usuarios  "),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PostsScreen1()));
                },
              ),
              ListTile(
                title: Text('Logout'),
                onTap: () {
                  Provider.of<Auth>(context, listen: false).logout();
                },
              ),
            ],
          );
        } else {
          return ListView(
            children: [
              ListTile(
                title: Text("Login"),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
              ),
              ListTile(
                title: Text("Register"),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RegisScreen()));
                },
              ),
            ],
          );
        }
      },
    ));
  }
}
