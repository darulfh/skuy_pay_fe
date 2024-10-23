import 'dart:convert';
import 'package:capstone_flutter/utils/const/urls.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../user_model.dart';

class LoginController {
  TextEditingController emailController =
      TextEditingController(text: kDebugMode ? "user2@gmail.com" : "");
  TextEditingController passwordController =
      TextEditingController(text: kDebugMode ? "12345678" : "");
  Future<User?> loginUser(
      String email, String password, BuildContext context) async {
    final url = Uri.parse('${Urls.baseUrl}/login');
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode({'email': email, 'password': password});
    // ignore: avoid_print
    // ignore: avoid_print
    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      // ignore: avoid_print
      print('Response body: ${response.body}');
      final user = User.fromJson(jsonData);
      saveUserInfoToSharedPreferences(user.token);

      // // Mengirim permintaan ke URL lain saat login berhasil
      // final profileUrl = Uri.parse('${Urls.baseUrl}/profile');
      // final profileHeaders = {
      //   'Content-Type': 'application/json',
      //   'Authorization':
      //       'Bearer ${user.token}', // Menggunakan token JWT pada header
      // };
      // final profileResponse =
      //     await http.get(profileUrl, headers: profileHeaders);

      // if (profileResponse.statusCode == 200) {
      //   final profileJsonData = jsonDecode(profileResponse.body);
      //   // ignore: avoid_print
      //   print('Profile Response body: ${profileResponse.body}');
      //   final userId = User.fromJson(profileJsonData);
      //   // ignore: use_build_context_synchronously
      //   final userProvider = Provider.of<UserProvider>(context, listen: false);
      //   userProvider.updateUserInfo(
      //       userId.name, userId.phone, userId.balance.toDouble());

      //   saveUserInfoToSharedPreferences2(
      //     userId.name,
      //     userId.phone,
      //     userId.email,
      //     userId.balance,
      //     userId.image,
      //   ); // Menggunakan model UserId
      //   // ignore: avoid_print
      //   print(userId.phone);
      //   // ignore: avoid_print
      //   print(userId.name);
      //   // ignore: avoid_print
      //   print(userId.email);
      //   // ignore: avoid_print
      //   print(userId.balance);
      //   // ignore: avoid_print
      //   print(userId.pin);
      //   // Proses data profile sesuai kebutuhan
      // } else {
      //   // ignore: avoid_print
      //   print('Profile Response body: ${profileResponse.body}');
      // }
      // ignore: avoid_print
      print(user.token);
      return user;
    } else {
      // ignore: avoid_print
      print('Response body: ${response.body}');
      return null;
    }
  }

  void saveUserInfoToSharedPreferences(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

  void saveUserInfoToSharedPreferences2(String name, String phones,
      String email, double balance, String image) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', name);
    await prefs.setString('phone', phones);
    await prefs.setString('email', email);
    await prefs.setDouble('balance', balance);
    await prefs.setString('image', image);
  }

  void saveUserImageToSharedPreference(String image) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('image', image);
  }

  Future<String> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("token") ?? "";
  }

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }
}
