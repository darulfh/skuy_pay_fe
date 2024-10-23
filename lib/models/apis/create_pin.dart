import 'dart:convert';
import 'package:capstone_flutter/utils/const/urls.dart';
import 'package:http/http.dart' as http;

class PinController {
  late String token;

  PinController(this.token);

  Future<bool> createPin(String pin) async {
    final url = Uri.parse('${Urls.baseUrl}/user/pin');
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    final body = jsonEncode({'pin': pin});

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
}
