import 'package:capstone_flutter/models/apis/token_listrik/token_listrik_model.dart';
import 'package:capstone_flutter/utils/const/theme.dart';
import 'package:capstone_flutter/view/v2/pulsa/widget/pulsa_bottom.dart';
import 'package:capstone_flutter/view/v2/token_listrik/token_listrik_detail_v2.dart';
import 'package:capstone_flutter/view_model/token_dan_tagihan_listrik/token_listrik_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class TokenListrikV2View extends StatelessWidget {
  const TokenListrikV2View({super.key});

  @override
  Widget build(BuildContext context) {
    final token = context.watch<TokenListrikProvider>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Token Listrik',
          style: blackFont18.copyWith(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          _TokenListrikNumber(token.customerId ?? ""),
          const _TokenListrikCards(),
        ],
      ),
      bottomNavigationBar: PulsaBottomBar(
          isSelected: token.selectTokenListrik != null,
          onTap: () {
            if (token.selectTokenListrik == null) return;

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const TokenListrikDetailV2View(),
              ),
            );
          }),
    );
  }
}

class _TokenListrikNumber extends StatelessWidget {
  final String customerId;
  const _TokenListrikNumber(this.customerId);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'No. Pelanggan',
          style: blackFont14,
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: MediaQuery.of(context).size.width - (24 + 24),
          child: TextFormField(
            autofocus: false,
            obscureText: false,
            readOnly: true,
            initialValue: customerId,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.fromLTRB(10, 0, 20, 0),
              hintText: 'Contoh: 081234567890',
              hintStyle: blackFont12.copyWith(color: Colors.grey),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: Colors.black,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 24,
        ),
      ],
    );
  }
}

class _TokenListrikCards extends StatelessWidget {
  const _TokenListrikCards();

  @override
  Widget build(BuildContext context) {
    return Consumer<TokenListrikProvider>(
      builder:
          (BuildContext context, TokenListrikProvider value, Widget? child) {
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 3 / 2,
          ),
          itemCount: value.listTokenListrik.length,
          itemBuilder: (context, index) => _Card(
            data: value.listTokenListrik[index],
          ),
        );
      },
    );
  }
}

class _Card extends StatelessWidget {
  final TokenListrikModel data;
  const _Card({required this.data});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<TokenListrikProvider>().setSelectTokenListrik(data);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color:
                data.isSelect == true ? const Color(0xff2B3990) : Colors.black,
          ),
          color: data.isSelect == true ? const Color(0xff2B3990) : Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                data.name.toString(),
                // data.price.toString(),
                style: TextStyle(
                  fontSize: 18,
                  color: data.isSelect == true ? Colors.white : Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Rp. ${NumberFormat('#,###', 'id_ID').format(data.price.toInt())}',
                    // 'Rp.${data.price.toInt()}',
                    style: TextStyle(
                      fontSize: 14,
                      color: data.isSelect == true
                          ? Colors.white
                          : const Color(0xff2B3990),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Spacer(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
