import 'package:capstone_flutter/utils/const/theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeScreenCard extends StatelessWidget {
  final double myBalance;
  const HomeScreenCard({super.key, required this.myBalance});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 240, left: 30, right: 40),
      child: SizedBox(
        width: MediaQuery.of(context).size.width - (30 + 40),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text('Saldo',
                    style: whiteFont16.copyWith(
                      color: Colors.white,
                    )),
                Text(
                  'Rp. ${NumberFormat('#,###', 'id_ID').format(myBalance)}',
                  style: whiteFont25.copyWith(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const Spacer(),
            // Column(
            //   children: [
            //     GestureDetector(
            //       onTap: () {
            //         Navigator.push(
            //           context,
            //           MaterialPageRoute(
            //             builder: (context) => const TransferScreen(),
            //           ),
            //         );
            //       },
            //       child: const SizedBox(
            //         width: 48,
            //         height: 48,
            //         child: Icon(Icons.send_to_mobile_outlined,
            //             color: Color(0xFFFCDB80), size: 26),
            //       ),
            //     ),
            //     Text(
            //       'Transfer',
            //       style: whiteFont12M.copyWith(
            //         // fontSize: 10,
            //         color: const Color(0xFFFCDB80),
            //       ),
            //     ),
            //   ],
            // ),

            // TODO: Uncomment this code to show top up button
            // Column(
            //   children: [
            //     GestureDetector(
            //       // key: topupKey,
            //       onTap: () {
            //         Navigator.push(
            //             context,
            //             MaterialPageRoute(
            //                 builder: (context) => const TopUpScreen()));
            //       },
            //       child: const SizedBox(
            //         width: 48,
            //         height: 48,
            //         child: Icon(Icons.add_card_outlined,
            //             color: Color(0xFFFCDB80), size: 26),
            //       ),
            //     ),
            //     Text(
            //       'Top Up',
            //       style: whiteFont12M.copyWith(
            //         color: const Color(0xFFFCDB80),
            //       ),
            //     ),
            //   ],
            // ),
            // Padding
            //   padding: const EdgeInsets.only(top: 270, left: 44),
            //   child: Text(
            //     'Rp. ${NumberFormat('#,###', 'id_ID').format(myBalance)}',
            //     style: whiteFont25.copyWith(
            //       color: Colors.white,
            //     ),
            //   ),
            // ),
            // GestureDetector(
            //   // key: transferKey,
            //   onTap: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => const TransferScreen(),
            //       ),
            //     );
            //   },
            //   child: const Padding(
            //     padding: EdgeInsets.only(top: 252, left: 254),
            //     child: SizedBox(
            //       width: 48,
            //       height: 48,
            //       child: Icon(Icons.send_to_mobile_outlined,
            //           color: Color(0xFFFCDB80), size: 26),
            //     ),
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.only(top: 294, left: 256),
            //   child: Text(
            //     'Transfer',
            //     style: whiteFont12M.copyWith(
            //       // fontSize: 10,
            //       color: const Color(0xFFFCDB80),
            //     ),
            //   ),
            // ),
            // GestureDetector(
            //   // key: topupKey,
            //   onTap: () {
            //     Navigator.push(context,
            //         MaterialPageRoute(builder: (context) => const TopUpScreen()));
            //   },
            //   child: const Padding(
            //     padding: EdgeInsets.only(top: 252, left: 314),
            //     child: SizedBox(
            //       width: 48,
            //       height: 48,
            //       child: Icon(Icons.add_card_outlined,
            //           color: Color(0xFFFCDB80), size: 26),
            //     ),
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.only(top: 294, left: 318),
            //   child: Text(
            //     'Top Up',
            //     style: whiteFont12M.copyWith(
            //       color: const Color(0xFFFCDB80),
            //     ),
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.only(top: 345),
            //   child: Container(
            //     height: MediaQuery.of(context).size.height / 4,
            //     width: MediaQuery.of(context).size.width,
            //     padding: const EdgeInsets.only(top: 25),
            //     decoration: BoxDecoration(
            //       boxShadow: [
            //         BoxShadow(
            //             color: Colors.grey.withOpacity(0.18),
            //             spreadRadius: 1,
            //             blurRadius: 9,
            //             offset: const Offset(0, -8)),
            //       ],
            //       color: Colors.white,
            //       borderRadius: const BorderRadius.only(
            //         topLeft: Radius.circular(22),
            //         topRight: Radius.circular(22),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
