import 'package:capstone_flutter/view/screen/pin_screen/modal_bottom_create_pin_screen.dart';
import 'package:flutter/material.dart';
import 'package:capstone_flutter/utils/const/theme.dart';

class PinAddedScreen extends StatefulWidget {
  const PinAddedScreen({super.key});

  @override
  State<PinAddedScreen> createState() => _PinAddedScreenState();
}

class _PinAddedScreenState extends State<PinAddedScreen> {
  TextEditingController pelangganController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    pelangganController.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showModalBottomSheet();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: ElevatedButton(
          style:
              ButtonStyle(backgroundColor: WidgetStatePropertyAll(blueColor)),
          onPressed: () {
            _showModalBottomSheet();
          },
          child: const Text('PIN added'),
        ),
      ),
    );
  }

  void _showModalBottomSheet() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: (BuildContext context) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 250,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 20, 15, 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: Icon(
                    Icons.check_circle,
                    color: Colors.green,
                    size: 60,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(
                    'Oke! Kode PIN kamu sudah tersimpan',
                    style: blackText16,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(
                    'Lebih mudah dan aman menggunakan Kode PIN',
                    style: blackFont14,
                  ),
                ),
                const SizedBox(height: 25),
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
                                    const ModalBottomCreatePin()));
                      },
                      child: Text(
                        'Lanjutkan',
                        style: whiteFont14.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
