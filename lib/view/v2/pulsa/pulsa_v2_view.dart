import 'package:capstone_flutter/utils/const/theme.dart';
import 'package:capstone_flutter/view/v2/pulsa/pulsa_detail_pembayaran_v2.dart';
import 'package:capstone_flutter/view/v2/pulsa/widget/pulsa_bottom.dart';
import 'package:capstone_flutter/view/v2/pulsa/widget/pulsa_input_number.dart';
import 'package:capstone_flutter/view/v2/pulsa/widget/pulsa_card.dart';
import 'package:capstone_flutter/view_model/pulsa_paketdata/pulsa_v2_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PulsaV2View extends StatefulWidget {
  const PulsaV2View({super.key});

  @override
  State<PulsaV2View> createState() => _PulsaV2ViewState();
}

class _PulsaV2ViewState extends State<PulsaV2View> {
  final TextEditingController phoneController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    phoneController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pulsa = context.watch<PulsaV2ViewModel>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Pulsa',
          style: blackFont18.copyWith(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          PulsaInputNumber(
            phoneController: phoneController,
          ),
          const PulsaCards(),
        ],
      ),
      bottomNavigationBar: PulsaBottomBar(
          isSelected: pulsa.selectPulsaData != null,
          onTap: () {
            if (phoneController.text.length < 10) return;
            if (pulsa.selectPulsaData == null) return;

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const PulsaDetailPembayaranV2View(),
              ),
            );
          }),
    );
  }
}
