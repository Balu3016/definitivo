import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueva_0/nav-drawer.dart';
import 'package:prueva_0/providers/auth.dart';

class ListPage extends StatelessWidget {
  static const String ROUTE = "/listas";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('home de la app'),
        ),
        drawer: NavDrawer(),
        body: Center(child: Consumer<Auth>(
          builder: (context, auth, child) {
            if (auth.authenticaticated) {
              return Text('bienvenido al sistema');
            } else {
              return Text('lo sentimos inicie secion ');
            }
          },
        )));
  }
}
