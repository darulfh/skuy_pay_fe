import 'package:capstone_flutter/view/screen/pulsa&paket_data_screen/pin_pulsa_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/const/theme.dart';
import '../../../view_model/pulsa_paketdata/pulsa_paket_data_view_model.dart';
import '../../../view_model/user_provider/user_provider.dart';

class MetodePembayaranPulsaScreen extends StatefulWidget {
  final String id;
  final String name;
  final String type;
  final String code;
  final String provider;
  final double price;
  final double adminFee;
  final String description;
  final DateTime createdAt;
  final String token;
  final String phoneNumber;
  const MetodePembayaranPulsaScreen({
    super.key,
    required this.id,
    required this.name,
    required this.type,
    required this.code,
    required this.provider,
    required this.price,
    required this.adminFee,
    required this.description,
    required this.createdAt,
    required this.token,
    required this.phoneNumber,
  });

  @override
  State<MetodePembayaranPulsaScreen> createState() =>
      _MetodePembayaranPulsaScreenState();
}

class _MetodePembayaranPulsaScreenState
    extends State<MetodePembayaranPulsaScreen> {
  String? selectedRadio;
  // ignore: unused_field
  late SharedPreferences _prefs;

  @override
  void initState() {
    super.initState();
    // ignore: avoid_print
    print('pembayaran pulsa : ${widget.token}');
  }

  @override
  Widget build(BuildContext context) {
    final pulsaPaketDataProvider =
        Provider.of<PulsaDanPaketDataViewModel>(context);
    final userProvider = Provider.of<UserProvider>(context);

    //ambil data
    final myBalance = userProvider.balance;
    return Scaffold(
      backgroundColor: Colors.white,
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
            const SizedBox(height: 24),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xffFDE7AA),
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
            const SizedBox(height: 16),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 90,
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
                          // 'Saldo SkuyPay (Rp.${myBalance.toString()})',
                          'Saldo SkuyPay (Rp. ${NumberFormat('#,###', 'id_ID').format(myBalance)})',
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
            const SizedBox(height: 16),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 190,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 10, top: 10, bottom: 15, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      child: Text(
                        'Detail',
                        style:
                            blackFont12.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Produk',
                            style: blackFont12.copyWith(
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            'Pulsa ${pulsaPaketDataProvider.selectPulsaData?.name ?? ""}',
                            style: blackFont12.copyWith(
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Harga',
                            style: blackFont12.copyWith(
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            // 'Rp.${pulsaPaketDataProvider.selectPulsaData?.price.toString() ?? ""}',
                            'Rp. ${NumberFormat('#,###', 'id_ID').format(pulsaPaketDataProvider.selectPulsaData?.price.toInt() ?? "")}',
                            style: blackFont12.copyWith(
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Promo',
                            style: blackFont12.copyWith(
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            '-',
                            style: blackFont12.copyWith(
                                fontWeight: FontWeight.w400),
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
                      padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 12),
                                child: Text(
                                  'Total',
                                  style: blackFont12.copyWith(
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 12),
                                child: Text(
                                  // 'Rp.${pulsaPaketDataProvider.selectPulsaData?.price.toString() ?? ""}',
                                  'Rp. ${NumberFormat('#,###', 'id_ID').format(pulsaPaketDataProvider.selectPulsaData?.price.toInt() ?? "")}',
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
              var saldo = double.parse(myBalance.toString()) -
                  double.parse(widget.price.toString());
              var total = double.parse(widget.price.toString());
              if (selectedRadio == null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Pilih metode pembayaran'),
                    backgroundColor: Colors.red,
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              } else if (selectedRadio != null && myBalance < total) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Saldo tidak cukup'),
                    backgroundColor: Colors.red,
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              } else {
                // ignore: avoid_print
                print(widget.id);
                // ignore: avoid_print
                print(widget.name);
                // ignore: avoid_print
                print('saldo : $saldo');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PinPulsaScreen(
                      token: widget.token,
                      id: widget.id,
                      name: widget.name,
                      price: widget.price,
                      type: widget.type,
                      code: widget.code,
                      adminFee: widget.adminFee,
                      provider: widget.provider,
                      description: widget.description,
                      createdAt: widget.createdAt,
                      balanceNow: double.parse(myBalance.toString()) -
                          double.parse(widget.price.toString()),
                      phoneNumber: widget.phoneNumber,
                    ),
                  ),
                );
              }
            },
            child: Text(
              'Yuk Bayar!',
              style: whiteFont14.copyWith(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
