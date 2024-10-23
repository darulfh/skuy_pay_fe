import 'package:capstone_flutter/models/apis/login.dart';
import 'package:capstone_flutter/models/apis/pulsa_paket_data/pulsa_paket_data_api.dart';
import 'package:capstone_flutter/models/pulsa_paket_data.dart';
import 'package:capstone_flutter/utils/const/theme.dart';
import 'package:flutter/material.dart';

class PaketDataV2ViewModel with ChangeNotifier {
  Status _state = Status.initial;
  Status get state => _state;

  final List<PulsaPaketdataData> _paketData = [];
  List<PulsaPaketdataData> get paketData => _paketData;

  PulsaPaketdataData? _selectPaketData;
  PulsaPaketdataData? get selectPaketData => _selectPaketData;

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

  void getPaketData() async {
    try {
      changeState(Status.loading);
      final token = await LoginController().getToken();
      final result = await PulsaPaketDataApi(token).getPulsaPaketData(phone);

      _paketData.clear();

      for (var element in result.data ?? []) {
        if (element.type == "paket_data") {
          _paketData.add(element);
        }
      }

      changeState(Status.success);
    } catch (e, s) {
      debugPrint("Error: $e, Stack: $s");
      changeState(Status.error);
    }
  }

  void changeRadio(String? value) {
    _selectedRadio = value;
    notifyListeners();
  }

  void selectPaketDataId(PulsaPaketdataData data) {
    for (var i = 0; i < _paketData.length; i++) {
      if (_paketData[i].id == data.id) {
        _paketData[i].isSelected = true;
        _selectPaketData = _paketData[i];
      } else {
        _paketData[i].isSelected = false;
      }
    }
    notifyListeners();
  }
}
