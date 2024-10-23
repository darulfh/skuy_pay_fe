import 'package:flutter/material.dart';

import '../../../utils/const/theme.dart';
import '../home_screen/home_screen.dart';

class AturUlangScreen extends StatefulWidget {
  const AturUlangScreen({super.key});

  @override
  State<AturUlangScreen> createState() => _AturUlangScreenState();
}

class _AturUlangScreenState extends State<AturUlangScreen> {
  // form key
  final _formKey = GlobalKey<FormState>();

  // text editing controller
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpasswordController =
      TextEditingController();

  bool _obscureText = true;

  @override
  void dispose() {
    passwordController.dispose();
    confirmpasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // password field
    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordController,
      obscureText: _obscureText,
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
      //   passwordController.text = value!;
      // },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        suffixIcon: IconButton(
            icon: Icon(
              _obscureText
                  ? Icons.visibility_off_outlined
                  : Icons.visibility_outlined,
              color: Colors.grey,
            ),
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            }),
        contentPadding: const EdgeInsets.fromLTRB(10, 15, 20, 15),
        hintText: 'Kata Sandi',
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );

    //confirm password field
    final confirmPasswordField = TextFormField(
      autofocus: false,
      controller: confirmpasswordController,
      // style: TextStyle(color: Colors.white.withOpacity(0.9)),
      obscureText: true,
      // validator: (value) {
      //   if (confirmPasswordEditingController.text !=
      //       passwordEditingController.text) {
      //     return "Password don't match";
      //   }
      //   return null;
      // },
      // onSaved: (value) {
      //   confirmPasswordEditingController.text = value!;
      // },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        suffixIcon: IconButton(
            icon: Icon(
              _obscureText
                  ? Icons.visibility_off_outlined
                  : Icons.visibility_outlined,
              color: Colors.grey,
            ),
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            }),
        contentPadding: const EdgeInsets.fromLTRB(10, 15, 20, 15),
        hintText: 'Ketik Ulang Kata Sandi',
        filled: true,
        fillColor: const Color(0xffFFFFFF),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Kata Sandi',
          style: blackFontAppbar18,
        ),
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                key: _formKey,
                children: [
                  Text(
                    'Masukkan Kata Sandi Baru Anda',
                    style: blackFont14.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 22),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Kata Sandi ',
                      style: blackFont14,
                    ),
                  ),
                  const SizedBox(height: 8),
                  passwordField,
                  const SizedBox(height: 15),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Ketik Ulang Kata Sandi ',
                      style: blackFont14,
                    ),
                  ),
                  const SizedBox(height: 8),
                  confirmPasswordField,
                ],
              ),
            ),
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
                  Future.delayed(const Duration(seconds: 2), () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NavBar(initialIndex: 0),
                      ),
                    );
                  });
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
