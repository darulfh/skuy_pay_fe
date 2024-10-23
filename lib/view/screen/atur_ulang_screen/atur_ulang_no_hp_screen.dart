import 'package:flutter/material.dart';

import '../../../utils/const/theme.dart';

class AturUlangNomorHpScreen extends StatefulWidget {
  const AturUlangNomorHpScreen({super.key});

  @override
  State<AturUlangNomorHpScreen> createState() => _AturUlangNomorHpScreenState();
}

class _AturUlangNomorHpScreenState extends State<AturUlangNomorHpScreen> {
  // form key
  final _formKey = GlobalKey<FormState>();

  // text editing controller
  final TextEditingController passwordController = TextEditingController();

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
          'Atur Ulang',
          style: blackFontAppbar18,
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Masukkan Nomor Handphone Baru Kamu',
                  style: blackFont14,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                autofocus: false,
                controller: passwordController,
                obscureText: true,
                // validator: (value) {
                //   RegExp regex = new RegExp(r'^.{6,}$');
                //   if (value!.isEmpty) {
                //     return ("Password is required for login");
                //   }
                //   if (!regex.hasMatch(value)) {
                //     return ("Enter Valid Password(Min. 6 Character)");
                //   }
                // },
                // onSaved: (value) {
                //   nameController.text = value!;
                // },
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.fromLTRB(10, 15, 20, 15),
                  hintText: "Enter Your Password",
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 30, left: 24, right: 24),
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
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    content: SizedBox(
                      width: 260,
                      height: 170,
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Image(
                              image: AssetImage('assets/ceklis.png'),
                              fit: BoxFit.contain,
                              width: 90,
                              height: 90,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Yey! E-mail kamu sudah diperbarui',
                            style: blackFont14G.copyWith(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            child: Text(
              'Simpan',
              style: whiteFont14.copyWith(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
