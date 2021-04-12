import 'package:flutter/cupertino.dart';

class Auth extends ChangeNotifier {
  bool _authenticaticated = false;
  bool get authenticaticated => _authenticaticated;

  void login({Map credentials}) {
    _authenticaticated = true;
    notifyListeners();
  }

  void logout() {
    _authenticaticated = false;
    notifyListeners();
  }
}
