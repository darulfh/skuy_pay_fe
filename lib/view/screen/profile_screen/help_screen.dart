import 'package:flutter/material.dart';

import '../../../utils/const/theme.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Bantuan',
          style: blackFont18.copyWith(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Container(
            color: blueColor,
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Halo Ijat',
                  style:
                      whiteFont14.copyWith(color: Colors.white, fontSize: 16),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  'Ada yang bisa kami bantu?',
                  style:
                      whiteFont14.copyWith(color: Colors.white, fontSize: 16),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Kamu bisa cari dan baca topik yang ingin\nditanyakan',
                  style:
                      whiteFont14.copyWith(color: Colors.white, fontSize: 12),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      hintText: 'Coba cari "Transfer"',
                      hintStyle: blackFont16.copyWith(
                          fontSize: 12, color: Colors.grey),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 180,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Pertanyaan paling dicari',
                        style: blackFont18.copyWith(fontSize: 14),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) =>
                          //             const SecuritySettingScreen()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 10, top: 15, bottom: 15, right: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Mengapa transaksi pembayaran saya tidak berhasil?',
                                style: blackFont16.copyWith(
                                    fontWeight: FontWeight.w400, fontSize: 12),
                              ),
                              const Icon(
                                Icons.arrow_forward_ios,
                                size: 16,
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => const TermsCondition()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 10, top: 15, bottom: 15, right: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Apakah ada biaya tambahan yang harus saya bayar',
                                style: blackFont16.copyWith(
                                    fontWeight: FontWeight.w400, fontSize: 12),
                              ),
                              const Icon(
                                Icons.arrow_forward_ios,
                                size: 16,
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) =>
                          //             const SecurityPolicyScreen()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 10, top: 15, bottom: 15, right: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Apa yang harus saya lakukan jika tagihan yang saya\nbayar tidak terverifikasi oleh pihak yang menerima\npembayaran?',
                                style: blackFont16.copyWith(
                                    fontWeight: FontWeight.w400, fontSize: 12),
                              ),
                              const Icon(
                                Icons.arrow_forward_ios,
                                size: 16,
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HelpScreen()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 10, top: 15, bottom: 15, right: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Mengapa transaksi pembayaran saya tidak berhasil?',
                                style: blackFont16.copyWith(
                                    fontWeight: FontWeight.w400, fontSize: 12),
                              ),
                              const Icon(
                                Icons.arrow_forward_ios,
                                size: 16,
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HelpScreen()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 10, top: 15, bottom: 15, right: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Apakah ada promo atau diskon spesial untuk\npembayaran tagihan tertentu?',
                                style: blackFont16.copyWith(
                                    fontWeight: FontWeight.w400, fontSize: 12),
                              ),
                              const Icon(
                                Icons.arrow_forward_ios,
                                size: 16,
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          'Lihat Semua',
                          style: blackFont16.copyWith(
                              color: blueColor, fontSize: 12),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          'Layanan Pengaduan Konsumen',
                          style: blackFont16,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          height: 110,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.black),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Spacer(),
                                Image.asset('assets/icon_bantuan2.png'),
                                const Spacer(),
                                Center(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Tim kami siap melayani 24 jam',
                                        style: blackFont16.copyWith(
                                            fontWeight: FontWeight.w700),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        'WhatsApp +6285109898998',
                                        style: blackFont16.copyWith(
                                            fontWeight: FontWeight.w400,
                                            color: Colors.green),
                                      ),
                                      Text(
                                        'Telepon (021)300018726',
                                        style: blackFont16.copyWith(
                                            fontWeight: FontWeight.w400),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
