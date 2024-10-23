import 'package:capstone_flutter/utils/const/urls.dart';
import 'package:capstone_flutter/utils/network_utils/network_utils.dart';
import 'package:flutter/cupertino.dart';

class PayPaketData {
  static const baseUrl = '${Urls.baseUrl}/user/ppd';

  final String paketdata;
  final String productid;
  final String? discountid;
  final String phonenumber;
  final String token;

  PayPaketData(
    this.token,
    this.paketdata,
    this.productid,
    this.phonenumber,
    this.discountid,
  );

  Future<PayPaketData?> payPaketData() async {
    final Map<String, dynamic> requestBody = {
      "type": paketdata,
      "product_id": productid,
      "discount_id": discountid,
      "phone_number": phonenumber,
    };

    try {
      final response = await NetworkUtils.client(token: token).post(
        baseUrl,
        data: requestBody,
      );

      debugPrint("response payPaketData: ${response.data}");

      return PayPaketData(token, paketdata, productid, phonenumber, discountid);
    } catch (e) {
      debugPrint('error: $e');
      return null;
    }

    // final response = await http.post(
    //   Uri.parse(baseUrl),
    //   headers: {
    //     'Content-Type': 'application/json',
    //     'Authorization': 'Bearer $token',
    //   },
    //   body: jsonEncode(requestBody),
    // );

    // if (response.statusCode == 201) {
    //   final jsonData = jsonDecode(response.body);
    //   final metadata = jsonData['metadata'];
    //   debugPrint('Berhasil: ${response.statusCode}');
    //   debugPrint('Response: ${response.body}');

    //   if (metadata['status'] == 201) {
    //     final ppdId = jsonData['id'];
    //     debugPrint('Berhasil: ${response.statusCode}');
    //     debugPrint('Response: ${response.body}');

    //     return ppdId;
    //   } else {
    //     debugPrint('Payment failed: ${metadata['message']}');
    //     return null;
    //   }
    // } else {
    //   debugPrint('error: ${response.statusCode}');
    //   return null;
    // }
  }
}
