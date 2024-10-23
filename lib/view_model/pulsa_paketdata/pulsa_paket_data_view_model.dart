import 'package:capstone_flutter/models/apis/login.dart';
import 'package:capstone_flutter/models/apis/pulsa_paket_data/pulsa_paket_data_api.dart';
import 'package:capstone_flutter/models/pulsa_paket_data.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

enum PulsaPaketdataViewState {
  none,
  result,
  loading,
  error,
}

class PulsaDanPaketDataViewModel with ChangeNotifier {
  PulsaPaketdataViewState _state = PulsaPaketdataViewState.none;
  PulsaPaketdataViewState get state => _state;

  List<PulsaPaketdataData> _pulsa = [];
  List<PulsaPaketdataData> get pulsa => _pulsa;

  List<PulsaPaketdataData> _paketData = [];
  List<PulsaPaketdataData> get paketData => _paketData;

  PulsaPaketdataData? _selectPaketData;
  PulsaPaketdataData? get selectPaketData => _selectPaketData;

  PulsaPaketdataData? _selectPulsaData;
  PulsaPaketdataData? get selectPulsaData => _selectPulsaData;

  changeState(PulsaPaketdataViewState s) {
    _state = s;
    notifyListeners();
  }

  void getPhone(String phone) async {
    changeState(PulsaPaketdataViewState.loading);
    try {
      final token = await LoginController().getToken();

      final result = await PulsaPaketDataApi(token).getPulsaPaketData(phone);
      debugPrint("Pulsa Paket Data Response: ${result.toJson().toString()}");

      _pulsa = [];
      _paketData = [];
      for (PulsaPaketdataData element in result.data ?? []) {
        if (element.type == "pulsa") {
          _pulsa.add(element);
        } else {
          _paketData.add(element);
        }
      }

      if (_pulsa.isNotEmpty || _paketData.isNotEmpty) {
        changeState(PulsaPaketdataViewState.result);
      } else {
        changeState(PulsaPaketdataViewState.none);
      }
      notifyListeners();
    } on DioException catch (e) {
      debugPrint("asdasd error1: ${e.toString()}");
      changeState(PulsaPaketdataViewState.error);
    } catch (e) {
      debugPrint("asdasd error2: ${e.toString()}");
      changeState(PulsaPaketdataViewState.error);
    }
  }

  void selectPpd(String id, bool isPaketData) {
    if (isPaketData) {
      for (var i = 0; i < _paketData.length; i++) {
        if (_paketData[i].id == id) {
          _paketData[i].isSelected = true;
          _selectPaketData = _paketData[i];
        } else {
          _paketData[i].isSelected = false;
        }
      }
      notifyListeners();
    } else {
      for (var i = 0; i < _pulsa.length; i++) {
        if (_pulsa[i].id == id) {
          _pulsa[i].isSelected = true;
          _selectPulsaData = _pulsa[i];
        } else {
          _pulsa[i].isSelected = false;
        }
      }
      notifyListeners();
    }
  }

  void chagePhoneNumber(String phone, bool isPaketData) {
    if (isPaketData) {
      _selectPaketData = _selectPaketData?.copyWith(phone62: phone);
    } else {
      _selectPulsaData = _selectPulsaData?.copyWith(phone62: phone);
    }
    notifyListeners();
  }

  // void refreshPulsaPaketData() {
  //   _state = PulsaPaketdataViewState.none;
  //   _pulsa = [];
  //   _paketData = [];
  //   _selectPaketData = null;
  //   _selectPulsaData = null;
  //   notifyListeners();
  // }
}
