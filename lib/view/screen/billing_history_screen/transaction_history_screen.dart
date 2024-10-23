import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../models/history_model.dart';
import '../../../utils/const/theme.dart';

class TransactionHistory extends StatefulWidget {
  final Transaction transaction;
  const TransactionHistory({super.key, required this.transaction});

  @override
  State<TransactionHistory> createState() => _TransactionHistoryState();
}

class _TransactionHistoryState extends State<TransactionHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
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
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24, 10, 24, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.transaction.productType == 'pulsa' ||
                widget.transaction.productType == 'paket_data')
              const Padding(
                padding: EdgeInsets.only(top: 40),
                child: Center(
                  child: Image(
                    image: AssetImage('assets/telkomsel.png'),
                    fit: BoxFit.contain,
                    width: 180,
                  ),
                ),
              ),
            if (widget.transaction.productType == 'telkom')
              const Padding(
                padding: EdgeInsets.only(top: 40),
                child: Center(
                  child: Image(
                    image: AssetImage('assets/telkom.png'),
                    fit: BoxFit.contain,
                    width: 180,
                  ),
                ),
              ),
            if (widget.transaction.productType == 'topup')
              const Padding(
                padding: EdgeInsets.only(top: 40),
                child: Center(
                  child: Image(
                    image: AssetImage('assets/topup_money.png'),
                    fit: BoxFit.contain,
                    width: 180,
                  ),
                ),
              ),
            if (widget.transaction.productType == 'plnpost')
              const Padding(
                padding: EdgeInsets.only(top: 40),
                child: Center(
                  child: Image(
                    image: AssetImage('assets/pln_image.png'),
                    fit: BoxFit.contain,
                    width: 100,
                  ),
                ),
              ),
            if (widget.transaction.productType == 'BPJS')
              const Padding(
                padding: EdgeInsets.only(top: 40),
                child: Center(
                  child: Image(
                    image: AssetImage('assets/bpjs_icon.png'),
                    fit: BoxFit.contain,
                    width: 100,
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Text(
                widget.transaction.description,
                style: blackFont14G.copyWith(color: Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Jenis',
                    style: blackFont14.copyWith(color: Colors.black),
                  ),
                  Text(
                    widget.transaction.productType,
                    style: blackFont14.copyWith(color: Colors.black),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Status',
                    style: blackFont14.copyWith(color: Colors.black),
                  ),
                  Text(
                    widget.transaction.status,
                    style: blackFont14.copyWith(color: Colors.black),
                  ),
                ],
              ),
            ),
            if (widget.transaction.productType == 'telkom')
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'No. Pelanggan',
                      style: blackFont14.copyWith(color: Colors.black),
                    ),
                    Text(
                      widget.transaction.customerId,
                      style: blackFont14.copyWith(color: Colors.black),
                    ),
                  ],
                ),
              ),
            if (widget.transaction.productType == 'paket_data')
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'No. Handphone',
                      style: blackFont14.copyWith(color: Colors.black),
                    ),
                    Text(
                      widget.transaction.phoneNumber,
                      style: blackFont14.copyWith(color: Colors.black),
                    ),
                  ],
                ),
              ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Harga',
                    style: blackFont14.copyWith(color: Colors.black),
                  ),
                  if (widget.transaction.status == 'unpaid')
                    Text(
                      '-',
                      style: blackFont14.copyWith(color: Colors.black),
                    ),
                  if (widget.transaction.status == 'successful' &&
                      widget.transaction.productType != 'topup')
                    Text(
                      'Rp. ${NumberFormat('#,###', 'id_ID').format(widget.transaction.price)}',
                      // ('Rp. ${widget.transaction.price}').toString(),
                      style: blackFont14.copyWith(color: Colors.black),
                    ),
                  if (widget.transaction.status == 'successful' &&
                      widget.transaction.productType == 'topup')
                    Text(
                      'Rp. ${NumberFormat('#,###', 'id_ID').format(widget.transaction.amount)}',
                      style: blackFont14.copyWith(color: Colors.black),
                    ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Biaya Admin',
                    style: blackFont14.copyWith(color: Colors.black),
                  ),
                  if (widget.transaction.status == 'unpaid')
                    Text(
                      '-',
                      style: blackFont14.copyWith(color: Colors.black),
                    )
                  else
                    Text(
                      'Rp. ${NumberFormat('#,###', 'id_ID').format(widget.transaction.adminFee)}',
                      // ('Rp. ${widget.transaction.adminFee}').toString(),
                      style: blackFont14.copyWith(color: Colors.black),
                    ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Diskon',
                    style: blackFont14.copyWith(color: Colors.black),
                  ),
                  if (widget.transaction.status == 'unpaid')
                    Text(
                      '-',
                      style: blackFont14.copyWith(color: Colors.black),
                    )
                  else
                    Text(
                      'Rp. ${NumberFormat('#,###', 'id_ID').format(widget.transaction.discountPrice)}',
                      // ('Rp. ${widget.transaction.discountPrice}').toString(),
                      style: blackFont14.copyWith(color: Colors.black),
                    ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 5),
              child: Divider(
                color: Colors.black,
                thickness: 1,
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFBADDB1),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * 0.85,
                  height: 45,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25, right: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total Tagihan',
                          style: blackFont14G.copyWith(color: Colors.black),
                        ),
                        if (widget.transaction.productType != 'topup' &&
                            widget.transaction.status != 'unpaid')
                          Text(
                            'Rp. ${NumberFormat('#,###', 'id_ID').format(widget.transaction.price + widget.transaction.adminFee - widget.transaction.discountPrice)}',
                            // ('Rp. ${(widget.transaction.price + widget.transaction.adminFee) - widget.transaction.discountPrice}')
                            // .toString(),
                            style: blackFont14G.copyWith(color: Colors.black),
                          ),
                        if (widget.transaction.status == 'unpaid')
                          Text(
                            '-',
                            style: blackFont14.copyWith(color: Colors.black),
                          ),
                        if (widget.transaction.productType == 'topup' &&
                            widget.transaction.status != 'unpaid')
                          (Text(
                            // ('Rp. ${(widget.transaction.amount + widget.transaction.adminFee) - widget.transaction.discountPrice}')
                            // .toString(),
                            'Rp. ${NumberFormat('#,###', 'id_ID').format(widget.transaction.amount + widget.transaction.adminFee - widget.transaction.discountPrice)}',
                            style: blackFont14G.copyWith(color: Colors.black),
                          ))
                      ],
                    ),
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
