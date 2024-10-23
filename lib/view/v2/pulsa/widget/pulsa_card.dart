import 'package:capstone_flutter/models/pulsa_paket_data.dart';
import 'package:capstone_flutter/utils/const/theme.dart';
import 'package:capstone_flutter/view_model/pulsa_paketdata/pulsa_v2_view_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class PulsaCards extends StatelessWidget {
  const PulsaCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PulsaV2ViewModel>(
      builder: (BuildContext context, PulsaV2ViewModel value, Widget? child) {
        if (value.state == Status.loading) {
          const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (value.state == Status.error) {
          return const Center(
            child: Text('Error'),
          );
        }
        if (value.state == Status.success) {
          if (value.pulsa.isEmpty) {
            return const _Empty(
              isPhoneNumberEntered: true,
            );
          }

          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 3 / 2,
            ),
            itemCount: value.pulsa.length,
            itemBuilder: (context, index) => _Card(
              data: value.pulsa[index],
            ),
          );
        }

        return const _Empty();
      },
    );
  }
}

class _Card extends StatelessWidget {
  final PulsaPaketdataData data;
  const _Card({required this.data});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<PulsaV2ViewModel>().selectPulsa(data);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: data.isSelected == true
                ? const Color(0xff2B3990)
                : Colors.black,
          ),
          color:
              data.isSelected == true ? const Color(0xff2B3990) : Colors.white,
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
                  color: data.isSelected == true ? Colors.white : Colors.black,
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
                      color: data.isSelected == true
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

class _Empty extends StatelessWidget {
  final bool isPhoneNumberEntered;
  const _Empty({this.isPhoneNumberEntered = false});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        isPhoneNumberEntered ? 'Data Kosong' : 'Masukkan nomor telepon',
        style: blackFont16,
      ),
    );
  }
}
