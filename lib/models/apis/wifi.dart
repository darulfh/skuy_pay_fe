import 'package:capstone_flutter/utils/const/urls.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../wifi_model.dart';

class WifiInquiryApi {
  static const baseUrl = '${Urls.baseUrl}/wifi/inquiry';

  static Future<WiFiInquiryResponse?> inquireWiFiBill(
    WiFiInquiryRequest request,
    String token,
  ) async {
    try {
      final response = await http.post(
        Uri.parse(baseUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(request.toJson()),
      );

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        final data = jsonData['data'];
        // ignore: unused_local_variable
        final metadata = jsonData['metadata'];
        // ignore: avoid_print
        print(data);

        return WiFiInquiryResponse.fromJson(data);
      } else if (response.statusCode == 500) {
        throw Exception(
            'Failed to inquire WiFi bill. Status code: ${response.statusCode}. Invalid customer ID.');
      } else {
        throw Exception(
            'Failed to inquire WiFi bill. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Tangkap error dan tampung pesan error dalam variabel
      String errorMessage = 'Error occurred: $e';
      // ignore: avoid_print
      print(errorMessage);
      return null;
    }
  }
}
