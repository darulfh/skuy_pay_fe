import 'package:capstone_flutter/utils/const/theme.dart';
import 'package:capstone_flutter/view_model/pulsa_paketdata/paket_data_v2_view_model.dart';
import 'package:capstone_flutter/view_model/pulsa_paketdata/pulsa_v2_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class PulsaInputNumber extends StatelessWidget {
  final TextEditingController phoneController;
  final bool isPulsa;
  const PulsaInputNumber(
      {super.key, required this.phoneController, this.isPulsa = true});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'No. Telp',
          style: blackFont14,
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Container(
              width: 60,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Colors.black,
                  )),
              child: Center(
                child: Text(
                  '+62',
                  style: blackFont14.copyWith(color: Colors.black),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width - (24 + 24 + 60 + 10),
              // width: 249,
              child: TextFormField(
                autofocus: false,
                controller: phoneController,
                obscureText: false,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.fromLTRB(10, 0, 20, 0),
                  hintText: 'Contoh: 081234567890',
                  hintStyle: blackFont12.copyWith(color: Colors.grey),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      color: Colors.black,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      color: Colors.black,
                    ),
                  ),
                  suffixIcon: phoneController.text.length > 9
                      ? Container(
                          height: 20,
                          width: 20,
                          margin: const EdgeInsets.all(10.0),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green,
                          ),
                          child: const Icon(
                            Icons.done,
                            color: Colors.white,
                            size: 20,
                          ),
                        )
                      : null,
                ),
                onChanged: (value) {
                  if (isPulsa) {
                    context.read<PulsaV2ViewModel>().changePhone(value);
                  } else {
                    context.read<PaketDataV2ViewModel>().changePhone(value);
                  }
                },
                onFieldSubmitted: (value) {
                  if (isPulsa) {
                    context.read<PulsaV2ViewModel>().getPulsa();
                  } else {
                    context.read<PaketDataV2ViewModel>().getPaketData();
                  }
                },
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          'Silahkan masukkan nomor Hp mu',
          style: blackFont12.copyWith(
            color: const Color(0xff6C6C6C),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
