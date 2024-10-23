import 'package:capstone_flutter/utils/const/theme.dart';
import 'package:capstone_flutter/view/v2/pulsa/pulsa_pin_v2.dart';
import 'package:capstone_flutter/view/v2/pulsa/widget/pulsa_bottom.dart';
import 'package:capstone_flutter/view_model/pulsa_paketdata/pulsa_v2_view_model.dart';
import 'package:capstone_flutter/view_model/user_provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class PulsaMetodePembayaranV2View extends StatelessWidget {
  const PulsaMetodePembayaranV2View({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: const [
          _Confirmation(),
          SizedBox(height: 16),
          _MetodePembayaran(),
          SizedBox(height: 16),
          _PulsaDetail(),
        ],
      ),
      bottomNavigationBar: PulsaBottomBar(
        isSelected: true,
        onTap: () {
          final pulsa = context.read<PulsaV2ViewModel>();
          final userProvider = context.read<UserProvider>();

          if (pulsa.selectedRadio == null) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Pilih metode pembayaran'),
                backgroundColor: Colors.red,
                behavior: SnackBarBehavior.floating,
              ),
            );
            return;
          }

          if (userProvider.balance - (pulsa.selectPulsaData?.price ?? 0) < 0) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Saldo tidak cukup'),
                backgroundColor: Colors.red,
                behavior: SnackBarBehavior.floating,
              ),
            );
            return;
          }

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const PinPulsaV2View(),
            ),
          );
        },
      ),
    );
  }
}

class _Confirmation extends StatelessWidget {
  const _Confirmation();

  @override
  Widget build(BuildContext context) {
    return Container(
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
                style: blackFont12.copyWith(fontWeight: FontWeight.bold),
              ),
              const Icon(Icons.help_outline)
            ],
          ),
        ),
      ),
    );
  }
}

class _MetodePembayaran extends StatelessWidget {
  const _MetodePembayaran();

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final pulsa = context.watch<PulsaV2ViewModel>();

    return Container(
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
                  'Saldo SkuyPay (Rp. ${NumberFormat('#,###', 'id_ID').format(userProvider.balance)})',
                  style: blackFont12.copyWith(fontWeight: FontWeight.w400),
                ),
                const Spacer(),
                Radio(
                  value: 'saldo_skuy_pay',
                  groupValue: pulsa.selectedRadio,
                  onChanged: (value) {
                    context.read<PulsaV2ViewModel>().changeRadio(value);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _PulsaDetail extends StatelessWidget {
  const _PulsaDetail();

  @override
  Widget build(BuildContext context) {
    final pulsa = context.watch<PulsaV2ViewModel>();

    return Container(
      width: MediaQuery.of(context).size.width,
      height: 190,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey),
      ),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 10, top: 10, bottom: 15, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: Text(
                'Detail',
                style: blackFont12.copyWith(fontWeight: FontWeight.bold),
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
                    style: blackFont12.copyWith(fontWeight: FontWeight.w400),
                  ),
                  Text(
                    'Pulsa ${pulsa.selectPulsaData?.name ?? ""}',
                    style: blackFont12.copyWith(fontWeight: FontWeight.w400),
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
                    style: blackFont12.copyWith(fontWeight: FontWeight.w400),
                  ),
                  Text(
                    // 'Rp.${pulsaPaketDataProvider.selectPulsaData?.price.toString() ?? ""}',
                    'Rp. ${NumberFormat('#,###', 'id_ID').format(pulsa.selectPulsaData?.price.toInt() ?? "")}',
                    style: blackFont12.copyWith(fontWeight: FontWeight.w400),
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
                    style: blackFont12.copyWith(fontWeight: FontWeight.w400),
                  ),
                  Text(
                    '-',
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
              padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
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
                          'Total',
                          style:
                              blackFont12.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Text(
                          'Rp. ${NumberFormat('#,###', 'id_ID').format(pulsa.selectPulsaData?.price.toInt() ?? "")}',
                          style:
                              blackFont14.copyWith(fontWeight: FontWeight.bold),
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
    );
  }
}
