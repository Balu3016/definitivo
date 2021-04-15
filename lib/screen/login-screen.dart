import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueva_0/providers/auth.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}

class LoginState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String _email;
  String _password;
  void submit() {
    Provider.of<Auth>(context, listen: false).login(
      credentials: {
        'email': _email,
        'password': _password,
      },
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Form(
        child: Scrollbar(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'al221910445@gmail.com',
                  ),
                  onSaved: (value) {
                    _email = value;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Password',
                  ),
                  onSaved: (value) {
                    _password = value;
                  },
                ),
                SizedBox(
                  width: double.infinity,
                  child: FlatButton(
                    child: Text('Login'),
                    onPressed: () {
                      _formKey.currentState.save();

                      this.submit();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
