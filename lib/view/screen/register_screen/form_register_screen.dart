import 'package:capstone_flutter/view/screen/register_screen/berhasil_register_screen.dart';
import 'package:flutter/material.dart';

import '../../../utils/const/theme.dart';

class FormRegisterScreen extends StatefulWidget {
  const FormRegisterScreen({super.key});

  @override
  State<FormRegisterScreen> createState() => _FormRegisterScreenState();
}

class _FormRegisterScreenState extends State<FormRegisterScreen> {
  // editing Controller
  final emailEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  final confirmPasswordEditingController = TextEditingController();
  final nameEditingController = TextEditingController();
  final phoneEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // full name field
    final fullNameField = TextFormField(
      autofocus: false,
      controller: nameEditingController,
      keyboardType: TextInputType.name,
      // validator: (value) {
      //   RegExp regex = RegExp(r'^.{3,}$');
      //   if (value!.isEmpty) {
      //     return ("Full Name cannot be Empty");
      //   }
      //   if (!regex.hasMatch(value)) {
      //     return ("Enter Valid name(Min. 3 Character)");
      //   }
      //   return null;
      // },
      // onSaved: (value) {
      //   nameEditingController.text = value!;
      // },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        filled: true,
        fillColor: const Color(0xffFFFFFF),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );

    // phone field
    final phonelField = TextFormField(
      autofocus: false,
      controller: phoneEditingController,
      keyboardType: TextInputType.phone,
      // validator: (value) {
      //   if (value!.isEmpty) {
      //     return ("Please Enter Your Phone Number");
      //   }
      //   // reg expression for email validation
      //   if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
      //     return ("Please Enter a valid email");
      //   }
      //   return null;
      // },
      // onSaved: (value) {
      //   phoneEditingController.text = value!;
      // },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        filled: true,
        fillColor: const Color(0xfFFFFFFF),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );

    // password field
    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordEditingController,
      obscureText: true,
      // validator: (value) {
      //   RegExp regex = RegExp(r'^.{6,}$');
      //   if (value!.isEmpty) {
      //     return ("Password is required for login");
      //   }
      //   if (!regex.hasMatch(value)) {
      //     return ("Enter Valid Password(Min. 6 Character)");
      //   }
      // },
      // onSaved: (value) {
      //   passwordEditingController.text = value!;
      // },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        filled: true,
        fillColor: const Color(0xffFFFFFF),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );

    //confirm password field
    final confirmPasswordField = TextFormField(
      autofocus: false,
      controller: confirmPasswordEditingController,
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
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
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
          'Daftar',
          style: blackFontAppbar18,
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nama',
              style: blackFormFont12,
            ),
            const SizedBox(
              height: 5,
            ),
            fullNameField,
            const SizedBox(height: 10),
            Text(
              'No.HP',
              style: blackFormFont12,
            ),
            const SizedBox(height: 5),
            phonelField,
            const SizedBox(height: 10),
            Text(
              'Kata Sandi',
              style: blackFormFont12,
            ),
            const SizedBox(
              height: 5,
            ),
            passwordField,
            const SizedBox(height: 10),
            Text(
              'Ketik Ulang Kata Sandi',
              style: blackFormFont12,
            ),
            const SizedBox(
              height: 5,
            ),
            confirmPasswordField,
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding:
            const EdgeInsets.only(bottom: 30, left: 24, right: 24, top: 10),
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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const BerhasilRegisterScreen(),
                ),
              );
            },
            child: Text(
              'Lanjutkan',
              style: whiteFont14,
            ),
          ),
        ),
      ),
    );
  }
}
