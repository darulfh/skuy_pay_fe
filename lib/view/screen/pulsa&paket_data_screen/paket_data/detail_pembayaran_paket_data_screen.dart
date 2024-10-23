import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../../../models/pulsa_paket_data.dart';
import '../../../../utils/const/theme.dart';
import '../../../../view_model/pulsa_paketdata/pulsa_paket_data_view_model.dart';
import 'metode_pembayaran_paket_data_screen.dart';

class DetailPembayaranPaketDataScreen extends StatefulWidget {
  final String token;
  const DetailPembayaranPaketDataScreen({super.key, required this.token});

  @override
  State<DetailPembayaranPaketDataScreen> createState() =>
      _DetailPembayaranPaketDataScreenState();
}

class _DetailPembayaranPaketDataScreenState
    extends State<DetailPembayaranPaketDataScreen> {
  TextEditingController promoController = TextEditingController();

  @override
  void dispose() {
    promoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pulsaPaketDataProvider =
        Provider.of<PulsaDanPaketDataViewModel>(context);
    debugPrint(pulsaPaketDataProvider.selectPaketData?.toJson().toString());
    return Consumer<PulsaDanPaketDataViewModel>(
      builder: (context, paketDataProvider, _) {
        final paketData = paketDataProvider.paketData;
        // int index = 0;
        // String price = paketDataProvider.paketData[index].price.toString();

        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text(
              'Rincian Pembayaran',
              style: blackFont18.copyWith(color: Colors.black),
            ),
            iconTheme: const IconThemeData(color: Colors.black),
            backgroundColor: Colors.white,
            centerTitle: true,
            elevation: 0,
          ),
          // ignore: unnecessary_null_comparison
          body: paketData == null
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 16),
                        Center(
                          child: Image.asset(
                            'assets/images/ic_telkomsel.png',
                            width: 132,
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Text(
                          'Kode Promo',
                          style:
                              blackFont14.copyWith(fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 1.51,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: Colors.grey),
                              ),
                              child: TextField(
                                controller: promoController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintStyle:
                                      blackFont12.copyWith(color: Colors.grey),
                                  hintText: 'CONTOH: PROMOINGAZI',
                                ),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 5.3,
                              height: 52,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: blueColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                onPressed: () {},
                                child: Text(
                                  'Klaim',
                                  style: whiteFont14,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Container(
                          width: double.infinity,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.amber[100],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Icon(
                                  Icons.warning_amber_outlined,
                                  size: 15,
                                  color: Colors.amber,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Silahkan masukkan kode promo yang kamu punya',
                                  style: blackFont12.copyWith(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 10),
                                ),
                                const Spacer(),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 240,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 10, top: 10, bottom: 15, right: 15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 5, right: 5),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Produk',
                                        style: blackFont12.copyWith(
                                            fontWeight: FontWeight.w400),
                                      ),
                                      Text(
                                        pulsaPaketDataProvider
                                                .selectPaketData?.code ??
                                            "",
                                        style: blackFont12.copyWith(
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black
                                            .withOpacity(0.1), // Warna shadow
                                        spreadRadius: 2, // Penyebaran shadow
                                        blurRadius: 4, // Jarak blur shadow
                                        offset: const Offset(0,
                                            2), // Posisi offset shadow (x, y)
                                      ),
                                    ],
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: Colors.white,
                                    ),
                                    color: Colors.white,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, top: 8, right: 15),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Rincian Paket',
                                              style: blackText13,
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 8),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                pulsaPaketDataProvider
                                                        .selectPaketData
                                                        ?.description ??
                                                    "",
                                                style: blackFont12.copyWith(
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 5, top: 8, right: 5),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'No. Handphone',
                                        style: blackFont12.copyWith(
                                            fontWeight: FontWeight.w400),
                                      ),
                                      Text(
                                        pulsaPaketDataProvider
                                                .selectPaketData?.phone62 ??
                                            "",
                                        style: blackFont12.copyWith(
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 5, top: 8, right: 5),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Harga',
                                        style: blackFont12.copyWith(
                                            fontWeight: FontWeight.w400),
                                      ),
                                      Text(
                                        // 'Rp.${pulsaPaketDataProvider.selectPaketData?.price.toString() ?? ""}',
                                        'Rp. ${NumberFormat('#,###', 'id_ID').format(pulsaPaketDataProvider.selectPaketData?.price.toInt() ?? "")}',
                                        style: blackFont12.copyWith(
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  child: Divider(
                                    color: Colors.grey,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(5, 0, 5, 5),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      // color: Colors.green[100],
                                      color: const Color(0xffBADDB1),
                                    ),
                                    width: MediaQuery.of(context).size.width,
                                    height: 34,
                                    child: Center(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 12),
                                            child: Text(
                                              'Total tagihan',
                                              style: blackFont12.copyWith(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 12),
                                            child: Text(
                                              // 'Rp.${pulsaPaketDataProvider.selectPaketData?.price.toString() ?? ""}',
                                              'Rp. ${NumberFormat('#,###', 'id_ID').format(pulsaPaketDataProvider.selectPaketData?.price.toInt() ?? "")}',
                                              style: blackFont14.copyWith(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
          bottomNavigationBar: Padding(
            padding:
                const EdgeInsets.only(bottom: 30, left: 24, right: 24, top: 10),
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
                  List<PulsaPaketdataData> users =
                      pulsaPaketDataProvider.paketData;
                  int index =
                      0; // Ganti dengan indeks yang sesuai dengan kebutuhan Anda
                  String providerText =
                      users.isNotEmpty ? users[index].provider : '';
                  String nameText = users.isNotEmpty ? users[index].name : '';
                  String descriptionText =
                      users.isNotEmpty ? users[index].description : '';
                  String codeText = users.isNotEmpty ? users[index].code : '';
                  // String priceText =
                  //     users.isNotEmpty ? users[index].price.toString() : '';
                  double priceText =
                      users.isNotEmpty ? users[index].price : 0.0;
                  String typeText = users.isNotEmpty ? users[index].type : '';
                  String idText = users.isNotEmpty ? users[index].id : '';
                  String phoneNumber =
                      pulsaPaketDataProvider.selectPaketData?.phone62 ?? "";
                  // String adminFeeText =
                  //     users.isNotEmpty ? users[index].adminFee.toString() : '';
                  double adminFeeText;
                  if (users.isNotEmpty) {
                    adminFeeText = users[index].adminFee;
                  } else {
                    adminFeeText = 0.0;
                  }
                  DateTime? createdAtText =
                      users.isNotEmpty ? users[index].createdAt : null;
                  // users.isNotEmpty ? users[index].adminFee.toString() : '';

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MetodePembayaranPaketDataScreen(
                        id: idText,
                        name: nameText,
                        type: typeText,
                        code: codeText,
                        provider: providerText,
                        description: descriptionText,
                        price: priceText,
                        adminFee: adminFeeText,
                        createdAt: createdAtText!,
                        token: widget.token,
                        phoneNumber: phoneNumber,
                      ),
                    ),
                  );
                },
                child: Text(
                  'Lanjutkan',
                  style: whiteFont14,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
