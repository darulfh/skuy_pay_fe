import 'package:capstone_flutter/view/screen/billing_history_screen/transaction_history_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../models/apis/history.dart';
import '../../../models/apis/login.dart';
import '../../../models/history_model.dart';
import '../../../utils/const/theme.dart';

class BillingHistory extends StatefulWidget {
  const BillingHistory({super.key});

  @override
  State<BillingHistory> createState() => _BillinngHistoryState();
}

class _BillinngHistoryState extends State<BillingHistory> {
  // ignore: unused_field
  final int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          title: Text(
            'Riwayat Transaksi',
            style: blackFont20.copyWith(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 0,
        ),
        body: Column(
          children: [
            TabBar(
              indicatorColor: Colors.black,
              tabs: [
                Tab(
                  child: Text(
                    'Proses',
                    style: blackFont16.copyWith(color: Colors.black),
                  ),
                ),
                Tab(
                  child: Text(
                    'Selesai',
                    style: blackFont16.copyWith(color: Colors.black),
                  ),
                ),
              ],
            ),
            const Expanded(
              child: TabBarView(children: [
                ProcessScreen(),
                CompletedScreen(),
              ]),
            )
          ],
        ),
      ),
    );
  }
}

class ProcessScreen extends StatefulWidget {
  const ProcessScreen({super.key});

  @override
  State<ProcessScreen> createState() => _ProcessScreenState();
}

class _ProcessScreenState extends State<ProcessScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    context: context,
                    builder: (context) => const SortScreen(),
                  );
                },
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 25, left: 50),
                      child: Image(
                        image: AssetImage('assets/sort_icon.png'),
                        width: 30,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 25, left: 15),
                      child: Text(
                        'Urutkan',
                        style: blackFont16.copyWith(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                        ),
                        context: context,
                        builder: (context) => const FilterScreen(),
                      );
                    },
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 25, left: 105),
                          child: Image(
                            image: AssetImage('assets/filter_icon.png'),
                            width: 28,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 25, left: 15),
                          child: Text(
                            'Filter',
                            style: blackFont16.copyWith(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: 70),
            child: Image(
              image: AssetImage('assets/transaction_picture.png'),
              width: 270,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              'Belum ada transaksi nih',
              style: blackFont20.copyWith(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}

class CompletedScreen extends StatefulWidget {
  const CompletedScreen({super.key});

  @override
  State<CompletedScreen> createState() => _CompletedScreenState();
}

class _CompletedScreenState extends State<CompletedScreen> {
  late List<Transaction> transactions;
  late Future<String> tokenFuture;
  @override
  void initState() {
    super.initState();
    tokenFuture = getToken();
  }

  Future<String> getToken() async {
    final loginController = LoginController();
    final token = await loginController.getToken();
    return token;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: tokenFuture,
      builder: (context, tokenSnapshot) {
        if (!tokenSnapshot.hasData) {
          return const Text('Token is empty');
        } else {
          final token = tokenSnapshot.data!;

          return FutureBuilder<List<Transaction>>(
            future: TransactionApi.fetchTransactions(token),
            builder: (context, transactionSnapshot) {
              if (transactionSnapshot.connectionState ==
                  ConnectionState.waiting) {
                return const Center(
                  child: SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(),
                  ),
                );
              } else if (transactionSnapshot.hasError) {
                return Text('Error: ${transactionSnapshot.error}');
              } else if (!transactionSnapshot.hasData) {
                return const Text('No transactions available');
              } else {
                final transactions = transactionSnapshot.data!;

                return Column(children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(20),
                              ),
                            ),
                            context: context,
                            builder: (context) => const SortScreen(),
                          );
                        },
                        child: Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 25, left: 50),
                              child: Image(
                                image: AssetImage('assets/sort_icon.png'),
                                width: 30,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 25, left: 15),
                              child: Text(
                                'Urutkan',
                                style:
                                    blackFont16.copyWith(color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20),
                                  ),
                                ),
                                context: context,
                                builder: (context) => const FilterScreen(),
                              );
                            },
                            child: Row(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(top: 25, left: 105),
                                  child: Image(
                                    image: AssetImage('assets/filter_icon.png'),
                                    width: 28,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 25, left: 15),
                                  child: Text(
                                    'Filter',
                                    style: blackFont16.copyWith(
                                        color: Colors.black),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  // child row kedua
                  HistoryWidget(transactions: transactions),
                ]);
              }
            },
          );
        }
      },
    );
  }
}

// ignore: camel_case_types
class HistoryWidget extends StatelessWidget {
  const HistoryWidget({
    super.key,
    required this.transactions,
  });

  final List<Transaction> transactions;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          final transaction = transactions[index];
          String imagePath = '';
          String namePath = '';
          if (transaction.productType == 'telkom') {
            imagePath = 'assets/wifi_icon.png';
            namePath = 'Wifi';
          } else if (transaction.productType == 'paket_data') {
            imagePath = 'assets/pulsa_icon.png';
            namePath = 'Paket Data';
          } else if (transaction.productType == 'bpjsks') {
            imagePath = 'assets/pulsa_icon.png';
            namePath = 'Bpjs';
          } else if (transaction.productType == 'pulsa') {
            imagePath = 'assets/pulsa_icon.png';
            namePath = 'Pulsa';
          } else if (transaction.productType == 'topup') {
            imagePath = 'assets/top_up_icon.png';
            namePath = 'Top Up';
          } else if (transaction.productType == 'plnpost') {
            imagePath = 'assets/pln_icon.png';
            namePath = 'Tagihan Listrik';
          } else if (transaction.productType == 'BPJS') {
            imagePath = 'assets/bpjs_icon.png';
            namePath = 'BPJS';
          } else if (transaction.productType == 'ELECTRICITY_TOKEN') {
            imagePath = 'assets/pln_icon.png';
            namePath = 'Tagihan Listrik';
          } else if (transaction.productType == 'ELECTRICITY_BILL') {
            imagePath = 'assets/pln_icon.png';
            namePath = 'Tagihan Listrik';
          }

