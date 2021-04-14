import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueva_0/pages/login-screen.dart';
import 'package:prueva_0/posts-screen.dart';
import 'package:prueva_0/providers/auth.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(child: Consumer<Auth>(
      builder: (context, auth, child) {
        if (auth.authenticaticated) {
          return ListView(
            children: [
              ListTile(
                title: Text('balu balu'),
              ),
              ListTile(
                title: Text('Posts'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PostsScreen()));
                },
              ),
              ListTile(
                title: Text('Cerrar Secion'),
                onTap: () {
                  Provider.of<Auth>(context, listen: false).logout();
                },
              ),
            ],
          );
        } else {
          return ListView(children: [
            ListTile(
              title: Text('Iniciar secion'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
            ),
            ListTile(
              title: Text('Registrate'),
              onTap: () {
                //
              },
            ),
          ]);
        }
      },
    ));
  }
}
