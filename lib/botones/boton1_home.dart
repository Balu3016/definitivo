import 'package:flutter/material.dart';
import 'package:prueva_0/pages/list_page.dart';

class Boton1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //  decoration: BoxDecoration(
      //    image: DecorationImage(
      //        image: NetworkImage(
      //            "https://st2.depositphotos.com/1036149/6135/i/600/depositphotos_61350651-stock-photo-fun-cartoon-doctor.jpg"),
      //        fit: BoxFit.cover),
      //  ),
      child: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(Icons.arrow_forward),
                  Text(" Siguiente ")
                ],
              ),
              onPressed: () => {
                //print('ya jalo')
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ListPage())) //este es para ir ala pagina siguiente
              },
              color: Colors.lightBlue,
            ),
          ],
        ),
      ),
    );
  }
}
