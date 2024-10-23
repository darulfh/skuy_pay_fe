import 'package:capstone_flutter/utils/const/theme.dart';
import 'package:capstone_flutter/view/screen/transfer_screen/ilustration_sukses_transfer.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class PinTransferScreen extends StatefulWidget {
  const PinTransferScreen({super.key});

  @override
  State<PinTransferScreen> createState() => _PinTransferScreenState();
}

class _PinTransferScreenState extends State<PinTransferScreen> {
  final TextEditingController otpController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

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
        title: Text(
          'Kode PIN',
          style: blackFont18.copyWith(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 12,
            ),
            Text(
              'Masukkan kode PIN kamu!',
              style: blackFont14,
            ),
            const SizedBox(height: 55),
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
                setState(() {
                  if (value.isEmpty) {
                    otpController.text = '-';
                  }
                });
              },
            ),
            const SizedBox(
              height: 26,
            ),
            Text(
              'Lupa kode PIN?',
              style: blueFont12,
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
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const IlustrationSuksesTransfer(),
                ),
              );
            },
            child: Text(
              'Lanjutkan',
              style: whiteFont14,
            ),
          ),
        ),
      ),
    );
  }
}
