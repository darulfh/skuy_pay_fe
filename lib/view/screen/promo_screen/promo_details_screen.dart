import 'package:flutter/material.dart';

import '../../../utils/const/theme.dart';

class PromoDetails extends StatefulWidget {
  const PromoDetails({super.key});

  @override
  State<PromoDetails> createState() => _PromoDetailsState();
}

class _PromoDetailsState extends State<PromoDetails> {
  @override
  Widget build(BuildContext context) {
        double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        title: Text(
          'Diskon 50% BPJS',
          style: blackFont20.copyWith(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Center(
                child: GestureDetector(
                  onTap: () {},
                  child: const Image(
                    image: AssetImage('assets/bpjs_discount.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 25, left: 17),
                  child: RichText(
                    text: TextSpan(
                      style: blackFont14.copyWith(color: Colors.black),
                      children: [
                        TextSpan(
                          text:
                              'Diskon 50% Pembayaran BPJS Spesial Untukmu !\n',
                          style: blackFont16G.copyWith(color: Colors.black),
                        ),
                        WidgetSpan(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 20),
                              Text(
                                'Ada promo menarik nih buat kamu melakukan pembayaran',
                                style:
                                    blackFont14.copyWith(color: Colors.black),
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Text(
                                'BPJS  di SkuyPay dengan harga yang lebih terjangkau dan',
                                style:
                                    blackFont14.copyWith(color: Colors.black),
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Text(
                                'spesial untuk Kakak dapatkan cashback 50%.',
                                style:
                                    blackFont14.copyWith(color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 35, left: 17),
                  child: RichText(
                    text: TextSpan(
                      style: blackFont14.copyWith(color: Colors.black),
                      children: [
                        TextSpan(
                          text: 'Begini cara untuk ikutan promonya :\n',
                          style: blackFont14.copyWith(color: Colors.black),
                        ),
                        WidgetSpan(
                          child: Container(
                            margin: const EdgeInsets.only(top: 20),
                            child: const Text('1. Gunakan Kupon '),
                          ),
                        ),
                        const TextSpan(
                          text: 'PROMOINGAZI',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const TextSpan(
                          text: ' untuk mendapatkan\n',
                        ),
                        WidgetSpan(
                          child: Container(
                            margin: const EdgeInsets.only(top: 18, left: 15),
                          ),
                        ),
                        const TextSpan(
                          text:
                              'Promo ini tidak dapat digabung dengan promo lainnya.\n',
                        ),
                        WidgetSpan(
                          child: Container(
                            margin: const EdgeInsets.only(top: 3),
                            child: const Text('2. Periode promo '),
                          ),
                        ),
                        const TextSpan(
                          text: '13 Mei hingga 23 Mei 2023.\n',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        WidgetSpan(
                          child: Container(
                            margin: const EdgeInsets.only(top: 18),
                          ),
                        ),
                        const TextSpan(
                          text:
                              '3. Promo ini tidak dapat digabung dengan promo lainnya.\n',
                        ),
                        WidgetSpan(
                          child: Container(
                            margin: const EdgeInsets.only(top: 18),
                          ),
                        ),
                        const TextSpan(
                          text:
                              '4. Promo ini hanya berlaku untuk semua pengguna.\n',
                        ),
                        WidgetSpan(
                          child: Container(
                            margin: const EdgeInsets.only(top: 3),
                            child: const Text('2. Batas klaim Diskon terakhir adalah tanggal '),
                          ),
                        ),
                        const TextSpan(
                          text: '30 Mei 2023.\n',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            Container(
              margin: EdgeInsets.only(
                  top: height * 0.18, left: 16, right: 16, bottom: 40),
              width: double.infinity,
              child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 19),
                backgroundColor: blueColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {},
              child: Text(
                'Yuk! Klaim',
                style: whiteFont16,
              ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
