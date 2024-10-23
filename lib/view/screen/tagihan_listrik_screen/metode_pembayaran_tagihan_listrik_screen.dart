import 'package:capstone_flutter/view/screen/tagihan_listrik_screen/pin_tagihan_listrik_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../utils/const/theme.dart';
import '../../../view_model/user_provider/user_provider.dart';

class MetodePembayaranTagihanScreen extends StatefulWidget {
  final String id;
  final String userId;
  final String pelangganData;
  final DateTime createdAt;
  final String providerName;
  final double price;
  final double adminFee;
  final String customerName;
  final int elecricalPower;

  const MetodePembayaranTagihanScreen({
    super.key,
    required this.id,
    required this.userId,
    required this.pelangganData,
    required this.createdAt,
    required this.providerName,
    required this.price,
    required this.adminFee,
    required this.customerName,
    required this.elecricalPower,
  });

  @override
  State<MetodePembayaranTagihanScreen> createState() =>
      _MetodePembayaranTagihanScreenState();
}

class _MetodePembayaranTagihanScreenState
    extends State<MetodePembayaranTagihanScreen> {
  String? selectedRadio;

  // late SharedPreferences _prefs;

  @override
  Widget build(BuildContext context) {
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
            const SizedBox(height: 10),
            Text(
              'Dari PT SOLUSINDO JAYA',
              style: blackFont12.copyWith(fontWeight: FontWeight.w700),
            ),
            Text(
              'Tagihan Listrik ${widget.pelangganData}',
              style: blackFont12.copyWith(fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 32),
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
              height: 85,
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
                          // 'Saldo SkuyPay (Rp. ${NumberFormat('#,###', 'id_ID').format(myBalance)})',
                          'Saldo SkuyPay (Rp. ${NumberFormat('#,###', 'id_ID').format(myBalance.toInt())})',
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
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 10, top: 15, bottom: 15, right: 10),
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
                          style:
                              blackFont12.copyWith(fontWeight: FontWeight.w400),
                        ),
                        Text(
                          'Rp. ${NumberFormat('#,###', 'id_ID').format(widget.adminFee + widget.price)}',
                          style:
                              blackFont12.copyWith(fontWeight: FontWeight.w400),
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
                          style:
                              blackFont12.copyWith(fontWeight: FontWeight.w400),
                        ),
                        Text(
                          '-',
                          style:
                              blackFont12.copyWith(fontWeight: FontWeight.w400),
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
                          style: blackFont12.copyWith(
                              fontWeight: FontWeight.w700,
                              color: const Color(0xff111111)),
                        ),
                        Text(
                          'Rp. ${NumberFormat('#,###', 'id_ID').format(widget.adminFee + widget.price)}',
                          style: blackFont12.copyWith(
                              fontWeight: FontWeight.w700,
                              color: const Color(0xff111111)),
                        ),
                      ],
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
              var saldo = myBalance.toDouble() -
                  widget.price.toDouble() +
                  widget.adminFee.toDouble();
              var total = widget.price.toDouble() + widget.adminFee.toDouble();
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
                    content: Text('Saldo kamu tidak cukup.'),
                    backgroundColor: Colors.red,
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              } else {
                // ignore: avoid_print
                print(widget.id);
                // ignore: avoid_print
                print('saldo : $saldo');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PinTagihanListrikScreen(
                      id: widget.id,
                      userId: widget.userId,
                      price: widget.price,
                      adminFee: widget.adminFee,
                      customerName: widget.customerName,
                      pelangganData: widget.pelangganData,
                      providerName: widget.providerName,
                      elecricalPower: widget.elecricalPower,
                      createdAt: widget.createdAt,
                      balanceNow: myBalance.toDouble() -
                          (widget.adminFee + widget.price).toDouble(),
                    ),
                  ),
                );
              }
            },
            child: Text(
              'Yuk Bayar!',
              style: whiteFont14,
            ),
          ),
        ),
      ),
    );
  }
}
