import 'package:capstone_flutter/utils/const/theme.dart';
import 'package:capstone_flutter/view/v2/pulsa/pulsa_metode_pembayaran_v2.dart';
import 'package:capstone_flutter/view/v2/pulsa/widget/pulsa_bottom.dart';
import 'package:capstone_flutter/view_model/pulsa_paketdata/pulsa_v2_view_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class PulsaDetailPembayaranV2View extends StatelessWidget {
  const PulsaDetailPembayaranV2View({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: const [
          _Bottom(),
        ],
      ),
      bottomNavigationBar: PulsaBottomBar(
        isSelected: true,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const PulsaMetodePembayaranV2View(),
            ),
          );
        },
      ),
    );
  }
}

class _Bottom extends StatelessWidget {
  const _Bottom();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Image.asset(
            'assets/images/ic_telkomsel.png',
            width: 132,
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        Text(
          'Kode Promo',
          style: blackFont14.copyWith(fontWeight: FontWeight.w400),
        ),
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
          width: double.infinity,
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
        const SizedBox(height: 12),
        const _PulsaDetail(),
      ],
    );
  }
}

class _PulsaDetail extends StatelessWidget {
  const _PulsaDetail();

  @override
  Widget build(BuildContext context) {
    return Consumer<PulsaV2ViewModel>(
      builder: (context, value, child) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Produk',
                      style: blackFont12.copyWith(fontWeight: FontWeight.w400),
                    ),
                    Text(
                      'Pulsa ${value.selectPulsaData?.name ?? ""}',
                      // 'Pulsa 5000',
                      style: blackFont12.copyWith(fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5, top: 8, right: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'No. Handphone',
                      style: blackFont12.copyWith(fontWeight: FontWeight.w400),
                    ),
                    Text(
                      // pulsatData.phone62.toString(),
                      value.phone,
                      // 'O85278xxxxx',
                      style: blackFont12.copyWith(fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5, top: 8, right: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Harga',
                      style: blackFont12.copyWith(fontWeight: FontWeight.w400),
                    ),
                    Text(
                      // 'Rp.${pulsaPaketDataProvider.selectPulsaData?.price.toString() ?? ""}',
                      'Rp. ${NumberFormat('#,###', 'id_ID').format(value.selectPulsaData?.price.toInt())}',
                      // 'Rp 6.500',
                      style: blackFont12.copyWith(fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Divider(
                  color: Colors.grey,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(5, 0, 5, 5),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    // color: Colors.green[100],
                    color: const Color(0xffBADDB1),
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: 34,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Text(
                            'Total tagihan',
                            style: blackFont12.copyWith(
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Text(
                            'Rp. ${NumberFormat('#,###', 'id_ID').format(value.selectPulsaData?.price.toInt())}',
                            style: blackFont14.copyWith(
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
