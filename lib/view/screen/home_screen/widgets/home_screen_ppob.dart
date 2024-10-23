import 'package:capstone_flutter/utils/const/theme.dart';
import 'package:capstone_flutter/view/v2/paket_data/paket_data_v2_view.dart';
import 'package:capstone_flutter/view/v2/pulsa/pulsa_v2_view.dart';
import 'package:flutter/material.dart';

class HomeScreenPpob extends StatelessWidget {
  final VoidCallback wifi;
  final VoidCallback bpjs;
  final VoidCallback tagihanListrik;
  final VoidCallback tokenListrik;
  const HomeScreenPpob(
      {super.key,
      required this.wifi,
      required this.bpjs,
      required this.tagihanListrik,
      required this.tokenListrik});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 360),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                /// PULSA PAKET DATA
                InkWell(
                  onTap: () {},
                  child: Stack(
                    children: [
                      Container(
                        width: 85,
                        height: 85,
                        decoration: BoxDecoration(
                            color: const Color(0xFFEDF8FB),
                            borderRadius: BorderRadius.circular(50)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.phone_iphone_outlined,
                                color: Color(0xFF2B3990), size: 30),
                            const SizedBox(
                              height: 7,
                            ),
                            Text(
                              'Pulsa',
                              style: whiteFont12E.copyWith(
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned.fill(
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(42),
                            splashColor: Colors.green.withOpacity(0.5),
                            highlightColor: Colors.blue.withOpacity(0.4),
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const PulsaV2View(),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                InkWell(
                  onTap: () {},
                  child: Stack(
                    children: [
                      Container(
                        width: 85,
                        height: 85,
                        decoration: BoxDecoration(
                            color: const Color(0xFFEDF8FB),
                            borderRadius: BorderRadius.circular(50)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.phone_iphone_outlined,
                                color: Color(0xFF2B3990), size: 30),
                            const SizedBox(
                              height: 7,
                            ),
                            Text(
                              'Paket Data',
                              style: whiteFont12E.copyWith(
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned.fill(
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(42),
                            splashColor: Colors.green.withOpacity(0.5),
                            highlightColor: Colors.blue.withOpacity(0.4),
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const PaketDataV2View(),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // BPJS
                InkWell(
                  onTap: () {},
                  child: Stack(
                    children: [
                      Container(
                        width: 85,
                        height: 85,
                        decoration: BoxDecoration(
                            color: const Color(0xFFEDF8FB),
                            borderRadius: BorderRadius.circular(50)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Image(
                              image: AssetImage(
                                'assets/family_restroom.png',
                              ),
                              fit: BoxFit.cover,
                              height: 30,
                              width: 30,
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                            Text(
                              'BPJS',
                              style: whiteFont12E.copyWith(
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned.fill(
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(42),
                            splashColor: Colors.green.withOpacity(0.5),
                            highlightColor: Colors.blue.withOpacity(0.4),
                            onTap: () {
                              // _showModalBottomSheetBpjs(context);
                              bpjs();
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                /// PLN
                InkWell(
                  onTap: () {},
                  child: Stack(
                    children: [
                      Container(
                        width: 90,
                        height: 90,
                        decoration: BoxDecoration(
                            color: const Color(0xFFEDF8FB),
                            borderRadius: BorderRadius.circular(50)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Image(
                              image: AssetImage(
                                'assets/flash_on.png',
                              ),
                              fit: BoxFit.contain,
                              height: 30,
                              width: 30,
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                            Text(
                              'Tagihan\nListrik',
                              textAlign: TextAlign.center,
                              style: whiteFont12E.copyWith(
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned.fill(
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(42),
                            splashColor: Colors.green.withOpacity(0.5),
                            highlightColor: Colors.blue.withOpacity(0.4),
                            onTap: () {
                              // _showModalBottomSheetToken(context);
                              tagihanListrik();
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Stack(
                    children: [
                      Container(
                        width: 90,
                        height: 90,
                        decoration: BoxDecoration(
                            color: const Color(0xFFEDF8FB),
                            borderRadius: BorderRadius.circular(50)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Image(
                              image: AssetImage(
                                'assets/flash_on.png',
                              ),
                              fit: BoxFit.contain,
                              height: 30,
                              width: 30,
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                            Text(
                              'Token\nListrik',
                              style: whiteFont12E.copyWith(
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned.fill(
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(42),
                            splashColor: Colors.green.withOpacity(0.5),
                            highlightColor: Colors.blue.withOpacity(0.4),
                            onTap: () {
                              // _showModalBottomSheetToken(context);
                              tokenListrik();
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // /// WIFI
                // InkWell(
                //   onTap: () {},
                //   child: Stack(
                //     children: [
                //       Container(
                //         width: 85,
                //         height: 85,
                //         decoration: BoxDecoration(
                //             color: const Color(0xFFEDF8FB),
                //             borderRadius: BorderRadius.circular(50)),
                //         child: Column(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           children: [
                //             const Icon(Icons.wifi,
                //                 color: Color(0xFF21660E), size: 30),
                //             const SizedBox(
                //               height: 7,
                //             ),
                //             Text(
                //               'Wifi',
                //               style: whiteFont12E.copyWith(
                //                 color: Colors.black,
                //               ),
                //             ),
                //           ],
                //         ),
                //       ),
                //       Positioned.fill(
                //         child: Material(
                //           color: Colors.transparent,
                //           child: InkWell(
                //             borderRadius: BorderRadius.circular(42),
                //             splashColor: Colors.green.withOpacity(0.5),
                //             highlightColor: Colors.blue.withOpacity(0.4),
                //             onTap: () {
                //               wifi();
                //               // _showModalBottomSheetWifi();
                //             },
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),

                /// PDAM
                // InkWell(
                //   onTap: () {},
                //   child: Stack(
                //     children: [
                //       Container(
                //         width: 85,
                //         height: 85,
                //         decoration: BoxDecoration(
                //             color: const Color(0xFFEDF8FB),
                //             borderRadius: BorderRadius.circular(50)),
                //         child: Column(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           children: [
                //             const Icon(Icons.water_drop_outlined,
                //                 color: Color(0xFF27AAE1), size: 30),
                //             const SizedBox(
                //               height: 7,
                //             ),
                //             Text(
                //               'PDAM',
                //               style: whiteFont12E.copyWith(
                //                 color: Colors.black,
                //               ),
                //             ),
                //           ],
                //         ),
                //       ),
                //       Positioned.fill(
                //         child: Material(
                //           color: Colors.transparent,
                //           child: InkWell(
                //             borderRadius: BorderRadius.circular(42),
                //             splashColor: Colors.green.withOpacity(0.5),
                //             highlightColor: Colors.blue.withOpacity(0.4),
                //             onTap: () {
                //               Navigator.push(
                //                   context,
                //                   MaterialPageRoute(
                //                       builder: (context) =>
                //                           const PdamScreen()));
                //             },
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),

                /// PENDIDIKAN
                // Stack(
                //   children: [
                //     Container(
                //       width: 85,
                //       height: 85,
                //       decoration: BoxDecoration(
                //           color: const Color(0xFFEDF8FB),
                //           borderRadius: BorderRadius.circular(50)),
                //       child: Column(
                //         mainAxisAlignment: MainAxisAlignment.center,
                //         children: [
                //           const Icon(Icons.school_outlined,
                //               color: Color(0xFFE07664), size: 30),
                //           const SizedBox(
                //             height: 7,
                //           ),
                //           Text(
                //             'Pendidikan',
                //             style: whiteFont12E.copyWith(
                //               color: Colors.black,
                //             ),
                //           ),
                //         ],
                //       ),
                //     ),
                //     Positioned.fill(
                //       child: Material(
                //         color: Colors.transparent,
                //         child: InkWell(
                //           borderRadius: BorderRadius.circular(42),
                //           splashColor: Colors.green.withOpacity(0.5),
                //           highlightColor: Colors.blue.withOpacity(0.4),
                //           onTap: () {
                //             Navigator.push(
                //                 context,
                //                 MaterialPageRoute(
                //                     builder: (context) =>
                //                         const PendidikanScreen()));
                //           },
                //         ),
                //       ),
                //     ),
                // ],
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
