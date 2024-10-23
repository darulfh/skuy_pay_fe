import 'package:capstone_flutter/models/apis/token_listrik/token_listrik_api.dart';
import 'package:capstone_flutter/models/apis/token_listrik/token_listrik_inquiry.dart';
import 'package:capstone_flutter/models/apis/token_listrik/token_listrik_model.dart';
import 'package:capstone_flutter/models/apis/token_listrik/token_listrik_pay.dart';
import 'package:capstone_flutter/utils/const/theme.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class TokenListrikProvider extends ChangeNotifier {
  Status _state = Status.initial;
  Status get state => _state;

  final List<TokenListrikModel> _listTokenListrik = [
    const TokenListrikModel(name: "20.000", price: 21000, code: "hpln20000"),
    const TokenListrikModel(name: "50.000", price: 51000, code: "hpln50000"),
    const TokenListrikModel(name: "100.000", price: 101000, code: "hpln100000"),
    const TokenListrikModel(name: "200.000", price: 201000, code: "hpln200000"),
    const TokenListrikModel(name: "500.000", price: 501000, code: "hpln500000"),
  ];
  List<TokenListrikModel> get listTokenListrik => _listTokenListrik;

  TokenListrikModel? _selectTokenListrik;
  TokenListrikModel? get selectTokenListrik => _selectTokenListrik;

  TokenListrikInquiry? _tokenListrikInquiry;
  TokenListrikInquiry? get tokenListrikInquiry => _tokenListrikInquiry;

  TokenListrikPay? _tokenListrikPay;
  TokenListrikPay? get tokenListrikPay => _tokenListrikPay;

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

  void setSelectTokenListrik(TokenListrikModel? tokenListrik) {
    for (var i = 0; i < _listTokenListrik.length; i++) {
      if (tokenListrik?.code == _listTokenListrik[i].code) {
        _listTokenListrik[i] = _listTokenListrik[i].copyWith(isSelect: true);
      } else {
        _listTokenListrik[i] = _listTokenListrik[i].copyWith(isSelect: false);
      }
    }

    _selectTokenListrik = tokenListrik;
    notifyListeners();
  }

  Future<bool> postInquiry() async {
    try {
      if (_customerId == null) return false;

      changeState(Status.loading);

      final result = await TokenListrikApi.postInquiryTokenListrik(
          customerId: _customerId ?? "");
      _tokenListrikInquiry = result;

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
      if (_selectTokenListrik == null || _customerId == null) return false;

      changeState(Status.loading);

      final result = await TokenListrikApi.postPayTokenListrik(
          customerId: _customerId ?? "",
          productCode: _selectTokenListrik?.code ?? "");

      _tokenListrikPay = result;

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
