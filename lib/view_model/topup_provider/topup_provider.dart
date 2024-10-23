import 'package:capstone_flutter/models/apis/top_up.dart';
import 'package:capstone_flutter/utils/const/urls.dart';
import 'package:flutter/material.dart';
import '../../models/apis/login.dart';
import '../../models/topup_models.dart';

//
class TopUpProvider extends ChangeNotifier {
  static const String baseUrl = '${Urls.baseUrl}/amount';

  String? vaNumber;
  String? usernameDisplay;
  bool isLoading = false;

  TopUpR? _topUp;
  TopUpR? get topUp => _topUp;

  Future<void> createVirtualAccount(String? bankCode) async {
    try {
      isLoading = true;
      notifyListeners();
      final token = await LoginController().getToken();

      final result =
          await TopUpApi.createVirtualAccount(bankCode ?? "002", token);
      _topUp = result;
      notifyListeners();
    } catch (error) {
      // ignore: avoid_print
      print(error);
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
