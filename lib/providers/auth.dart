import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart' as Dio;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:platform_device_id/platform_device_id.dart';
import 'package:prueva_0/models/user.dart';
import '../dio.dart';

class Auth extends ChangeNotifier {
  final storage = new FlutterSecureStorage();

  bool _aunthenticated = false;
  User _user;
  bool get authenticated => _aunthenticated;
  User get user => _user;

  Future login({Map credentials}) async {
    String deviceId = await getDeviceId();

    Dio.Response response = await dio().post(
      'auth/token',
      data: json.encode(credentials..addAll({'deviceId': deviceId})),
    );

    String token = json.decode(response.toString())['token'];

    await attemp(token);
    storeToken(token);
  }

  Future attemp(String token) async {
    try {
      Dio.Response response = await dio().get(
        'auth/user',
        options: Dio.Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
      _user = User.fromJson(json.decode(response.toString()));
      _aunthenticated = true;
    } catch (e) {
      _aunthenticated = false;
    }
    notifyListeners();
  }

  storeToken(String token) async {
    await storage.write(key: 'auth', value: token);
  }

  Future getToken() async {
    return await storage.read(key: 'auth');
  }

  deleteToken() async {
    await storage.delete(key: 'auth');
  }

  Future getDeviceId() async {
    String deviceId;

    try {
      deviceId = await PlatformDeviceId.getDeviceId;
    } catch (e) {}

    return deviceId;
  }

  void logout() async {
    _aunthenticated = false;

    await dio().delete('auth/token',
        data: {'deviceId': await getDeviceId()},
        options: Dio.Options(headers: {'auth': true}));

    await deleteToken();

    notifyListeners();
  }
}
