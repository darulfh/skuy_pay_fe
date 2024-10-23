import 'package:capstone_flutter/models/apis/login.dart';
import 'package:capstone_flutter/models/apis/pulsa_paket_data/pulsa_paket_data_api.dart';
import 'package:capstone_flutter/models/pulsa_paket_data.dart';
import 'package:capstone_flutter/utils/const/theme.dart';
import 'package:flutter/material.dart';

class PulsaV2ViewModel with ChangeNotifier {
  Status _state = Status.initial;
  Status get state => _state;

  final List<PulsaPaketdataData> _pulsa = [];
  List<PulsaPaketdataData> get pulsa => _pulsa;

  PulsaPaketdataData? _selectPulsaData;
  PulsaPaketdataData? get selectPulsaData => _selectPulsaData;

  String _phone = "";
  String get phone => _phone;

  String? _selectedRadio;
  String? get selectedRadio => _selectedRadio;

  changeState(Status s) {
    _state = s;
    notifyListeners();
  }

  void changePhone(String phone) {
    _phone = phone;
    notifyListeners();
  }

  void getPulsa() async {
    try {
      changeState(Status.loading);
      final token = await LoginController().getToken();
      final result = await PulsaPaketDataApi(token).getPulsaPaketData(phone);

      _pulsa.clear();

      for (var element in result.data ?? []) {
        if (element.type == "pulsa") {
          _pulsa.add(element);
        }
      }

      changeState(Status.success);
    } catch (e, s) {
      debugPrint("Error: $e, Stack: $s");
      changeState(Status.error);
    }
  }

  void selectPulsa(PulsaPaketdataData data) {
    for (var i = 0; i < _pulsa.length; i++) {
      if (_pulsa[i].id == data.id) {
        _pulsa[i].isSelected = true;
        _selectPulsaData = _pulsa[i];
      } else {
        _pulsa[i].isSelected = false;
      }
    }
    notifyListeners();
  }

  void changeRadio(String? value) {
    _selectedRadio = value;
    notifyListeners();
  }
}
