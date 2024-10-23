import 'package:capstone_flutter/view/screen/transfer_screen/pin_transfer_screen.dart';
import 'package:flutter/material.dart';

import '../../../utils/const/theme.dart';

class DetailPembayaranTransferScreen extends StatefulWidget {
  const DetailPembayaranTransferScreen({super.key});

  @override
  State<DetailPembayaranTransferScreen> createState() =>
      _DetailPembayaranTransferScreenState();
}

class _DetailPembayaranTransferScreenState
    extends State<DetailPembayaranTransferScreen> {
  // text editing controller

  final TextEditingController catatanController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    catatanController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
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
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Asep Bersahaja',
                    style: blackFont14,
                  ),
                ),
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '0821*******1',
                    style: blackFont14.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Jumlah Kirim',
                    style: blackFont16,
                  ),
                ),
                const SizedBox(height: 12),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Rp 100.000',
                    style: blackText24.copyWith(
                      color: const Color(0xff8E8B8B),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  autofocus: false,
                  controller: catatanController,
                  obscureText: true,
                  enabled: false,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.fromLTRB(13, 15, 20, 15),
                    hintText: 'Jajan Cilok',
                    hintStyle: blackFont14.copyWith(color: Colors.grey),
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        color: Color(0xff2B3990),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(top: height * 0.48),
            padding: const EdgeInsets.all(30),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              boxShadow: [
                BoxShadow(
                  color: Color(0xffE5E5E5),
                  spreadRadius: 0,
                  blurRadius: 10,
                  offset: Offset(0, -6), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Biaya Transaksi',
                      style: blackText16.copyWith(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Gratis',
                      style: blackText16.copyWith(
                        color: const Color(0xff298012),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 13),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total Harga',
                      style: blackText16.copyWith(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      '-Rp 100.000',
                      style: blackText16.copyWith(
                        color: const Color(0xffAE2A13),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 13),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      ' ',
                      style: blackText16,
                    ),
                    Text(
                      'Rp 900.000',
                      style: blackText16.copyWith(
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff6C6C6C),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 13),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Sisa Saldo',
                      style: blackText16.copyWith(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Rp 800.000',
                      style: blackText16.copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
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
                  builder: (context) => const PinTransferScreen(),
                ),
              );
            },
            child: Text(
              'Transfer',
              style: whiteFont14,
            ),
          ),
        ),
      ),
    );
  }
}
