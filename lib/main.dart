import 'package:capstone_flutter/view/screen/splash_screen/splash_screen.dart';
import 'package:capstone_flutter/view_model/bpjs_provider/bpjs_provider.dart';
import 'package:capstone_flutter/view_model/pin_provider/pin_provider.dart';
import 'package:capstone_flutter/view_model/pulsa_paketdata/paket_data_v2_view_model.dart';
import 'package:capstone_flutter/view_model/pulsa_paketdata/pulsa_v2_view_model.dart';
import 'package:capstone_flutter/view_model/token_dan_tagihan_listrik/tagihan_listrik/tagihan_listrik_view_model.dart';
import 'package:capstone_flutter/view_model/token_dan_tagihan_listrik/tagihan_listrik_provider.dart';
import 'package:capstone_flutter/view_model/token_dan_tagihan_listrik/token_listrik_provider.dart';
import 'package:capstone_flutter/view_model/topup_provider/topup_provider.dart';
import 'package:capstone_flutter/view_model/user_provider/user_provider.dart';
import 'package:capstone_flutter/view_model/wifi_provider/wifi_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'view_model/pulsa_paketdata/pulsa_paket_data_view_model.dart';
import 'view_model/user_provider/user_update_image_provider.dart';

void main() {
  if (kReleaseMode) {
    debugPrint = (String? message, {int? wrapWidth}) {};
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => PinProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => PulsaDanPaketDataViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => WiFiInquiryProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => TopUpProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => UserUpdateImageProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => TagihanListrikInquiryProvider(),
        ),
        ChangeNotifierProvider(create: (_) => PulsaV2ViewModel()),
        ChangeNotifierProvider(create: (_) => PaketDataV2ViewModel()),
        ChangeNotifierProvider(create: (_) => BpjsProvider()),
        ChangeNotifierProvider(create: (_) => TagihanListrikProvider()),
        ChangeNotifierProvider(create: (_) => TokenListrikProvider()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 900),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'SkuyPay App',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            initialRoute: "/",
            routes: {
              "/": (context) => const SplashScreen(),
            },
          );
        },
      ),
    );
  }
}
