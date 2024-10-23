import 'package:capstone_flutter/utils/const/theme.dart';
import 'package:capstone_flutter/utils/extension/string_extension.dart';

import 'package:capstone_flutter/view/v2/token_listrik/token_listrik_method_payment_v2.dart';
import 'package:capstone_flutter/view_model/token_dan_tagihan_listrik/token_listrik_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TokenListrikDetailV2View extends StatefulWidget {
  const TokenListrikDetailV2View({super.key});

  @override
  State<TokenListrikDetailV2View> createState() =>
      _TokenListrikDetailV2ViewState();
}

class _TokenListrikDetailV2ViewState extends State<TokenListrikDetailV2View> {
  TextEditingController promoController = TextEditingController();

  @override
  void dispose() {
    promoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Rincian Pembayaran',
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
          Text(
            'Kode Promo',
            style: blackFont12.copyWith(fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 5),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.51,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintStyle: blackFont12.copyWith(color: Colors.grey),
                      hintText: 'CONTOH: PROMOINGAZI',
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              SizedBox(
                width: 80,
                height: 52,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: blueColor,
                    padding: const EdgeInsets.all(0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Klaim',
                    style: whiteFont14.copyWith(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.amber[100],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                    Icons.warning_amber_outlined,
                    size: 15,
                    color: Colors.amber,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Silahkan masukkan kode promo yang kamu punya',
                    style: blackFont12.copyWith(
                        fontWeight: FontWeight.w400, fontSize: 10),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const TokenListrikDetailCard(),
        ],
      ),
      bottomNavigationBar: Padding(
        padding:
            const EdgeInsets.only(bottom: 30, left: 24, right: 24, top: 10),
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
                      builder: (context) =>
                          const TokenListrikMethodPaymentV2View()));
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

class TokenListrikDetailCard extends StatelessWidget {
  final bool isSuccess;
  const TokenListrikDetailCard({super.key, this.isSuccess = false});

  @override
  Widget build(BuildContext context) {
    final listrik = context.watch<TokenListrikProvider>();
    if (listrik.tokenListrikInquiry == null) {
      return const Text("Something wen't wrong");
    }
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!isSuccess) ...[
            Text(
              'DETAIL PEMBAYARAN',
              style: blackFont12.copyWith(fontWeight: FontWeight.w700),
            ),
            const Divider(
              color: Colors.grey,
            ),
          ],
          _Tag(
            title: 'No. Pelanggan',
            value: listrik.tokenListrikInquiry!.customerId,
          ),
          _Tag(
            title: 'Nama Pelanggan',
            value: listrik.tokenListrikInquiry!.name,
          ),
          _Tag(
              title: 'Power', value: listrik.tokenListrikInquiry!.segmentPower),
          _Tag(title: 'No Meter', value: listrik.tokenListrikInquiry!.meterNo),
          _Tag(
            title: 'Harga',
            value: listrik.selectTokenListrik?.price
                    .truncate()
                    .toString()
                    .toPrice() ??
                "",
          ),
          const Divider(
            color: Colors.grey,
          ),
          Container(
            margin: const EdgeInsets.only(top: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.green[100],
            ),
            width: MediaQuery.of(context).size.width,
            height: 40,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      'Total tagihan',
                      style: blackFont12.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      (listrik.selectTokenListrik?.price.truncate())
                          .toString()
                          .toPrice(),
                      style: blackFont12.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Tag extends StatelessWidget {
  final String title;
  final String value;
  const _Tag({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: blackFont12.copyWith(fontWeight: FontWeight.w400),
          ),
          Text(
            value,
            style: blackFont12.copyWith(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
