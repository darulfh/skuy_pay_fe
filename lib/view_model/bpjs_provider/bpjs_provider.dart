// ignore_for_file: empty_catches

import 'package:capstone_flutter/models/apis/bpjs/bpjs_api.dart';
import 'package:capstone_flutter/models/apis/bpjs/bpjs_model.dart';
import 'package:capstone_flutter/utils/const/theme.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BpjsProvider extends ChangeNotifier {
  Status _state = Status.initial;
  Status get state => _state;

  BpjsModel? _bjps;
  BpjsModel? get bpjs => _bjps;

  String? _selectedRadio;
  String? get selectedRadio => _selectedRadio;

  changeState(Status s) {
    _state = s;
    notifyListeners();
  }

  Future<bool> postInquiry({required String id, required int month}) async {
    try {
      changeState(Status.loading);

      final result = await BpjsApi.postInquiryBpjs(id: id, month: month);

      _bjps = result;

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

  Future<bool> postPay({required String refId}) async {
    try {
      changeState(Status.loading);

      final result = await BpjsApi.postPayBpjs(refId: refId);

      _bjps = result;

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
