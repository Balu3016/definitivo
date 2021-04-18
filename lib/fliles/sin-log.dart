import 'package:flutter/material.dart';

class TextEdit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.teal), home: TarjetasScreen());
  }
}

class TarjetasScreen extends StatefulWidget {
  @override
  _TarjetasScreenState createState() => _TarjetasScreenState();
}

class _TarjetasScreenState extends State<TarjetasScreen> {
  String _texto = ' esta es un ';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('tarjetas')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(_texto),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
                child: Text(' edicion de nombres'),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(
                          builder: (context) => Editor(_texto)))
                      .then((result) {
                    if (result != null) {
                      setState(() {
                        _texto = result;
                      });
                    }
                  });
                })
          ],
        ),
      ),
    );
  }
}

class Editor extends StatefulWidget {
  final String texto;
  Editor(this.texto);

  @override
  _EditorState createState() => _EditorState();
}

class _EditorState extends State<Editor> {
  TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController(text: this.widget.texto);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('editor')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: <Widget>[
              TextField(
                controller: _controller,
              ),
              RaisedButton(
                  child: Text('guardar'),
                  onPressed: () {
//_contrller.text
                    Navigator.of(context).pop(_controller.text);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
