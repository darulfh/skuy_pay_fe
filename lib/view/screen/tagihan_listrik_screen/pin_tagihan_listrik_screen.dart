// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/apis/cek_pin.dart';
import '../../../models/apis/tagihan_listrik/pay_token_tagihan_listrik.dart';
import '../../../utils/const/theme.dart';
import '../../../view_model/user_provider/user_provider.dart';
import 'ilustration_sukses_tagihan_screen.dart';

class PinTagihanListrikScreen extends StatefulWidget {
  final String id;
  final String userId;
  final String pelangganData;
  final DateTime createdAt;
  final String providerName;
  final double price;
  final double adminFee;
  final String customerName;
  final int elecricalPower;
  final double balanceNow;

  const PinTagihanListrikScreen({
    super.key,
    required this.id,
    required this.userId,
    required this.pelangganData,
    required this.createdAt,
    required this.providerName,
    required this.price,
    required this.adminFee,
    required this.customerName,
    required this.elecricalPower,
    required this.balanceNow,
  });

  @override
  State<PinTagihanListrikScreen> createState() =>
      _PinTagihanListrikScreenState();
}

class _PinTagihanListrikScreenState extends State<PinTagihanListrikScreen> {
  final TextEditingController otpController = TextEditingController();

  @override
  void initState() {
    super.initState();
    initializeData();
  }

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
      // ignore: avoid_print
      print(token);
    });
  }

  void _submitPin(String pin) async {
    try {
      final bool isPinCorrect = await checkPinPayment(token, pin);
      String idx = widget.id;
      if (isPinCorrect && idx.isNotEmpty) {
        final PayTokenTagihanListrik paytagihanListrik =
            PayTokenTagihanListrik(idx, token);
        // ignore: avoid_print
        print('adalah: $idx');
        final String? paytagihanListrikResponse =
            await paytagihanListrik.payTokenTagihanListrik();
        // ignore: avoid_print
        print(paytagihanListrikResponse);

        // Memperbarui nilai balance pada UserProvider

        final userProvider = Provider.of<UserProvider>(context, listen: false);
        final newBalance = widget.balanceNow
            .toDouble(); // Ganti dengan nilai balance yang baru
        userProvider.updateUserInfo(
            userProvider.name, userProvider.phone, newBalance);

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => IlustrationSuksesTagihanScreen(
              id: widget.id,
              userId: widget.userId,
              pelangganData: widget.pelangganData,
              createdAt: widget.createdAt,
              providerName: widget.providerName,
              price: widget.price,
              adminFee: widget.adminFee,
              customerName: widget.customerName,
              elecricalPower: widget.elecricalPower,
            ),
          ),
        );
      } else {
        // Handle incorrect pin scenario

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
    } catch (error) {
      // ignore: avoid_print
      print('Error: $error');
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text('Upss sepertinya ada yang salah.'),
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
            onPressed: () async {
              final pin = otpController.text;
              _submitPin(pin);
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
