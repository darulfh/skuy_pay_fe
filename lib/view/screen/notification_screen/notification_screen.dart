import 'package:flutter/material.dart';

import '../../../utils/const/theme.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        title: Text(
          'Pemberitahuan',
          style: blackFont20.copyWith(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 15),
              child: Text(
                '18 Mei 2023',
                style: blackFont16G.copyWith(
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(left: 30, top: 15),
                child: Container(
                  width: 340,
                  padding: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      border:
                          Border.all(color: Colors.grey.shade400, width: 1.0)),
                  child: const Text(
                      'Masa berlaku promo kamu akan segera habis nih. Yuk pakai sekarang!'),
                )),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 5),
              child: Text('14.46',
                  style: blackFont14.copyWith(
                    color: Colors.black,
                  )),
            ),
            Padding(
                padding: const EdgeInsets.only(left: 30, top: 15),
                child: Container(
                  width: 340,
                  padding: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border:
                          Border.all(color: Colors.grey.shade400, width: 1.0)),
                  child: const Text('Yey, Ijat dapet promo BPJS 50%'),
                )),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 5),
              child: Text('14.46',
                  style: blackFont14.copyWith(
                    color: Colors.black,
                  )),
            ),
            Padding(
                padding: const EdgeInsets.only(left: 30, top: 15),
                child: Container(
                  width: 340,
                  padding: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border:
                          Border.all(color: Colors.grey.shade400, width: 1.0)),
                  child:
                      const Text('Ada promo Token Listrik s/d Rp 500.000 nih!'),
                )),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 5),
              child: Text('14.46',
                  style: blackFont14.copyWith(
                    color: Colors.black,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 35),
              child: Text(
                '17 Mei 2023',
                style: blackFont16G.copyWith(
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(left: 30, top: 15),
                child: Container(
                  width: 340,
                  padding: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border:
                          Border.all(color: Colors.grey.shade400, width: 1.0)),
                  child:
                      const Text('Ada promo Token Listrik s/d Rp 500.000 nih!'),
                )),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 5),
              child: Text('14.46',
                  style: blackFont14.copyWith(
                    color: Colors.black,
                  )),
            ),
            Padding(
                padding: const EdgeInsets.only(left: 30, top: 15),
                child: Container(
                  width: 340,
                  padding: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border:
                          Border.all(color: Colors.grey.shade400, width: 1.0)),
                  child: const Text('Yey, Ijat dapet promo BPJS 50%'),
                )),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 5),
              child: Text('14.46',
                  style: blackFont14.copyWith(
                    color: Colors.black,
                  )),
            ),
            Padding(
                padding: const EdgeInsets.only(left: 30, top: 15),
                child: Container(
                  width: 340,
                  padding: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border:
                          Border.all(color: Colors.grey.shade400, width: 1.0)),
                  child: const Text(
                      'Masa berlaku promo kamu akan segera habis nih. Yuk pakai sekarang!'),
                )),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 5),
              child: Text('14.46',
                  style: blackFont14.copyWith(
                    color: Colors.black,
                  )),
            ),
            Padding(
                padding: const EdgeInsets.only(left: 30, top: 15),
                child: Container(
                  width: 340,
                  padding: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border:
                          Border.all(color: Colors.grey.shade400, width: 1.0)),
                  child: const Text(
                      'Masa berlaku promo kamu akan segera habis nih. Yuk pakai sekarang!'),
                )),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 5),
              child: Text('14.46',
                  style: blackFont14.copyWith(
                    color: Colors.black,
                  )),
            ),
            Padding(
                padding: const EdgeInsets.only(left: 30, top: 15),
                child: Container(
                  width: 340,
                  padding: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border:
                          Border.all(color: Colors.grey.shade400, width: 1.0)),
                  child:
                      const Text('Ada promo Token Listrik s/d Rp 500.000 nih!'),
                )),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 5),
              child: Text('14.46',
                  style: blackFont14.copyWith(
                    color: Colors.black,
                  )),
            ),
            Padding(
                padding: const EdgeInsets.only(left: 30, top: 15),
                child: Container(
                  width: 340,
                  padding: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border:
                          Border.all(color: Colors.grey.shade400, width: 1.0)),
                  child:
                      const Text('Ada promo Token Listrik s/d Rp 500.000 nih!'),
                )),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 5),
              child: Text('14.46',
                  style: blackFont14.copyWith(
                    color: Colors.black,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
