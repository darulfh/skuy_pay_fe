import 'package:capstone_flutter/view/screen/pin_screen/reinput_pin_screen.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../../../utils/const/theme.dart';

class InputPinScreen extends StatefulWidget {
  const InputPinScreen({super.key});

  @override
  State<InputPinScreen> createState() => _InputPinScreenState();
}

class _InputPinScreenState extends State<InputPinScreen> {
  final TextEditingController otpController = TextEditingController();

  @override
  void dispose() {
    otpController.dispose();
    super.dispose();
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
        title: Text(
          'Kode PIN',
          style: blackFontAppbar18,
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
              onChanged: (String value) {
                if (value.isEmpty) {
                  otpController.text = '';
                }
              },
            ),
            const SizedBox(
              height: 20,
            ),
            // Text(
            //   'Lupa kode PIN?',
            //   style: blueFont12,
            // ),
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
            onPressed: () {
              String pin = otpController.text;
              // ignore: avoid_print
              print(pin);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ReinputPinScreen(pinFromInputScreen: pin)));
            },
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
