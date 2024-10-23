import 'package:capstone_flutter/view/screen/promo_screen/promo_details_screen.dart';
import 'package:flutter/material.dart';

import '../../../utils/const/theme.dart';

class AllPromoScreen extends StatefulWidget {
  const AllPromoScreen({super.key});

  @override
  State<AllPromoScreen> createState() => _AllPromoScreenState();
}

class _AllPromoScreenState extends State<AllPromoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        title: Text(
          'Promo',
          style: blackFont20.copyWith(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Center(
                child: GestureDetector(
                  onTap: () {},
                  child: const Image(
                    image: AssetImage('assets/promo_1.png'),
                    fit: BoxFit.contain,
                    width: 350,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PromoDetails()));
                  },
                  child: const Image(
                    image: AssetImage('assets/promo_2.png'),
                    fit: BoxFit.contain,
                    width: 350,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Center(
                child: GestureDetector(
                  onTap: () {},
                  child: const Image(
                    image: AssetImage('assets/promo_3.png'),
                    fit: BoxFit.contain,
                    width: 350,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Center(
                child: GestureDetector(
                  onTap: () {},
                  child: const Image(
                    image: AssetImage('assets/promo_4.png'),
                    fit: BoxFit.contain,
                    width: 350,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Center(
                child: GestureDetector(
                  onTap: () {},
                  child: const Image(
                    image: AssetImage('assets/promo_5.png'),
                    fit: BoxFit.contain,
                    width: 350,
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
