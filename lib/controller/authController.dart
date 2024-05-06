import 'dart:convert';

import 'package:amazon_clone/constant/global.dart';
import 'package:amazon_clone/utils/errorHandler.dart';
import 'package:flutter/cupertino.dart';
import "package:http/http.dart" as http;

import '../model/userModel.dart';

class authController {
  Future<void> signUpUser(
      {required BuildContext context,
      required String email,
      required String password,
      required String name}) async {
    try {
      User user = User(
          id: '',
          email: email,
          password: password,
          name: name,
          address: '',
          type: '');
      http.Response res = await http.post(Uri.parse("$uri/api/signup"),
          body: jsonEncode(user.fromApptoDB()),
          headers: <String, String>{
            'content-type': 'application/json; charset=UTF-8'
          });

      httpErrorHandler(
          response: res,
          context: context,
          onSuccess: () {
            showSnackBar(context, "Account Created Successfully");
          });
    } catch (e) {
      showSnackBar(context, "Error occurred-${e.toString()}");
    }
  }
}