          //zona waktu di lokasi saya GMT+7
          const timeZone = Duration(hours: 7);

          // parse dari string ke date time
          DateTime dateTime = DateTime.parse(transaction.createdAt);

          // mengubah zona waktu
          dateTime = dateTime.add(timeZone);

          // format final dalam gmt+7
          final formatDateTime =
              DateFormat('d MMMM yyyy - HH.mm').format(dateTime);

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      TransactionHistory(transaction: transaction),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 30, left: 24, right: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        imagePath,
                        width: 55,
                      ),
                      const SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            namePath,
                            style: blackFont16.copyWith(color: Colors.black),
                          ),
                          Text(
                            formatDateTime,
                            style: blackFont14.copyWith(color: Colors.black),
                          ),
                        ],
                      ),
                      const Spacer(),
                      if (transaction.price != 0 &&
                          transaction.status != 'unpaid' &&
                          transaction.productType != 'topup')
                        Text(
                          '- Rp. ${NumberFormat('#,###', 'id_ID').format(transaction.price)}',
                          style: blackFont16G.copyWith(color: redColor),
                        ),
                      if (transaction.price != 0 &&
                          transaction.status == 'unpaid')
                        Text(
                          'Gagal',
                          style: blackFont16G.copyWith(color: redColor),
                        ),
                      if (transaction.amount != 0)
                        Text(
                          '+ Rp. ${NumberFormat('#,###', 'id_ID').format(transaction.amount)}',
                          style: blackFont16G.copyWith(color: Colors.green),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class SortScreen extends StatefulWidget {
  const SortScreen({super.key});

  @override
  State<SortScreen> createState() => _SortScreenState();
}

class _SortScreenState extends State<SortScreen> {
  int _value = 1;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40, left: 20, bottom: 5),
                  child: Text(
                    'Urutkan',
                    style: blackFont16G.copyWith(color: Colors.black),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Radio(
                  value: 1,
                  groupValue: _value,
                  onChanged: (value) {
                    setState(() {
                      _value = value!;
                    });
                  },
                  activeColor: Colors.black,
                ),
                Text(
                  'Terbaru',
                  style: blackFont14.copyWith(color: Colors.black),
                ),
              ],
            ),
            Row(
              children: [
                Radio(
                  value: 2,
                  groupValue: _value,
                  onChanged: (value) {
                    setState(() {
                      _value = value!;
                    });
                  },
                  activeColor: Colors.black,
                ),
                Text(
                  'Terlama',
                  style: blackFont14.copyWith(color: Colors.black),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 10, left: 25, right: 25, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(14),
                        minimumSize: const Size(155, 20),
                        backgroundColor: blueColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    child: Text(
                      'Reset',
                      style: whiteFont16.copyWith(color: Colors.white),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(14),
                        minimumSize: const Size(155, 20),
                        backgroundColor: blueColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    child: Text(
                      'Tampilkan',
                      style: whiteFont16.copyWith(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FiltercreenState();
}

class _FiltercreenState extends State<FilterScreen> {
  int _value = 1;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40, left: 20, bottom: 5),
                  child: Text(
                    'Filter',
                    style: blackFont16G.copyWith(color: Colors.black),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Radio(
                  value: 1,
                  groupValue: _value,
                  onChanged: (value) {
                    setState(() {
                      _value = value!;
                    });
                  },
                  activeColor: Colors.black,
                ),
                Text(
                  'Semua',
                  style: blackFont14.copyWith(color: Colors.black),
                ),
              ],
            ),
            Row(
              children: [
                Radio(
                  value: 2,
                  groupValue: _value,
                  onChanged: (value) {
                    setState(() {
                      _value = value!;
                    });
                  },
                  activeColor: Colors.black,
                ),
                Text(
                  'Pembayaran Tagihan',
                  style: blackFont14.copyWith(color: Colors.black),
                )
              ],
            ),
            Row(
              children: [
                Radio(
                  value: 3,
                  groupValue: _value,
                  onChanged: (value) {
                    setState(() {
                      _value = value!;
                    });
                  },
                  activeColor: Colors.black,
                ),
                Text(
                  'Top Up',
                  style: blackFont14.copyWith(color: Colors.black),
                )
              ],
            ),
            Row(
              children: [
                Radio(
                  value: 4,
                  groupValue: _value,
                  onChanged: (value) {
                    setState(() {
                      _value = value!;
                    });
                  },
                  activeColor: Colors.black,
                ),
                Text(
                  'Transfer',
                  style: blackFont14.copyWith(color: Colors.black),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 10, left: 25, right: 25, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(14),
                        minimumSize: const Size(155, 20),
                        backgroundColor: blueColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    child: Text(
                      'Reset',
                      style: whiteFont16.copyWith(color: Colors.white),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(14),
                        minimumSize: const Size(155, 20),
                        backgroundColor: blueColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    child: Text(
                      'Tampilkan',
                      style: whiteFont16.copyWith(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
