import 'package:flutter/material.dart';

class PinProvider extends ChangeNotifier {
  bool _ispinAdded = false;
  bool get ispinAdded => _ispinAdded;

  void changePin(bool pin) {
    // ignore: avoid_print
    print('changePin0 _ispinAdded: $_ispinAdded');
    // ignore: avoid_print
    print('changePin0 pin: $pin');
    _ispinAdded = pin;

    // ignore: avoid_print
    print('changePin1 _ispinAdded: $_ispinAdded');
    // ignore: avoid_print
    print('changePin1 pin: $pin');
    notifyListeners();
  }

  void changePinTrue() {
    _ispinAdded = true;
    notifyListeners();
  }
}
