// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';

import '../../../models/apis/tagihan_listrik/tagihan_listrik_api.dart';
import '../../../models/tagihan_listrik_model.dart';
import '../../../view/screen/tagihan_listrik_screen/detail_pembayaran_tagihan_screen.dart';

class TagihanListrikInquiryProvider extends ChangeNotifier {
  TagihanListrikInquiryResponse? _response;
  TagihanListrikInquiryResponse? get response => _response;

  void setResponse(TagihanListrikInquiryResponse response) {
    _response = response;
    notifyListeners();
  }

  Future<void> handleTagihanListrikIquiry(
      String customerId,
      String token,
      BuildContext context,
      TextEditingController pelangganControllerTagihanListrik) async {
    final request = TagihanListrikInquiryRequest(
      customerId: customerId,
      // discountId: '48b286df-6bb9-4027-b847-0820015ea68c',
      productId: 'plnpost',
    );

    final response = await TagihanListrikInquiryApi.inquireTagihanListrikBill(
        request, token);

    if (response != null) {
      setResponse(response);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailPembayaranTagihanListrik(
            id: response.id,
            userId: response.userId,
            pelangganData: customerId,
            createdAt: response.createdAt,
            providerName: response.providerName,
            price: response.price,
            adminFee: response.adminFee,
            customerName: response.name,
            elecricalPower: response.electricalPower,
          ),
        ),
      );
    } else {
      showDialog(
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
        context: context,
      );
      pelangganControllerTagihanListrik.clear();
    }
  }
}
