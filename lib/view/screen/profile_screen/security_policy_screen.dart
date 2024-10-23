import 'package:flutter/material.dart';

import '../../../utils/const/theme.dart';

class SecurityPolicyScreen extends StatelessWidget {
  const SecurityPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Kebijakan Keamanan',
          style: blackFont18.copyWith(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 24, right: 24, top: 50, bottom: 20),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      'Kebijakan Keamanan Akun Pengguna SkuyPay',
                      style: blackFont16.copyWith(color: blueColor),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      '(Berlaku Sejak 3 Mei 2023)',
                      style: blackFont16.copyWith(fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      textAlign: TextAlign.justify,
                      'Kami mengutamakan keamanan Anda saat menggunakan aplikasi SkuyPay. Berikut adalah kebijakan keamanan yang kami terapkan untuk melindungi informasi Anda:',
                      style: blackFont16.copyWith(fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '1. ',
                              style: blackFont16.copyWith(
                                  fontWeight: FontWeight.w400),
                            ),
                            Expanded(
                              child: Text(
                                textAlign: TextAlign.justify,
                                'Privasi dan Kerahasiaan\nKami menjaga privasi dan kerahasiaan informasi pribadi yang Anda berikan. Data yang dikumpulkan hanya digunakan untuk keperluan transaksi dan tidak akan dibagikan kepada pihak ketiga tanpa izin Anda, kecuali jika diwajibkan oleh hukum.',
                                style: blackFont16.copyWith(
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '2. ',
                              style: blackFont16.copyWith(
                                  fontWeight: FontWeight.w400),
                            ),
                            Expanded(
                              child: Text(
                                textAlign: TextAlign.justify,
                                'Enkripsi Data\nData yang Anda berikan saat melakukan transaksi di aplikasi SkuyPay akan dienkripsi menggunakan teknologi yang aman. Hal ini memastikan bahwa informasi sensitif, seperti nomor kartu kredit atau informasi pribadi lainnya, tidak dapat diakses oleh pihak yang tidak berwenang.',
                                style: blackFont16.copyWith(
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '3. ',
                              style: blackFont16.copyWith(
                                  fontWeight: FontWeight.w400),
                            ),
                            Expanded(
                              child: Text(
                                textAlign: TextAlign.justify,
                                'Keamanan Akun\nKami mendorong Anda untuk menggunakan kata sandi yang kuat dan unik untuk akun Anda. Selain itu, kami juga menerapkan tindakan keamanan tambahan, seperti verifikasi dua faktor, untuk melindungi akun Anda dari akses yang tidak sah.',
                                style: blackFont16.copyWith(
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '4. ',
                              style: blackFont16.copyWith(
                                  fontWeight: FontWeight.w400),
                            ),
                            Expanded(
                              child: Text(
                                textAlign: TextAlign.justify,
                                'Monitoring Aktivitas\nKami secara teratur memantau aktivitas di aplikasi PPOB untuk mendeteksi dan mencegah aktivitas yang mencurigakan atau penyalahgunaan. Jika ada aktivitas yang mencurigakan terdeteksi, kami akan mengambil tindakan yang diperlukan untuk melindungi keamanan akun Anda.',
                                style: blackFont16.copyWith(
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '5. ',
                              style: blackFont16.copyWith(
                                  fontWeight: FontWeight.w400),
                            ),
                            Expanded(
                              child: Text(
                                textAlign: TextAlign.justify,
                                'Pembaruan Keamanan\nKami secara teratur melakukan pembaruan keamanan pada aplikasi PPOB untuk mengatasi kerentanan dan melindungi Anda dari ancaman keamanan terbaru. Pastikan untuk selalu menginstal pembaruan terbaru agar Anda mendapatkan perlindungan yang optimal.',
                                style: blackFont16.copyWith(
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          textAlign: TextAlign.justify,
                          'Kami berkomitmen untuk menjaga keamanan data dan informasi Anda dengan standar yang tinggi. Namun, harap diingat bahwa tidak ada sistem keamanan yang sempurna, dan Anda juga memiliki peran penting dalam menjaga keamanan akun Anda. Selalu jaga kerahasiaan informasi pribadi Anda dan hindari berbagi informasi sensitif dengan pihak yang tidak terpercaya.\nJika Anda memiliki pertanyaan atau perlu bantuan terkait keamanan aplikasi PPOB, jangan ragu untuk menghubungi tim dukungan kami.',
                          style:
                              blackFont16.copyWith(fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
