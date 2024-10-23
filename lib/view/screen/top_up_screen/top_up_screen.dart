import 'package:capstone_flutter/view/screen/top_up_screen/top_up_bca.dart';
import 'package:capstone_flutter/view/screen/top_up_screen/top_up_bni.dart';
import 'package:capstone_flutter/view/screen/top_up_screen/top_up_bri.dart';
import 'package:capstone_flutter/view/screen/top_up_screen/top_up_mandiri.dart';
import 'package:flutter/material.dart';

import '../../../utils/const/theme.dart';

class TopUpScreen extends StatefulWidget {
  const TopUpScreen({super.key});

  @override
  State<TopUpScreen> createState() => _TopUpScreenState();
}

class _TopUpScreenState extends State<TopUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        title: Text(
          'Top Up',
          style: blackFont20.copyWith(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 30),
                child: Text(
                  'Pilih Metode isi Saldo',
                  style: blackFont14.copyWith(color: Colors.black),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const TopUpBca(bankCode: "014")));
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 30,
                  height: 50,
                ),
                const Image(
                  image: AssetImage('assets/bca.png'),
                  width: 50,
                ),
                const SizedBox(width: 20),
                Text(
                  'BCA',
                  style: blackFont14.copyWith(color: Colors.black),
                ),
                const Spacer(),
                const Icon(
                  Icons.keyboard_arrow_right_outlined,
                  size: 25,
                ),
                const SizedBox(width: 30),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 3, left: 30, right: 30),
            child: Divider(
              color: Colors.grey,
              thickness: 1,
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const TopUpBni(bankCode: "009")));
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 30,
                  height: 50,
                ),
                const Image(
                  image: AssetImage('assets/bni.png'),
                  width: 50,
                ),
                const SizedBox(width: 20),
                Text(
                  'BNI',
                  style: blackFont14.copyWith(color: Colors.black),
                ),
                const Spacer(),
                const Icon(
                  Icons.keyboard_arrow_right_outlined,
                  size: 25,
                ),
                const SizedBox(width: 30),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 3, left: 30, right: 30),
            child: Divider(
              color: Colors.grey,
              thickness: 1,
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const TopUpMandiri(bankCode: "008")));
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 30,
                  height: 50,
                ),
                const Image(
                  image: AssetImage('assets/mandiri.png'),
                  width: 50,
                ),
                const SizedBox(width: 20),
                Text(
                  'Mandiri',
                  style: blackFont14.copyWith(color: Colors.black),
                ),
                const Spacer(),
                const Icon(
                  Icons.keyboard_arrow_right_outlined,
                  size: 25,
                ),
                const SizedBox(width: 30),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 3, left: 30, right: 30),
            child: Divider(
              color: Colors.grey,
              thickness: 1,
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const TopUpBri(bankCode: "002")));
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 30,
                  height: 50,
                ),
                const Image(
                  image: AssetImage('assets/bri.png'),
                  width: 50,
                ),
                const SizedBox(width: 20),
                Text(
                  'BRI',
                  style: blackFont14.copyWith(color: Colors.black),
                ),
                const Spacer(),
                const Icon(
                  Icons.keyboard_arrow_right_outlined,
                  size: 25,
                ),
                const SizedBox(width: 30),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 3, left: 30, right: 30),
            child: Divider(
              color: Colors.grey,
              thickness: 1,
            ),
          ),
        ],
      ),
    );
  }
}
