import 'package:cached_network_image/cached_network_image.dart';
import 'package:capstone_flutter/utils/const/theme.dart';
import 'package:capstone_flutter/view/screen/notification_screen/notification_screen.dart';
import 'package:flutter/material.dart';

class HomeScreenAppbar extends StatelessWidget {
  final String image;
  final String username;
  final String phoneNumber;
  const HomeScreenAppbar(
      {super.key,
      required this.image,
      required this.username,
      required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 22, top: 45),
          child: CachedNetworkImage(
            imageUrl: image,
            imageBuilder: (context, imageProvider) => Container(
              height: 75,
              width: 75,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                  color: const Color(0xFF1D2660),
                  style: BorderStyle.solid,
                  width: 2,
                ),
              ),
            ),
            errorWidget: (_, __, ___) => Container(
              height: 75,
              width: 75,
              decoration: BoxDecoration(
                image: const DecorationImage(
                    image: AssetImage('assets/profile_home.png')),
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                  color: const Color(0xFF1D2660),
                  style: BorderStyle.solid,
                  width: 2,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 58, left: 125),
          child: Text(
            username.toUpperCase(),
            style: whiteFont18.copyWith(
              color: Colors.white,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 87, left: 125),
          child: Text(
            phoneNumber,
            style: whiteFont14.copyWith(
              color: Colors.white,
            ),
          ),
        ),
        Positioned(
          top: 58,
          right: 0,
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NotificationScreen(),
                ),
              );
            },
            child: const SizedBox(
              width: 48,
              height: 48,
              child: Icon(Icons.notifications_outlined,
                  color: Colors.white, size: 28),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 110,
          ),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 1,
            child: AspectRatio(
              aspectRatio: 17 / 11,
              child: Image.asset(
                'assets/motif_polos.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.22,
              left: MediaQuery.of(context).size.width * 0.06),
          child: Row(
            children: [
              Container(
                height: 2,
                width: MediaQuery.of(context).size.width * 0.11,
                color: Colors.white,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(
                  "skuypay",
                  style: whiteFont16.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.04),
                child: Container(
                  height: 2,
                  width: MediaQuery.of(context).size.height * 0.25,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
