// ignore_for_file: use_build_context_synchronously

import 'package:capstone_flutter/view/screen/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/apis/create_pin.dart';
import '../../../utils/const/theme.dart';
import '../../../view_model/pin_provider/pin_provider.dart';

class ReinputPinScreen extends StatefulWidget {
  final String pinFromInputScreen;

  const ReinputPinScreen({super.key, required this.pinFromInputScreen});

  @override
  State<ReinputPinScreen> createState() => _ReinputPinScreenState();
}

class _ReinputPinScreenState extends State<ReinputPinScreen> {
  final TextEditingController otpController = TextEditingController();
  late PinController _pinController;

  @override
  void dispose() {
    otpController.dispose();
    super.dispose();
  }

  late SharedPreferences _prefs;
  String token = '';

  Future<void> initializeData() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      token = _prefs.getString('token') ?? '';
      _pinController = PinController(token);
      // ignore: avoid_print
      print(token);
    });
  }

  @override
  void initState() {
    super.initState();
    initializeData();
  }

  Future<void> _createPin() async {
    final String pin = otpController.text;
    final String originalPin = widget.pinFromInputScreen;
    // ignore: avoid_print
    print(pin);
    // ignore: avoid_print
    print(originalPin);

    if (pin != originalPin) {
      otpController.clear();
      // Gagal membuat pin
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error'),
          content: const Text('Pin tidak sesuai. Silakan coba lagi.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    } else if (pin == originalPin) {
      final bool success = await _pinController.createPin(pin);
      if (success && context.mounted) {
        // Provider.of<AppManajer>(context, listen: false).changePin(true);
        context.read<PinProvider>().changePinTrue();
        // Pin berhasil dibuat
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const NavBar(
                    initialIndex: 0,
                  )),
        );
      } else {}
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: GestureDetector(
          onTap: () {
            context.read<PinProvider>().changePin(true);
          },
          child: Text(
            'Kode PIN',
            style: blackFontAppbar18,
          ),
        ),
        elevation: 0,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 42,
            ),
            const SizedBox(height: 70),
            Pinput(
              controller: otpController,
              length: 5,
              showCursor: true,
              defaultPinTheme: PinTheme(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Colors.black,
                    width: 1,
                  ),
                ),
                textStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 30, left: 24, right: 24),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 52,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: blueColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: _createPin,
            child: Text(
              'Lanjutkan',
              style: whiteFont14.copyWith(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
