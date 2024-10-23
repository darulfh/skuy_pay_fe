import 'package:flutter/material.dart';
import '../../../utils/const/theme.dart';
import 'berhasil_transaksi_tagihan_screen.dart';

class IlustrationSuksesTagihanScreen extends StatefulWidget {
  final String id;
  final String userId;
  final String pelangganData;
  final DateTime createdAt;
  final String providerName;
  final double price;
  final double adminFee;
  final String customerName;
  final int elecricalPower;

  const IlustrationSuksesTagihanScreen({
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
  State<IlustrationSuksesTagihanScreen> createState() =>
      _IlustrationSuksesTagihanScreenState();
}

class _IlustrationSuksesTagihanScreenState
    extends State<IlustrationSuksesTagihanScreen> {
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
                const SizedBox(height: 16),
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
                        builder: (context) => BerhasilTransaksiTagihanListrik(
                          id: widget.id,
                          userId: widget.userId,
                          pelangganData: widget.pelangganData,
                          createdAt: widget.createdAt,
                          providerName: widget.providerName,
                          price: widget.price,
                          adminFee: widget.adminFee,
                          customerName: widget.customerName,
                          elecricalPower: widget.elecricalPower,
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
