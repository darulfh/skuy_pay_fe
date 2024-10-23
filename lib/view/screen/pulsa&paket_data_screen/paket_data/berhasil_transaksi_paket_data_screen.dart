import 'package:capstone_flutter/utils/const/theme.dart';
import 'package:capstone_flutter/view/screen/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../view_model/pulsa_paketdata/pulsa_paket_data_view_model.dart';

class BerhasilTransaksiPaketData extends StatefulWidget {
  final String id;
  final String name;
  final String type;
  final String code;
  final String provider;
  final double price;
  final double adminFee;
  final String description;
  final DateTime createdAt;

  const BerhasilTransaksiPaketData(
      {super.key,
      required this.id,
      required this.name,
      required this.type,
      required this.code,
      required this.provider,
      required this.price,
      required this.adminFee,
      required this.description,
      required this.createdAt});

  @override
  State<BerhasilTransaksiPaketData> createState() =>
      _BerhasilTransaksiPaketDataState();
}

class _BerhasilTransaksiPaketDataState
    extends State<BerhasilTransaksiPaketData> {
  late SharedPreferences _prefs;

  String phone = '';
  String token = '';

  Future<void> initializeData() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      phone = _prefs.getString('phone') ?? '';
      token = _prefs.getString('token') ?? '';
    });
  }

  @override
  void initState() {
    super.initState();
    initializeData(); // Panggil fungsi untuk inisialisasi data
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final pulsaPaketDataProvider =
        Provider.of<PulsaDanPaketDataViewModel>(context);
    return Consumer<PulsaDanPaketDataViewModel>(
      builder: (context, paketDataProvider, _) {
        // ignore: unused_local_variable
        final paketData = paketDataProvider.paketData;
        // int index = 0;
        // String price = paketDataProvider.paketData[index].price.toString();

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
                          DateFormat('dd MMMM yyyy. HH:mm')
                              // ignore: unnecessary_cast
                              .format(widget.createdAt as DateTime),
                          style: blackFont12.copyWith(fontSize: 10),
                        ),
                        Text(
                          'SkuyPay $phone',
                          // 'SkuyPay 0857xxxx2345',
                          style: blackFont12,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 170,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 10, top: 15, bottom: 15, right: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10, top: 5, right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Produk',
                                  style: blackFont12.copyWith(
                                      fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  'Data ${pulsaPaketDataProvider.selectPaketData?.name.toString() ?? ""}',
                                  style: blackFont12.copyWith(
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10, top: 15, right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'No. Handphone',
                                  style: blackFont12.copyWith(
                                      fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  pulsaPaketDataProvider
                                          .selectPaketData?.phone62 ??
                                      "",
                                  style: blackFont12.copyWith(
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10, top: 15, right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Harga',
                                  style: blackFont12.copyWith(
                                      fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  // 'Rp.${pulsaPaketDataProvider.selectPaketData?.price.toString() ?? ""}',
                                  'Rp. ${NumberFormat('#,###', 'id_ID').format(pulsaPaketDataProvider.selectPaketData?.price.toInt() ?? "")}',
                                  style: blackFont12.copyWith(
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 21),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 5, 5),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15),
                                      child: Text(
                                        'Total Tagihan',
                                        style: blackFont12.copyWith(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15),
                                      child: Text(
                                        // 'Rp.${pulsaPaketDataProvider.selectPaketData?.price.toString() ?? ""}',
                                        'Rp. ${NumberFormat('#,###', 'id_ID').format(pulsaPaketDataProvider.selectPaketData?.price.toInt() ?? "")}',
                                        style: blackFont12.copyWith(
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
                    ),
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NavBar(initialIndex: 0),
                    ),
                  );
                },
                child: Text(
                  'Selesai',
                  style: whiteFont14,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
