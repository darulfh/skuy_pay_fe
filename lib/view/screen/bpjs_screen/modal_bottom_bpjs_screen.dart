import 'package:capstone_flutter/utils/const/theme.dart';
import 'package:capstone_flutter/view/screen/bpjs_screen/payment_detail_bpjs_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ModalBottomBpjs extends StatefulWidget {
  const ModalBottomBpjs({super.key});

  @override
  State<ModalBottomBpjs> createState() => _ModalBottomBpjsState();
}

class _ModalBottomBpjsState extends State<ModalBottomBpjs> {
  TextEditingController pelangganController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    pelangganController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: ElevatedButton(
          style:
              ButtonStyle(backgroundColor: WidgetStatePropertyAll(blueColor)),
          onPressed: () {
            _showModalBottomSheet();
          },
          child: const Text('BPJS'),
        ),
      ),
    );
  }

  void _showModalBottomSheet() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: (BuildContext context) {
        return SingleChildScrollView(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context)
                .viewInsets
                .bottom, // Adjust bottom padding based on keyboard height
          ),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 250,
            // height: MediaQuery.of(context).size.height / 2.7,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 20, 15, 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'BPJS Kesehatan',
                      style: blackText24,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'No. Pelanggan',
                    style: blackFont16.copyWith(fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.black),
                    ),
                    child: TextField(
                      controller: pelangganController,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintStyle: blackFont16,
                        hintText: 'Masukkan No Pelanggan',
                      ),
                    ),
                  ),
                  Expanded(
                      child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                  )),
                  // const SizedBox(height: 25),

                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
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
                                  builder: (context) =>
                                      const PaymentDetailBpjs()));
                        },
                        child: Text(
                          'Lanjutkan',
                          style: whiteFont14,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
