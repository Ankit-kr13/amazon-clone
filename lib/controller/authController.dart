import 'dart:ffi';
import 'dart:html';
import 'package:amazon_clone/constant/global.dart';
import "package:http/http.dart" as http;

import '../model/userModel.dart';

class authController {
  Future<void> signUpUser(
      {required String email,
      required String password,
      required String name}) async {
    User user = User(
        id: '',
        email: email,
        password: password,
        name: name,
        address: '',
        type: '');
    await http.post(Uri.parse("$uri/api/signup"),
        body: user.fromApptoDB(),
        headers: <String, String>{
          'content-type': 'application/json; charset=UTF-8'
        });
  }
}
