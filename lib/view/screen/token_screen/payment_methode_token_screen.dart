import 'package:capstone_flutter/view/screen/token_screen/pin_token_screen.dart';
import 'package:flutter/material.dart';

import '../../../utils/const/theme.dart';

class PaymentMethodToken extends StatefulWidget {
  const PaymentMethodToken({super.key});

  @override
  State<PaymentMethodToken> createState() => _PaymentMethodTokenState();
}

class _PaymentMethodTokenState extends State<PaymentMethodToken> {
  String? selectedRadio;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Metode Pembayaran',
          style: blackFont18.copyWith(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Text(
              'Dari PT SOLUSINDO JAYA',
              style: blackFont12.copyWith(fontWeight: FontWeight.w700),
            ),
            Text(
              'Tagihan Listrik 0000 2984 0368',
              style: blackFont12.copyWith(fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.amber[100],
              ),
              width: MediaQuery.of(context).size.width,
              height: 52,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Konfirmasi Pembayaran Anda',
                        style:
                            blackFont12.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const Icon(Icons.help_outline)
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 85,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10, top: 15, bottom: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Pembayaran',
                      style: blackFont12.copyWith(fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(Icons.wallet),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Saldo SkuyPay (Rp 150.000)',
                          style:
                              blackFont12.copyWith(fontWeight: FontWeight.w400),
                        ),
                        const Spacer(),
                        Radio(
                          value: 'saldo_skuy_pay',
                          groupValue: selectedRadio,
                          onChanged: (value) {
                            setState(() {
                              selectedRadio = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 10, top: 15, bottom: 15, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Biaya Detail',
                      style: blackFont12.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Jumlah',
                          style:
                              blackFont12.copyWith(fontWeight: FontWeight.w400),
                        ),
                        Text(
                          'Rp 22.500',
                          style:
                              blackFont12.copyWith(fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Promo',
                          style:
                              blackFont12.copyWith(fontWeight: FontWeight.w400),
                        ),
                        Text(
                          '-',
                          style:
                              blackFont12.copyWith(fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total',
                          style:
                              blackFont12.copyWith(fontWeight: FontWeight.w400),
                        ),
                        Text(
                          'Rp 22.500',
                          style:
                              blackFont12.copyWith(fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
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
                      builder: (context) => const PinScreenToken()));
            },
            child: Text(
              'Yuk Bayar!',
              style: whiteFont14,
            ),
          ),
        ),
      ),
    );
  }
}
