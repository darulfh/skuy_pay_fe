import 'package:capstone_flutter/utils/extension/string_extension.dart';
import 'package:capstone_flutter/view/screen/home_screen/widgets/home_screen_appbar.dart';
import 'package:capstone_flutter/view/screen/home_screen/widgets/home_screen_card.dart';
import 'package:capstone_flutter/view/screen/home_screen/widgets/home_screen_ppob.dart';
import 'package:capstone_flutter/view/screen/profile_screen/profile_screen.dart';
import 'package:capstone_flutter/view/v2/bpjs/bpjs_detail_v2.dart';
import 'package:capstone_flutter/view/v2/tagihan_listrik/tagihan_listrik_detail_v2.dart';
import 'package:capstone_flutter/view/v2/token_listrik/token_listrik_v2_view.dart';
import 'package:capstone_flutter/view_model/bpjs_provider/bpjs_provider.dart';
import 'package:capstone_flutter/view_model/token_dan_tagihan_listrik/tagihan_listrik_provider.dart';
import 'package:capstone_flutter/view_model/token_dan_tagihan_listrik/token_listrik_provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../models/apis/pin.dart';
import '../../../utils/const/theme.dart';
import '../../../view_model/pin_provider/pin_provider.dart';
import '../../../view_model/user_provider/user_provider.dart';
import '../../../view_model/wifi_provider/wifi_provider.dart';
import '../billing_history_screen/billing_history_screen.dart';
import '../pin_screen/input_pin_screen.dart';
import '../promo_screen/all_promo_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final List<String> imageList = [
  'assets/promo_1.png',
  'assets/promo_2.png',
  'assets/promo_3.png',
  'assets/promo_4.png',
  'assets/promo_5.png',
];

