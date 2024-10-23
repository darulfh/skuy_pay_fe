import 'package:capstone_flutter/utils/extension/string_extension.dart';
import 'package:capstone_flutter/view/v2/token_listrik/token_listrik_pin_v2.dart';
import 'package:capstone_flutter/view_model/token_dan_tagihan_listrik/token_listrik_provider.dart';

import 'package:capstone_flutter/view_model/user_provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../../../utils/const/theme.dart';

class TokenListrikMethodPaymentV2View extends StatelessWidget {
  const TokenListrikMethodPaymentV2View({super.key});

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
      backgroundColor: Colors.white,
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
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
                      style: blackFont12.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const Icon(Icons.help_outline)
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          const _MethodPayment(),
          const SizedBox(
            height: 20,
          ),
          const _Detail(),
        ],
      ),
      bottomNavigationBar: const _Bottom(),
    );
  }
}

class _MethodPayment extends StatelessWidget {
  const _MethodPayment();

  @override
  Widget build(BuildContext context) {
    final listrik = context.watch<TokenListrikProvider>();
    final user = context.watch<UserProvider>();
    return Container(
      width: MediaQuery.of(context).size.width,
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
                  'Saldo SkuyPay (${user.balance.round().toString().toPrice()})',
                  style: blackFont12.copyWith(fontWeight: FontWeight.w400),
                ),
                const Spacer(),
                Radio(
                  value: 'saldo_skuy_pay',
                  groupValue: listrik.selectedRadio,
                  onChanged: (value) {
                    context.read<TokenListrikProvider>().changeRadio(value);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _Detail extends StatelessWidget {
  const _Detail();

  @override
  Widget build(BuildContext context) {
    final listrik = context.watch<TokenListrikProvider>();
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey),
      ),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 10, top: 15, bottom: 15, right: 10),
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
                  style: blackFont12.copyWith(fontWeight: FontWeight.w400),
                ),
                Text(
                  (listrik.selectTokenListrik?.price
                          .truncate()
                          .toString()
                          .toPrice()) ??
                      "",
                  style: blackFont12.copyWith(fontWeight: FontWeight.w400),
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
                  style: blackFont12.copyWith(fontWeight: FontWeight.w400),
                ),
                Text(
                  '-',
                  style: blackFont12.copyWith(fontWeight: FontWeight.w400),
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
                  style: blackFont12.copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  (listrik.selectTokenListrik?.price
                          .truncate()
                          .toString()
                          .toPrice()) ??
                      "",
                  style: blackFont12.copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _Bottom extends StatelessWidget {
  const _Bottom();

  @override
  Widget build(BuildContext context) {
    final listrik = context.watch<TokenListrikProvider>();
    final user = context.watch<UserProvider>();

    return Padding(
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
            if (listrik.selectedRadio == null) {
              Fluttertoast.showToast(
                msg: "Pilih metode pembayaran",
                textColor: Colors.white,
                backgroundColor: Colors.red,
              );
              return;
            }

            if (user.balance.round() -
                    (listrik.selectTokenListrik?.price ?? 0) <
                0) {
              Fluttertoast.showToast(
                msg: "Saldo Skuypay tidak cukup",
                textColor: Colors.white,
                backgroundColor: Colors.red,
              );
              return;
            }
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const TokenListrikPinV2View()));
          },
          child: Text(
            'Yuk Bayar!',
            style: whiteFont14.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
