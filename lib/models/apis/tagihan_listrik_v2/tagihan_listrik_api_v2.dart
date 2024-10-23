import 'package:capstone_flutter/models/apis/bpjs/bpjs_api.dart';
import 'package:capstone_flutter/models/apis/tagihan_listrik_v2/tagihan_listrik_inquiry.dart';
import 'package:capstone_flutter/utils/const/urls.dart';
import 'package:capstone_flutter/utils/network_utils/network_utils.dart';
import 'package:flutter/material.dart';

class TagihanListrikApiV2 {
  static const inquiryUrl = '${Urls.baseUrl}/electricitybill/inquiry';
  static const payUrl = '${Urls.baseUrl}/electricitybill/pay';

  static Future<TagihanListrikInquiry> postInquiryTagihanListrik(
      {required String customerId}) async {
    try {
      final token = await getToken();

      final response = await NetworkUtils.client(token: token).post(
        inquiryUrl,
        data: {
          "hp": customerId,
        },
      );

      debugPrint("response postInquiryTagihanListrik: ${response.data}");

      return TagihanListrikInquiry.fromJson(response.data["data"]);
    } catch (e) {
      debugPrint('error postInquiryTagihanListrik: $e');
      rethrow;
    }
  }

  static Future<TagihanListrikInquiry> postPayTagihanListrik({
    required String refId,
  }) async {
    try {
      final token = await getToken();
      final response = await NetworkUtils.client(token: token).post(
        payUrl,
        data: {
          "ref_id": refId,
        },
      );

      debugPrint("response postPayTagihanListrik: ${response.data}");

      return TagihanListrikInquiry.fromJson(response.data["data"]);
    } catch (e) {
      debugPrint('error postPayTagihanListrik: $e');
      rethrow;
    }
  }
}
