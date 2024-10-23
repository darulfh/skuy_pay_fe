import 'package:flutter/material.dart';

import '../../models/apis/login.dart';
import '../../models/apis/update_user_data.dart';

enum ImageState { none, loading, result, error }

class UserUpdateImageProvider with ChangeNotifier {
  ImageState _state = ImageState.none;
  ImageState get state => _state;

  String _image = '';
  String get image => _image;

  Future<void> updateImage(String image) async {
    try {
      _state = ImageState.loading;
      notifyListeners();
      final token = await LoginController().getToken();
      final result = await UpdateUserController(token).updateUserImage(image);

      if (result != "") {
        debugPrint("result updateImage: $result");
        _state = ImageState.result;
        _image = result;
      } else {
        _state = ImageState.error;
      }
      notifyListeners();
    } catch (e) {
      _state = ImageState.error;
      notifyListeners();
    }
  }
}
