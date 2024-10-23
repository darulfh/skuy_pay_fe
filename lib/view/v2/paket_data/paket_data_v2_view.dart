import 'package:capstone_flutter/utils/const/theme.dart';
import 'package:capstone_flutter/view/v2/paket_data/paket_data_detail_pembayaran_v2.dart';
import 'package:capstone_flutter/view/v2/paket_data/widgets/paket_data_card.dart';
import 'package:capstone_flutter/view/v2/pulsa/widget/pulsa_bottom.dart';
import 'package:capstone_flutter/view/v2/pulsa/widget/pulsa_input_number.dart';
import 'package:capstone_flutter/view_model/pulsa_paketdata/paket_data_v2_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PaketDataV2View extends StatefulWidget {
  const PaketDataV2View({super.key});

  @override
  State<PaketDataV2View> createState() => _PaketDataV2ViewState();
}

class _PaketDataV2ViewState extends State<PaketDataV2View> {
  final TextEditingController phoneController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    phoneController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final paketData = context.watch<PaketDataV2ViewModel>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Paket Data',
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
            isPulsa: false,
          ),
          const PaketDataCards(),
        ],
      ),
      bottomNavigationBar: PulsaBottomBar(
          isSelected: paketData.selectPaketData != null,
          onTap: () {
            if (phoneController.text.length < 10) return;
            if (paketData.selectPaketData == null) return;

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const PaketDataDetailPembayaranV2View(),
              ),
            );
          }),
    );
  }
}
