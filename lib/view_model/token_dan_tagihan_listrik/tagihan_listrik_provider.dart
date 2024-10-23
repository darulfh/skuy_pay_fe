import 'package:capstone_flutter/models/apis/tagihan_listrik_v2/tagihan_listrik_api_v2.dart';
import 'package:capstone_flutter/models/apis/tagihan_listrik_v2/tagihan_listrik_inquiry.dart';
import 'package:capstone_flutter/utils/const/theme.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class TagihanListrikProvider extends ChangeNotifier {
  Status _state = Status.initial;
  Status get state => _state;

  TagihanListrikInquiry? _tagihanListrikInquiry;
  TagihanListrikInquiry? get tagihanListrikInquiry => _tagihanListrikInquiry;

  String? _customerId;
  String? get customerId => _customerId;

  String? _selectedRadio;
  String? get selectedRadio => _selectedRadio;

  changeState(Status s) {
    _state = s;
    notifyListeners();
  }

  void setCustomerId(String? customerId) {
    _customerId = customerId;
    notifyListeners();
  }

  Future<bool> postInquiry() async {
    try {
      if (_customerId == null) return false;
      changeState(Status.loading);

      final result = await TagihanListrikApiV2.postInquiryTagihanListrik(
          customerId: _customerId ?? "");
      _tagihanListrikInquiry = result;

      changeState(Status.success);

      return true;
    } on DioException catch (e, s) {
      debugPrint(
        "postInquiry Error: ${e.response?.data["error"] ?? ""}\nStackRce: $s",
      );
      Fluttertoast.showToast(
        msg: e.response?.data["error"] ?? "",
        textColor: Colors.white,
        backgroundColor: Colors.red,
      );
      changeState(Status.error);
      return false;
    } catch (e, s) {
      debugPrint(
        "postInquiry Error: ${e.toString()}\nStackRce: $s",
      );
      Fluttertoast.showToast(
        msg: e.toString(),
        textColor: Colors.white,
        backgroundColor: Colors.red,
      );
      changeState(Status.error);
      return false;
    }
  }

  Future<bool> postPay() async {
    try {
      if (_customerId == null) return false;

      changeState(Status.loading);

      final result = await TagihanListrikApiV2.postPayTagihanListrik(
          refId: _tagihanListrikInquiry?.refId ?? "");

      _tagihanListrikInquiry = result;

      changeState(Status.success);
      return true;
    } on DioException catch (e, s) {
      debugPrint(
        "postPay Error: ${e.response?.data["error"] ?? ""}\nStackRce: $s",
      );
      Fluttertoast.showToast(
        msg: e.response?.data["error"] ?? "",
        textColor: Colors.white,
        backgroundColor: Colors.red,
      );
      changeState(Status.error);
      return false;
    } catch (e, s) {
      debugPrint(
        "postPay Error: ${e.toString()}\nStackRce: $s",
      );
      Fluttertoast.showToast(
        msg: e.toString(),
        textColor: Colors.white,
        backgroundColor: Colors.red,
      );
      changeState(Status.error);
      return false;
    }
  }

  void changeRadio(String? value) {
    _selectedRadio = value;
    notifyListeners();
  }
}
