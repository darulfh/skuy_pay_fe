import 'package:capstone_flutter/models/apis/bpjs/bpjs_api.dart';
import 'package:capstone_flutter/models/apis/token_listrik/token_listrik_inquiry.dart';
import 'package:capstone_flutter/models/apis/token_listrik/token_listrik_pay.dart';
import 'package:capstone_flutter/utils/const/urls.dart';
import 'package:capstone_flutter/utils/network_utils/network_utils.dart';
import 'package:flutter/material.dart';

class TokenListrikApi {
  static const inquiryUrl = '${Urls.baseUrl}/electricitytoken/inquiry';
  static const payUrl = '${Urls.baseUrl}/electricitytoken/pay';

  static Future<TokenListrikInquiry> postInquiryTokenListrik(
      {required String customerId}) async {
    try {
      final token = await getToken();

      final response = await NetworkUtils.client(token: token).post(
        inquiryUrl,
        data: {
          "customer_id": customerId,
        },
      );

      debugPrint("response postInquiryTokenListrik: ${response.data}");

      return TokenListrikInquiry.fromJson(response.data["data"]);
    } catch (e) {
      debugPrint('error postInquiryTokenListrik: $e');
      rethrow;
    }
  }

  static Future<TokenListrikPay> postPayTokenListrik({
    required String customerId,
    required String productCode,
  }) async {
    try {
      final token = await getToken();
      final response = await NetworkUtils.client(token: token).post(
        payUrl,
        data: {
          "customer_id": customerId,
          "product_code": productCode,
        },
      );

      debugPrint("response postPayTokenListrik: ${response.data}");

      return TokenListrikPay.fromJson(response.data["data"]);
    } catch (e) {
      debugPrint('error postPayTokenListrik: $e');
      rethrow;
    }
  }
}
