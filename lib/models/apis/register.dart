import 'dart:convert';
import 'package:capstone_flutter/utils/const/urls.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../user_model.dart';

class RegisterController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  Future<User?> registerUser(
      String name, String email, String phone, String password) async {
    final url = Uri.parse('${Urls.baseUrl}/register');
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode(
        {'name': name, 'email': email, 'phone': phone, 'password': password});

    // ignore: avoid_print
    print(name);
    // ignore: avoid_print
    print(email);
    // ignore: avoid_print
    print(password);
    // ignore: avoid_print
    print(phone);
    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 201) {
      final jsonData = jsonDecode(response.body);
      // ignore: avoid_print
      print('Response body: ${response.body}');
      return User.fromJson(jsonData);
    } else {
      // ignore: avoid_print
      print('Response body: ${response.body}');
      return null;
    }
  }

  void dispose() {}
}
