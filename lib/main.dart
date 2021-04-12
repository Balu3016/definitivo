import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueva_0/pages/home_pages.dart';
import 'package:prueva_0/pages/list_page.dart';

import 'package:prueva_0/pages/login_page.dart';
import 'package:prueva_0/pages/save_page.dart';
import 'package:prueva_0/providers/auth.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => Auth(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HomePage.ROUTE,
      routes: {
        ListPage.ROUTE: (_) => ListPage(),
        SavePage.ROUTE: (_) => SavePage(),
        HomePage.ROUTE: (_) => HomePage(),
        LoginPage.ROUTE: (_) => LoginPage(),
      },
    );
  }
}
