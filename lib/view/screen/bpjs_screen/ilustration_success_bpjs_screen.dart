import 'package:capstone_flutter/view/screen/bpjs_screen/success_transaction_bpjs_screen.dart';
import 'package:flutter/material.dart';

import '../../../utils/const/theme.dart';

class IlustrationSuccessBpjs extends StatefulWidget {
  const IlustrationSuccessBpjs({super.key});

  @override
  State<IlustrationSuccessBpjs> createState() => _IlustrationSuccessBpjsState();
}

class _IlustrationSuccessBpjsState extends State<IlustrationSuccessBpjs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                top: 200, bottom: 10, left: 66, right: 66),
            child: Image.asset(
              'assets/cihuy_selamat.png',
            ),
          ),
          Text(
            'Cihuyy ! Selamat',
            style: blackText24,
          ),
          const SizedBox(height: 15),
          Text(
            'Transaksi kamu berhasil',
            style: blackFontt16,
          ),
        ],
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
                      builder: (context) => const SuccessTransactionBpjs()));
            },
            child: Text(
              'Cek Transaksi',
              style: whiteFont14.copyWith(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
