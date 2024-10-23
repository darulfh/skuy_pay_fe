import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../utils/const/theme.dart';
import 'metode_pembayaran_tagihan_listrik_screen.dart';

class DetailPembayaranTagihanListrik extends StatefulWidget {
  final String id;
  final String userId;
  final String pelangganData;
  final DateTime createdAt;
  final String providerName;
  final double price;
  final double adminFee;
  final String customerName;
  final int elecricalPower;

  const DetailPembayaranTagihanListrik({
    super.key,
    required this.id,
    required this.userId,
    required this.pelangganData,
    required this.createdAt,
    required this.providerName,
    required this.price,
    required this.adminFee,
    required this.customerName,
    required this.elecricalPower,
  });

  @override
  State<DetailPembayaranTagihanListrik> createState() =>
      _DetailPembayaranTagihanListrikState();
}

class _DetailPembayaranTagihanListrikState
    extends State<DetailPembayaranTagihanListrik> {
  TextEditingController pelangganController = TextEditingController();
  TextEditingController promoController = TextEditingController();

  late SharedPreferences _prefs;
  String token = '';
  bool isLoading = true;

  Future<void> initializeData() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      token = _prefs.getString('token') ?? '';
      // ignore: avoid_print
      print(token);
    });
  }

  @override
  void initState() {
    super.initState();
    initializeData();
    pelangganController.text = widget.pelangganData;
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pelangganController.dispose();
    promoController.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              Text(
                'No. Pelanggan',
                style: blackFont12.copyWith(fontWeight: FontWeight.w400),
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
                    hintStyle: blackFont12,
                    hintText: '0000 2984 0368',
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                'Kode Promo',
                style: blackFont14.copyWith(fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 1.51,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: TextField(
                      controller: promoController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintStyle: blackFont12.copyWith(color: Colors.grey),
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
                      onPressed: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => const PaymentDetail()));
                      },
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
                            fontWeight: FontWeight.w400, fontSize: 10),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Container(
                      width: MediaQuery.of(context).size.width,
                      height: 340,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 10, top: 15, bottom: 15, right: 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                'DETAIL PEMBAYARAN',
                                style: blackFont12.copyWith(
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Divider(
                                color: Colors.grey,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, top: 5, right: 15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Tanggal',
                                    style: blackFont12.copyWith(
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Text(
                                    DateFormat('dd-MM-yyyy')
                                        .format(widget.createdAt),
                                    // '04-05-2023',
                                    style: blackFont12.copyWith(
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, top: 15, right: 15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Penyedia Layanan',
                                    style: blackFont12.copyWith(
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Text(
                                    widget.providerName.toUpperCase(),
                                    // 'PLN Tagihan',
                                    style: blackFont12.copyWith(
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, top: 15, right: 15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'No. Meter',
                                    style: blackFont12.copyWith(
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Text(
                                    pelangganController.text,
                                    style: blackFont12.copyWith(
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, top: 15, right: 15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'No. Pelanggan',
                                    style: blackFont12.copyWith(
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Text(
                                    pelangganController.text,
                                    // '0000 2984 0368',
                                    style: blackFont12.copyWith(
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, top: 15, right: 15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Nama',
                                    style: blackFont12.copyWith(
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Text(
                                    widget.customerName.toUpperCase(),
                                    // 'Ijat Sutresno',
                                    style: blackFont12.copyWith(
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, top: 15, right: 15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Tarif/Daya',
                                    style: blackFont12.copyWith(
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Text(
                                    'R1/${widget.elecricalPower.toString()} VA',
                                    style: blackFont12.copyWith(
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, top: 15, right: 15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Nominal',
                                    style: blackFont12.copyWith(
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Text(
                                    // 'Rp.${widget.price.toString()}',
                                    'Rp. ${NumberFormat('#,###', 'id_ID').format(widget.price.toInt())}',
                                    // 'Rp 70.000',
                                    style: blackFont12.copyWith(
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, top: 15, right: 15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Biaya Admin',
                                    style: blackFont12.copyWith(
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Text(
                                    // 'Rp.${widget.adminFee.toString()}',
                                    'Rp. ${NumberFormat('#,###', 'id_ID').format(widget.adminFee.toInt())}',
                                    // 'Rp 2.500',
                                    style: blackFont12.copyWith(
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Divider(
                                color: Colors.grey,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 5),
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
                                            horizontal: 15),
                                        child: Text(
                                          'Total',
                                          style: blackFont12.copyWith(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15),
                                        child: Text(
                                          // 'Rp.${(widget.price + widget.adminFee).toString()}',
                                          'Rp. ${NumberFormat('#,###', 'id_ID').format(widget.adminFee + widget.price.toInt())}',
                                          // 'Rp 72.500',
                                          style: blackFont12.copyWith(
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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MetodePembayaranTagihanScreen(
                    id: widget.id,
                    customerName: widget.customerName,
                    providerName: widget.providerName,
                    elecricalPower: widget.elecricalPower,
                    price: widget.price,
                    adminFee: widget.adminFee,
                    createdAt: widget.createdAt,
                    pelangganData: pelangganController.text,
                    userId: widget.userId,
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
  }
}
