// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';

import '../../models/apis/wifi.dart';
import '../../models/wifi_model.dart';
import '../../view/screen/wifi_screen/payment_detail_screen.dart';

class WiFiInquiryProvider extends ChangeNotifier {
  WiFiInquiryResponse? _response;

  WiFiInquiryResponse? get response => _response;

  void setResponse(WiFiInquiryResponse response) {
    _response = response;
    notifyListeners();
  }

  Future<void> handleInquiry(
      String customerId,
      String token,
      BuildContext context,
      TextEditingController pelangganControllerWifi) async {
    final request = WiFiInquiryRequest(
      customerId: customerId,
      // discountId: '48b286df-6bb9-4027-b847-0820015ea68c',
      productId: 'TELKOM',
    );

    final response = await WifiInquiryApi.inquireWiFiBill(request, token);

    if (response != null) {
      setResponse(response);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PaymentDetailWifi(
            id: response.id,
            userId: response.userId,
            pelangganData: customerId,
            createdAt: response.createdAt,
            providerName: response.providerName,
            price: response.price.toDouble(),
            adminFee: response.adminFee.toDouble(),
            customerName: response.name,
          ),
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text('Nomor pelanggan salah.'),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
      pelangganControllerWifi.clear();
    }
  }
}
