import 'package:capstone_flutter/models/apis/bpjs/bpjs_model.dart';
import 'package:capstone_flutter/utils/const/urls.dart';
import 'package:capstone_flutter/utils/network_utils/network_utils.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BpjsApi {
  static const inquiryUrl = '${Urls.baseUrl}/bpjs/inquiry';
  static const payUrl = '${Urls.baseUrl}/bpjs/pay';

  static Future<BpjsModel> postInquiryBpjs(
      {required String id, required int month}) async {
    try {
      final token = await getToken();
      final response = await NetworkUtils.client(token: token).post(
        inquiryUrl,
        data: {
          "hp": id,
          "month": month,
        },
      );

      debugPrint("response postInquiryBpjs: ${response.data}");

      return BpjsModel.fromJson(response.data["data"]);
    } catch (e) {
      debugPrint('error postInquiryBpjs: $e');
      rethrow;
    }
  }

  static Future<BpjsModel> postPayBpjs({required String refId}) async {
    try {
      final token = await getToken();
      final response = await NetworkUtils.client(token: token).post(
        payUrl,
        data: {
          "ref_id": refId,
        },
      );

      debugPrint("response postPayBpjs: ${response.data}");

      return BpjsModel.fromJson(response.data["data"]);
    } catch (e) {
      debugPrint('error postPayBpjs: $e');
      rethrow;
    }
  }
}

Future<String> getToken() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('token') ?? '';
}
