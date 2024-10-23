import 'package:flutter/material.dart';

import '../../../utils/const/theme.dart';
import '../../../view_model/dummy_pendidikan.dart';

class SearchPendidikanScreen extends StatefulWidget {
  const SearchPendidikanScreen({super.key});

  @override
  State<SearchPendidikanScreen> createState() => _SearchPendidikanScreenState();
}

class _SearchPendidikanScreenState extends State<SearchPendidikanScreen> {
  // Text Editing Controller
  final TextEditingController institusiController = TextEditingController();

  @override
  void dispose() {
    institusiController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Pendidikan',
          style: blackFontAppbar18,
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.black),
                ),
                child: TextField(
                  controller: institusiController,
                  decoration: InputDecoration(
                      prefixIcon: InkWell(
                        onTap: () {},
                        child: const Icon(Icons.search),
                      ),
                      hintText: 'Universitas ...',
                      hintStyle: blackFont12.copyWith(color: Colors.grey),
                      focusedBorder: InputBorder.none),
                ),
              ),
              const SizedBox(height: 18),
              Text(
                'Kategori',
                style: blackFont12.copyWith(
                    fontWeight: FontWeight.w700, fontSize: 14),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 45,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: dummyPendidikan.length,
                  itemBuilder: (context, index) {
                    // ignore: unused_local_variable
                    final data = dummyPendidikan[index];
                    return Column(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              dummyPendidikan[index]['isSelected'] =
                                  !dummyPendidikan[index]['isSelected'];
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 34, vertical: 10),
                            decoration: BoxDecoration(
                              border: Border.all(
                                // color: blueColor,
                                color:
                                    dummyPendidikan[index]['isSelected'] == true
                                        ? const Color(0xff727BB5)
                                        : blueColor,
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10),
                              ),
                              color:
                                  dummyPendidikan[index]['isSelected'] == true
                                      ? const Color(0xff727BB5)
                                      : const Color(0xFFFFFFFF),
                            ),
                            child: Text(
                              dummyPendidikan[index]['tingkat'],
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color:
                                    dummyPendidikan[index]['isSelected'] == true
                                        ? Colors.white
                                        : blueColor,
                              ),
                            ),
                          ),
                        )
                      ],
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const VerticalDivider(
                    color: Colors.transparent,
                    width: 14,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    final data = dummyPendidikan[index];
                    // ignore: unnecessary_null_comparison
                    return data == null
                        ? const CircularProgressIndicator()
                        : SizedBox(
                            height: 65,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    width: double.infinity,
                                    height: 50,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 1,
                                          blurRadius: 6,
                                          offset: const Offset(0, 5),
                                        ),
                                      ],
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: const Color(0xffD9D7D7),
                                      ),
                                      color: Colors.white,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          dummyPendidikan[index]['nama'],
                                          style: blackFormFont12,
                                        ),

                                        const Spacer(), // Menggunakan Spacer agar teks berada di sebelah kiri
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                  },
                  separatorBuilder: (context, index) => const VerticalDivider(
                    color: Colors.transparent,
                    width: 15,
                  ),
                  itemCount: dummyPendidikan.length,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
