import 'package:capstone_flutter/models/apis/cek_pin_api.dart';
import 'package:capstone_flutter/utils/const/theme.dart';
import 'package:capstone_flutter/view/v2/tagihan_listrik/tagihan_listrik_success_v2.dart';

import 'package:capstone_flutter/view_model/token_dan_tagihan_listrik/tagihan_listrik_provider.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

class TagihanListrikPinV2View extends StatefulWidget {
  const TagihanListrikPinV2View({super.key});

  @override
  State<TagihanListrikPinV2View> createState() =>
      _TagihanListrikPinV2ViewState();
}

class _TagihanListrikPinV2ViewState extends State<TagihanListrikPinV2View> {
  final TextEditingController otpController = TextEditingController();

  bool isLoading = false;
  @override
  void dispose() {
    otpController.dispose();
    super.dispose();
  }

  void _submitPin() async {
    setState(() {
      isLoading = true;
    });

    await checkPinPayment(null, otpController.text).then((value) async {
      if (value) {
        final listrik = context.read<TagihanListrikProvider>();

        listrik.postPay().then((value) {
          if (value) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const TagihanListrikSuccessV2View()),
            );
          } else {
            setState(() {
              isLoading = false;
            });
          }
        });
      } else {
        setState(() {
          isLoading = false;
        });
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Error'),
              content: const Text('Pin salah.'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      }
    });
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
            onPressed: () async {
              if (isLoading) return;

              _submitPin();
            },
            child: isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Text(
                    'Lanjutkan',
                    style: whiteFont14.copyWith(color: Colors.white),
                  ),
          ),
        ),
      ),
    );
  }
}
