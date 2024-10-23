import 'package:capstone_flutter/view/screen/wifi_screen/success_transaction_wifi_screen.dart';
import 'package:flutter/material.dart';

import '../../../utils/const/theme.dart';

class IlustrationSuccessWifi extends StatefulWidget {
  final String id;
  final String userId;
  final String pelangganData;
  final DateTime createdAt;
  final String providerName;
  final double price;
  final double adminFee;
  final String customerName;
  const IlustrationSuccessWifi(
      {super.key,
      required this.id,
      required this.userId,
      required this.pelangganData,
      required this.createdAt,
      required this.providerName,
      required this.price,
      required this.adminFee,
      required this.customerName});

  @override
  State<IlustrationSuccessWifi> createState() => _IlustrationSuccessWifiState();
}

class _IlustrationSuccessWifiState extends State<IlustrationSuccessWifi> {
  bool _isLoading = true; // Variable to track loading state

  Future<void> _showContent() async {
    await Future.delayed(const Duration(seconds: 2)); // Wait for 2 seconds
    setState(() {
      _isLoading = false; // Set loading state to false
    });
  }

  @override
  void initState() {
    super.initState();
    _showContent(); // Call the showContent function when the widget initializes
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
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
            onPressed: _isLoading
                ? null
                : () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SuccessTransactionWifi(
                          id: widget.id,
                          userId: widget.userId,
                          createdAt: widget.createdAt,
                          pelangganData: widget.pelangganData,
                          adminFee: widget.adminFee,
                          customerName: widget.customerName,
                          price: widget.price,
                          providerName: widget.providerName,
                        ),
                      ),
                    );
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
