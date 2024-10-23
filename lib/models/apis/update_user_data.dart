import 'dart:convert';
import 'package:capstone_flutter/utils/const/urls.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'login.dart';

class UpdateUserController {
  late String token;

  UpdateUserController(this.token);

  Future<bool> updateUserById(String name, String email, String phone) async {
    final url = Uri.parse('${Urls.baseUrl}/user');
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    final body = jsonEncode({'name': name, 'email': email, 'phone': phone});

    final response = await http.put(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      // ignore: avoid_print
      print('berhasil: ${response.body}');
      return true;
    } else {
      // ignore: avoid_print
      print('gagal: ${response.body}');
      return false;
    }
  }

  Future<String> updateUserImage(String image) async {
    try {
      final dio = Dio(BaseOptions(
        contentType: Headers.jsonContentType,
        connectTimeout: const Duration(minutes: 2),
        receiveTimeout: const Duration(minutes: 2),
        sendTimeout: const Duration(minutes: 2),
      ));
      dio.interceptors.add(LogInterceptor(
          requestBody: true,
          logPrint: (object) => debugPrint(object.toString())));

      final filename = image.split("/").last;
      final fileImage = await MultipartFile.fromFile(image, filename: filename);
      final fileData = FormData.fromMap({'image': fileImage});

      var response = await dio.put(
        '${Urls.baseUrl}/user/image',
        data: fileData,
        options: Options(
          contentType: Headers.jsonContentType,
          headers: {"Authorization": 'Bearer $token'},
        ),
      );
      String result = response.data["data"]["image"] ?? "";
      debugPrint("response updateUserImage1: $result");
      debugPrint("response updateUserImage2: ${response.data}");

      LoginController().saveUserImageToSharedPreference(result);

      return result;
    } catch (e, s) {
      debugPrint("Error: $e\nStackrace: $s");
      throw 'Error: $e\nStackrace: $s';
    }
  }
}
