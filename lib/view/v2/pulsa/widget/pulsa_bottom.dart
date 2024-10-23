import 'package:capstone_flutter/utils/const/theme.dart';
import 'package:flutter/material.dart';

class PulsaBottomBar extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onTap;
  const PulsaBottomBar({
    super.key,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 52,
      margin: const EdgeInsets.only(bottom: 30, left: 24, right: 24, top: 20),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected ? blueColor : Colors.grey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: onTap,
        child: Text(
          'Lanjutkan',
          style: whiteFont14.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
