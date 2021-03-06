import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
//import 'package:prueva_0/fliles/sin-log.dart';
import 'package:prueva_0/providers/auth.dart';
//import 'package:prueva_0/pruevas/seleccion.dart';
//import 'package:prueva_0/screen/post-screen.dart';
//import 'package:prueva_0/screen/principal-screen.dart';
//import 'package:prueva_0/screen/principal-screen.dart';
//import 'package:prueva_0/screen/user-screen.dart';
import 'package:prueva_0/widgets/nav_drawer.dart';

import 'fliles/contac_view.dart';
import 'fliles/sin-log.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => Auth(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TextEdit(), //SelectionScreen(), //TextEdit(),ListasScreen()
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final storage = new FlutterSecureStorage();

  void _attempAuthentication() async {
    final key = await storage.read(key: 'auth');
    Provider.of<Auth>(context, listen: false).attemp(key);
  }

  @override
  void initState() {
    _attempAuthentication();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: NavDrawer(),
      body: Center(
        child: Consumer<Auth>(
          builder: (context, auth, child) {
            if (auth.authenticated) {
              return Text('You are logged in');
            } else {
              return ContactsPage(); //Text('inicie secion antes de hacer esta accion');
            }
          },
        ),
      ),
    );
  }
}
