import 'dart:convert';
import 'package:capstone_flutter/utils/const/urls.dart';
import 'package:http/http.dart' as http;

Future<bool> checkPinPayment(String token, String pin) async {
  final pinRequestBody = {
    'pin': pin,
  };

  final pinUrl = Uri.parse('${Urls.baseUrl}/user/pin');
  final pinHeaders = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $token',
  };

  final pinResponse = await http.post(
    pinUrl,
    headers: pinHeaders,
    body: jsonEncode(pinRequestBody),
  );

  if (pinResponse.statusCode == 200) {
    final pinJsonData = jsonDecode(pinResponse.body);
    final metadata = pinJsonData['metadata'];
    final status = metadata['status'];

    if (status == 200) {
      final message = metadata['message'];
      // ignore: avoid_print
      print('Pin check result: $message');

      return true; // Pin is correct
    } else {
      final message = metadata['message'];
      // ignore: avoid_print
      print('Pin check failed: $message');

      return false; // Pin is incorrect
    }
  } else {
    // Handle error when checking pin
    // ignore: avoid_print
    print('Failed to check pin');
    return false;
  }
}