List<String> months = [
  'Januari',
  'Februari',
  'Maret',
  'April',
  'Mei',
  'Juni',
  'Juli',
  'Agustus',
  'September',
  'Oktober',
  'November',
  'Desember'
];

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  bool isPinCreated = false;
  bool isPinAdded = false;
  late SharedPreferences _prefs;
  String? selectedMonth;
  String token = '';
  TabController? _tabController;
  TextEditingController pelangganControllerToken = TextEditingController();
  TextEditingController pelangganControllerTagihanListrik =
      TextEditingController();
  TextEditingController pelangganControllerBpjs = TextEditingController();
  TextEditingController pelangganControllerWifi = TextEditingController();

  TextEditingController tagihanListrikController = TextEditingController();
  TextEditingController tokenListrikController = TextEditingController();

  // GlobalKey transferKey = GlobalKey();
  // GlobalKey topupKey = GlobalKey();
  // GlobalKey ppdKey = GlobalKey();
  // GlobalKey bpjsKey = GlobalKey();
  // GlobalKey plnKey = GlobalKey();
  // GlobalKey wifiKey = GlobalKey();
  // GlobalKey pdamKey = GlobalKey();
  // GlobalKey pendidikanKey = GlobalKey();
  // GlobalKey promoKey = GlobalKey();

  @override
  void dispose() {
    super.dispose();
    pelangganControllerBpjs.dispose();
    _tabController?.dispose();
    pelangganControllerToken.dispose();
    pelangganControllerTagihanListrik.dispose();
    pelangganControllerWifi.dispose();
    tagihanListrikController.dispose();
    tokenListrikController.dispose();
  }

  @override
  void initState() {
    super.initState();
    bool ispinAdded = context.read<PinProvider>().ispinAdded;

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      context.read<UserProvider>().getUserProfile();
      await initializeData(); // Panggil fungsi untuk inisialisasi data
      bool pinStatus = await checkPinStatus(token);
      setState(() {
        isPinCreated = pinStatus;
      });

      if (!isPinCreated) {
        Future.delayed(const Duration(seconds: 1), () {
          _showModalBottomSheetCreatePin();
        });
      }
      // ignore: avoid_print
      print('isPinCreated: $isPinCreated\nispinAdded: $ispinAdded');
      if (isPinCreated && ispinAdded) {
        // ignore: avoid_print
        print('_showModalBottomSheetPinAdded');
        _showModalBottomSheetPinAdded();
      }
    });
    _tabController = TabController(length: 2, vsync: this);
  }

  Future<void> initializeData() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      token = _prefs.getString('token') ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      body: Consumer<UserProvider>(
        builder: (context, userProvider, _) {
          final username = userProvider.name;
          final phoneNumber = userProvider.phone;
          final myBalance = userProvider.balance;

          return RefreshIndicator(
            onRefresh: () async {
              context.read<UserProvider>().getUserProfile();
            },
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  Row(
                    children: [
                      Stack(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: AspectRatio(
                              aspectRatio: 17 / 11,
                              child: Image.asset(
                                'assets/motif_berwarna.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          HomeScreenAppbar(
                            image: userProvider.image,
                            username: username,
                            phoneNumber: phoneNumber,
                          ),
                          HomeScreenCard(
                            myBalance: myBalance,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 345),
                            child: Container(
                              height: MediaQuery.of(context).size.height / 4,
                              width: MediaQuery.of(context).size.width,
                              padding: const EdgeInsets.only(top: 25),
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.18),
                                      spreadRadius: 1,
                                      blurRadius: 9,
                                      offset: const Offset(0, -8)),
                                ],
                                color: Colors.white,
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(22),
                                  topRight: Radius.circular(22),
                                ),
                              ),
                            ),
                          ),
                          HomeScreenPpob(
                            wifi: () {
                              _showModalBottomSheetWifi();
                            },
                            bpjs: () {
                              _showModalBottomSheetBpjs(context);
                            },
                            tagihanListrik: () {
                              _showModalBottomSheetToken(context, false);
                            },
                            tokenListrik: () {
                              _showModalBottomSheetToken(context, true);
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 570, left: 30),
                            child: Text(
                              'Promo',
                              style: whiteFont16M.copyWith(
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Positioned(
                            // padding: const EdgeInsets.only(top: 555, left: 200),
                            top: 570,
                            right: 30,
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const AllPromoScreen()));
                              },
                              child: Row(
                                children: [
                                  Text(
                                    'Lihat Semua',
                                    style: whiteFont14.copyWith(
                                      color: const Color(0xFF2B3990),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  const Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    color: Color(0xFF2B3990),
                                    size: 16,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  CarouselSlider.builder(
                    options: CarouselOptions(
                      enlargeCenterPage: false,
                      enableInfiniteScroll: true,
                      height: 160,
                      aspectRatio: 16 / 9,
                      scrollDirection: Axis.horizontal,
                      // scrollPhysics: const NeverScrollableScrollPhysics(),
                      viewportFraction: 0.9,
                      pauseAutoPlayOnTouch: true,
                      autoPlayAnimationDuration: const Duration(seconds: 1),
                      autoPlay: true,
                    ),
                    itemCount: imageList.length,
                    itemBuilder: (context, i, id) {
                      return GestureDetector(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            imageList[i],
                            width: 340,
                            fit: BoxFit.contain,
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const AllPromoScreen()));
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _showModalBottomSheetToken(BuildContext context, bool isTokenListrik) {
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
        final tagihanListrikProvider =
            context.watch<TagihanListrikProvider>().state;
        final tokenListrikProvider =
            context.watch<TokenListrikProvider>().state;

        return SingleChildScrollView(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context)
                .viewInsets
                .bottom, // Adjust bottom padding based on keyboard height
          ),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ' No. Pelanggan',
                    style: blackFont14.copyWith(fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 24),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.black),
                    ),
                    child: TextField(
                      controller: isTokenListrik
                          ? tokenListrikController
                          : tagihanListrikController,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintStyle: blackFont12.copyWith(color: Colors.grey),
                        hintText: 'Masukkan No Pelanggan',
                      ),
                      onChanged: (value) {
                        if (isTokenListrik) {
                          context
                              .read<TokenListrikProvider>()
                              .setCustomerId(value);
                        } else {
                          context
                              .read<TagihanListrikProvider>()
                              .setCustomerId(value);
                        }
                      },
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
                        onPressed: () async {
                          if (isTokenListrik) {
                            if (tokenListrikProvider == Status.loading) return;

                            context
                                .read<TokenListrikProvider>()
                                .postInquiry()
                                .then((value) {
                              if (value) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const TokenListrikV2View()));
                              }
                            });
                          } else {
                            if (tagihanListrikProvider == Status.loading) {
                              return;
                            }
                            context
                                .read<TagihanListrikProvider>()
                                .postInquiry()
                                .then((value) {
                              if (value) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const TagihabListrikDetailV2View()));
                              }
                            });
                          }
                        },
                        child: (isTokenListrik &&
                                tokenListrikProvider == Status.loading)
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : (!isTokenListrik &&
                                    tagihanListrikProvider == Status.loading)
                                ? const Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : Text(
                                    'Lanjutkan',
                                    style: whiteFont14.copyWith(
                                        color: Colors.white),
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

  void _showModalBottomSheetBpjs(BuildContext context) {
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
        final bpjs = context.watch<BpjsProvider>();
        return StatefulBuilder(builder: (context, StateSetter setState) {
          return SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context)
                  .viewInsets
                  .bottom, // Adjust bottom padding based on keyboard height
            ),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 350,
              // height: MediaQuery.of(context).size.height / 2.7,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 20, 15, 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        'BPJS Kesehatan',
                        style: blackText24.copyWith(fontSize: 18),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'No. Pelanggan',
                      style: blackFont14.copyWith(fontWeight: FontWeight.w500),
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
                        controller: pelangganControllerBpjs,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintStyle: blackFont12,
                          hintText: 'Masukkan No Pelanggan',
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Periode',
                      style: blackFont14.copyWith(fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.black),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          isExpanded: true,
                          value: selectedMonth,
                          hint: Text(
                            'Pilih Bulan',
                            style: blackFont12,
                          ),
                          onChanged: (value) {
                            setState(() {
                              selectedMonth = value!;
                            });
                          },
                          items: months.map((String month) {
                            return DropdownMenuItem<String>(
                              value: month,
                              child: Text(
                                month,
                                style: blackFont12,
                              ),
                            );
                          }).toList(),
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
                          onPressed: () async {
                            if (pelangganControllerBpjs.text.isEmpty) {
                              Fluttertoast.showToast(
                                msg: "No pelanggan tidak boleh kosong",
                                textColor: Colors.white,
                                backgroundColor: Colors.red,
                              );
                              return;
                            }
                            if (selectedMonth.monthToInt() == 0) {
                              Fluttertoast.showToast(
                                msg: "Pilih Periode Bulan",
                                textColor: Colors.white,
                                backgroundColor: Colors.red,
                              );
                              return;
                            }

                            context
                                .read<BpjsProvider>()
                                .postInquiry(
                                    id: pelangganControllerBpjs.text,
                                    month: selectedMonth.monthToInt())
                                .then((value) {
                              if (value) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const BpjsDetailV2View()));
                              }
                            });
                          },
                          child: bpjs.state == Status.loading
                              ? const Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                )
                              : Text(
                                  'Lanjutkan',
                                  style:
                                      whiteFont14.copyWith(color: Colors.white),
                                ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
      },
    );
  }

  void _showModalBottomSheetWifi() {
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
        final wifiProvider =
            Provider.of<WiFiInquiryProvider>(context, listen: false);

        return SingleChildScrollView(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 250,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 20, 15, 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'WIFI',
                      style: blackText16.copyWith(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'No. Pelanggan',
                    style: blackFont14.copyWith(fontWeight: FontWeight.w400),
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
                      controller: pelangganControllerWifi,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintStyle: blackFont12.copyWith(color: Colors.grey),
                        hintText: 'Masukkan No Pelanggan',
                      ),
                    ),
                  ),
                  Expanded(
                      child:
                          SizedBox(height: MediaQuery.of(context).size.height)),
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
                        onPressed: () async {
                          await wifiProvider.handleInquiry(
                            pelangganControllerWifi.text,
                            token,
                            context,
                            pelangganControllerWifi,
                          );
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

  void _showModalBottomSheetCreatePin() {
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
          height: 290,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 20, 24, 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    'assets/create_pin.png',
                    scale: 4,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(
                    'Buat Kode PIN Kamu Dulu Yuk!',
                    style: blackText16,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(
                    'Dengan membuat kode PIN Anda dapat meningkatkan keamanan akun.',
                    textAlign: TextAlign.center,
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
                                builder: (context) => const InputPinScreen()));
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

  void _showModalBottomSheetPinAdded() {
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
                        context.read<PinProvider>().changePin(false);
                        setState(() {
                          isPinAdded = true;
                        });
                        Navigator.pop(context);
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

class NavBar extends StatefulWidget {
  final int initialIndex;
  const NavBar({super.key, required this.initialIndex});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _selectedIndex = 0;

  List<Widget> _pages = [];

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
    _pages = [
      const HomeScreen(),
      const BillingHistory(),
      const ProfileScreen(),
    ];
  }

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color(0xFF591CD1),
        currentIndex: _selectedIndex,
        onTap: _navigateBottomBar,
        type: BottomNavigationBarType.fixed,
        iconSize: 26,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: 'Beranda'),
          BottomNavigationBarItem(
              icon: Icon(Icons.history_outlined), label: 'Riwayat Tagihan'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: 'Akun'),
        ],
      ),
    );
  }
}
