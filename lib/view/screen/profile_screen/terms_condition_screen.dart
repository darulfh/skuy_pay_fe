import 'package:flutter/material.dart';

import '../../../utils/const/theme.dart';

class TermsCondition extends StatelessWidget {
  const TermsCondition({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Syarat dan Ketentuan',
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
                      'Syarat dan Ketentuan Pada Aplikasi SkuyPay',
                      style: blackFont16.copyWith(color: blueColor),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      '(Diperbarui pada tanggal 13 July 2024)',
                      style: blackFont16.copyWith(fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      textAlign: TextAlign.justify,
                      'Selamat datang di Aplikasi SkuyPay! Sebelum Anda mulai menggunakan aplikasi ini, kami ingin menjelaskan beberapa syarat dan ketentuan yang berlaku. Harap diperhatikan bahwa dengan menggunakan aplikasi ini, Anda dianggap telah membaca, memahami, dan menyetujui syarat dan ketentuan yang tercantum di bawah ini:',
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
                                'Penggunaan Aplikasi: Aplikasi SkuyPay disediakan untuk digunakan secara pribadi dan non-komersial. Anda tidak diperkenankan mengubah, menyalin, mendistribusikan, atau menggunakan konten dari aplikasi ini tanpa izin tertulis dari kami.',
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
                                'Keamanan dan Privasi: Kami menghargai privasi Anda dan berkomitmen untuk melindungi informasi pribadi yang Anda berikan. Namun, kami tidak bertanggung jawab atas segala kerugian atau kebocoran data yang disebabkan oleh penggunaan aplikasi ini oleh pihak ketiga yang tidak sah.',
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
                                'Verifikasi Identitas: Untuk keamanan dan pencegahan penyalahgunaan, kami dapat meminta Anda untuk melakukan verifikasi identitas. Anda harus memberikan informasi yang akurat dan lengkap sesuai dengan permintaan kami.',
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
                                'Tanggung Jawab Pengguna: Anda bertanggung jawab penuh atas segala aktivitas yang terjadi pada akun Anda. Anda harus menjaga kerahasiaan informasi akun Anda dan tidak memberikan akses ke orang lain tanpa izin.',
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
                                'Pembayaran dan Tagihan: Saat menggunakan Aplikasi SkuyPay, Anda harus memastikan bahwa informasi pembayaran yang Anda berikan adalah akurat dan valid. Anda bertanggung jawab atas pembayaran yang dilakukan melalui aplikasi ini, dan kami tidak bertanggung jawab atas kesalahan pembayaran yang disebabkan oleh informasi yang tidak benar.',
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
                              '6. ',
                              style: blackFont16.copyWith(
                                  fontWeight: FontWeight.w400),
                            ),
                            Expanded(
                              child: Text(
                                textAlign: TextAlign.justify,
                                'Pembatasan Tanggung Jawab: Kami berusaha keras untuk menyediakan layanan yang handal dan akurat. Namun, kami tidak menjamin bahwa aplikasi ini akan selalu bebas dari kesalahan atau gangguan. Kami tidak bertanggung jawab atas kerugian atau kerusakan yang timbul akibat penggunaan aplikasi ini.',
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
                              '7. ',
                              style: blackFont16.copyWith(
                                  fontWeight: FontWeight.w400),
                            ),
                            Expanded(
                              child: Text(
                                textAlign: TextAlign.justify,
                                'Perubahan Syarat dan Ketentuan: Kami berhak untuk mengubah atau memperbarui syarat dan ketentuan ini sesuai dengan kebijakan perusahaan kami. Perubahan tersebut akan efektif setelah diberitahukan kepada Anda melalui aplikasi atau melalui metode komunikasi lain yang kami tentukan.',
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
                          'Dengan menggunakan Aplikasi PPOB, Anda dianggap telah membaca, memahami, dan menyetujui syarat dan ketentuan yang tercantum di atas. Jika Anda tidak setuju dengan syarat dan ketentuan ini, harap menghentikan penggunaan aplikasi ini. Terima kasih telah menggunakan Aplikasi PPOB, kami berharap Anda mendapatkan pengalaman yang menyenangkan dan bermanfaat dalam menggunakan layanan kami.',
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
