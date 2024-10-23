import 'package:capstone_flutter/utils/const/theme.dart';
import 'package:capstone_flutter/view/screen/home_screen/home_screen.dart';
import 'package:capstone_flutter/view/v2/tagihan_listrik/tagihan_listrik_detail_v2.dart';
import 'package:capstone_flutter/view_model/token_dan_tagihan_listrik/tagihan_listrik_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class TagihanListrikSuccessV2View extends StatelessWidget {
  const TagihanListrikSuccessV2View({super.key});

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
                      builder: (context) =>
                          _TagihanListrikDetailSuccess(DateTime.now())));
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

class _TagihanListrikDetailSuccess extends StatelessWidget {
  final DateTime dateTime;
  const _TagihanListrikDetailSuccess(this.dateTime);

  @override
  Widget build(BuildContext context) {
    final listrik = context.watch<TagihanListrikProvider>();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              const Icon(
                Icons.check_circle,
                color: Color(0xff76BB63),
                size: 80,
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                'Transaksi Kamu Berhasil',
                style: blackFont18,
              ),
              const SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      DateFormat('dd MMMM yyyy. HH:mm').format(dateTime),
                      style: blackFont12.copyWith(fontSize: 10),
                    ),
                    Text(
                      'SkuyPay ${listrik.customerId ?? ""}',
                      // 'SkuyPay 0857xxxx2345',
                      style: blackFont12,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const TagihanListrikDetailCard(
                isSuccess: true,
              ),
            ],
          ),
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
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const NavBar(initialIndex: 0),
                ),
              );
            },
            child: Text(
              'Selesai',
              style: whiteFont14.copyWith(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
