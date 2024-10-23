// ignore_for_file: use_build_context_synchronously

import 'package:capstone_flutter/view/screen/home_screen/home_screen.dart';
import 'package:capstone_flutter/view/screen/login_screen/login_screen.dart';
import 'package:capstone_flutter/view/screen/register_screen/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../utils/const/theme.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  final List<String> imagePaths = [
    'assets/images/ic_onboarding1.png',
    'assets/images/ic_onboarding2.png',
    'assets/images/ic_onboarding3.png',
  ];

  final List<String> titles = [
    'Teman yang memudahkan',
    'Aman dan Terpercaya',
    'Kini semuanya dalam satu genggaman',
  ];

  final List<String> descriptions = [
    'Sekarang Skuypay bisa menjadi teman\nanda dalam mengatur tagihan anda.',
    'Skuypay sudah melakukan tahapan pengujian\nkeamanan oleh tim hacker internasional',
    'Lebih mudah dalam melakukan semua pembayaran\nserta aman dan terintegrasi',
  ];

  // untuk skip onbording ke register
  _storeOnboardingInfo() async {
    // print('Shared pref called');
    int isViewed = 2;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('onBoard', isViewed);
    // print(prefs.getInt('onBoard'));
  }

  late SharedPreferences _prefs;
  late bool newUser;

  @override
  void initState() {
    super.initState();
    // checkLogin();
  }

  void checkLogin() async {
    _prefs = await SharedPreferences.getInstance();
    newUser = _prefs.getBool('login') ?? true;

    if (newUser == false) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const NavBar(initialIndex: 0),
          ),
          (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              itemCount: imagePaths.length,
              itemBuilder: (BuildContext context, int index) {
                return buildOnboardingItem(
                  imagePaths[index],
                  titles[index],
                  descriptions[index],
                  index,
                );
              },
            ),
          ),
          // const SizedBox(height: 20),
          buildPageIndicator(),
          SizedBox(height: 20.w),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            width: double.infinity.w,
            height: 52.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.w),
            ),
            child: _currentPage == 2
                ? ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: blueColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.w),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => const RegisterScreen(),
                        ),
                        (route) => false,
                      );
                    },
                    child: Text(
                      'Daftar',
                      style: whiteFont14.copyWith(color: Colors.white),
                    ),
                  )
                : Container(),
          ),
          if (_currentPage == 2)
            Padding(
              padding: EdgeInsets.only(
                top: 20.w,
                bottom: 20.w,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Sudah punya akun? ',
                    style: blackFont16.copyWith(
                      fontSize: 12.sp,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                    child: Text(
                      'Masuk',
                      style: blackFont16.copyWith(
                        fontSize: 12.sp,
                        color: blueColor,
                      ),
                    ),
                  ),
                ],
              ),
            )
        ],
      ),
    );
  }

  Widget buildOnboardingItem(
      String imagePath, String title, String description, int index) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 380,
          child: Stack(
            children: [
              Image.asset(imagePath),
              Positioned(
                top: 52.w,
                right: 26.w,
                child: index < 2
                    ? TextButton(
                        onPressed: () {
                          /// skip onboarding -> daftar
                          _storeOnboardingInfo();
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const RegisterScreen(),
                            ),
                          );
                        },
                        child: Text('Lewati',
                            style: blackFont16.copyWith(
                              color: index == 0 ? Colors.white : Colors.black,
                            )))
                    : Container(),
              ),
            ],
          ),
        ),
        SizedBox(height: 57.w),
        Text(
          title,
          style: blackFont18,
        ),
        SizedBox(height: 24.w),
        Text(
          description,
          style: blackFont14.copyWith(fontWeight: FontWeight.w500),
          textAlign: TextAlign.center,
        ),
        // SizedBox(height: 100.w),
      ],
    );
  }

  Widget buildPageIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        imagePaths.length,
        (index) => buildIndicator(index),
      ),
    );
  }

  Widget buildIndicator(int index) {
    double size = 10.0.w;
    bool isCurrentPage = index == _currentPage;
    return Container(
      width: size,
      height: size,
      margin: EdgeInsets.symmetric(horizontal: 4.w),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isCurrentPage ? blueColor : Colors.grey,
      ),
    );
  }
}
