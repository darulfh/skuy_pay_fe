import 'package:capstone_flutter/models/apis/user_api.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/apis/login.dart';

class UserProvider with ChangeNotifier {
  String _name = '';
  String get name => _name;

  String _phone = '';
  String get phone => _phone;
  double _balance = 0;
  double get balance => _balance;

  String _image = '';
  String get image => _image;

  // User? _user;
  // User? get user => _user;

  UserProvider() {
    //ntuk mengambil nilai dari SharedPreferences saat inisialisasi
    // getSavedUserInfo();
  }

  void getUserProfile() async {
    try {
      final token = await LoginController().getToken();
      final result = await UserApiController().getUserProfile(token);

      if (result != null) {
        // _name = result.name;
        // _phone = result.phone;
        // _balance = result.balance;
        // _image = result.image;

        updateUserInfo(result.name, result.phone, result.balance,
            image: result.image, email: result.email);
      }

      notifyListeners();
    } catch (e, s) {
      debugPrint("getUserProfile Error: $e;\nStackRace: $s");
    }
  }

  // Future<void> getSavedUserInfo() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   _name = prefs.getString('name') ?? '';
  //   _phone = prefs.getString('phone') ?? '';
  //   _balance = prefs.getDouble('balance') ?? 0;
  //   notifyListeners();
  // }

  void updateUserInfo(String newName, String newPhone, double newBalance,
      {String? image, String? email}) async {
    _name = newName;
    _phone = newPhone;
    _balance = newBalance;
    if (image != null) {
      _image = image;
    }

    // Simpan nilai ke SharedPreferences setelah diperbarui
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', name);
    await prefs.setString('phone', phone);
    await prefs.setDouble('balance', balance);
    if (image != null) {
      await prefs.setString('image', image);
    }

    if (email != null) {
      await prefs.setString('email', email);
    }

    notifyListeners();
  }
}
