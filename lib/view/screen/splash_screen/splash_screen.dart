import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/const/theme.dart';
import '../home_screen/home_screen.dart';
import '../onboarding_screen/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  void checkLogin() async {
    final prefs = await SharedPreferences.getInstance();
    bool newUser = prefs.getBool('login') ?? true;

    if (newUser == false) {
      Timer(
        const Duration(seconds: 2),
        () {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const NavBar(initialIndex: 0),
              ),
              (route) => false);
        },
      );
    } else {
      Timer(
        const Duration(seconds: 2),
        () {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: ((context) => const OnboardingScreen()),
              ),
              (route) => false);
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/ic_logo_skuypay.png',
                width: 210.w,
                height: 299.w,
              ),
              Text(
                'SkuyPay',
                style: GoogleFonts.roboto(
                  color: const Color(0xff2B3990),
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 150,
              ),
              Text(
                'SkuyPay memiliki lisensi dan diawasi oleh Otoritas',
                style: blackFont16.copyWith(color: Colors.grey, fontSize: 14),
              ),
              Text(
                'Jasa Keuangan (OJK) dan merupakan anggota',
                style: blackFont16.copyWith(color: Colors.grey, fontSize: 14),
              ),
              Text(
                'Lembaga Penjamin Simpanan (LPS).',
                style: blackFont16.copyWith(color: Colors.grey, fontSize: 14),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 134,
                height: 30,
                child: Image.asset('assets/images/ic_logo_bawah.png'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
