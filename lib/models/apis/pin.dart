import 'dart:convert';
import 'package:capstone_flutter/utils/const/urls.dart';
import 'package:http/http.dart' as http;

Future<bool> checkPinStatus(String token) async {
  final profileUrl = Uri.parse('${Urls.baseUrl}/profile');
  final profileHeaders = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $token',
  };

  final profileResponse = await http.get(profileUrl, headers: profileHeaders);

  if (profileResponse.statusCode == 200) {
    final profileJsonData = jsonDecode(profileResponse.body);
    final pin = profileJsonData['data']['pin'] as String;
    // ignore: avoid_print
    print('pin: $pin');

    final isPinCreated = pin.isNotEmpty;
    return isPinCreated;
  } else {
    // Handle error when retrieving profile data
    // ignore: avoid_print
    print('Failed to retrieve profile');
    return false;
  }
}
