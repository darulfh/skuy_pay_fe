// ignore_for_file: use_build_context_synchronously

import 'package:cached_network_image/cached_network_image.dart';
import 'package:capstone_flutter/view/screen/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/apis/update_user_data.dart';
import '../../../utils/const/theme.dart';
import '../../../view_model/user_provider/user_provider.dart';
import '../../../view_model/user_provider/user_update_image_provider.dart';

class ChangeProfileScreen extends StatefulWidget {
  const ChangeProfileScreen({super.key});

  @override
  State<ChangeProfileScreen> createState() => _ChangeProfileScreenState();
}

class _ChangeProfileScreenState extends State<ChangeProfileScreen> {
  late SharedPreferences _prefs;
  late UpdateUserController userController;

  String email = '';
  String name = '';
  String phone = '';
  String image = '';
  @override
  void initState() {
    super.initState();
    initial();
  }

  void initial() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      name = _prefs.getString('name').toString();
      phone = _prefs.getString('phone').toString();
      email = _prefs.getString('email').toString();
      image = _prefs.getString('image').toString();
      userController =
          UpdateUserController(_prefs.getString('token').toString());

      nameController.text = name;
      emailController.text = email;
      handphoneController.text = phone;
    });
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController handphoneController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    nameController.dispose();
    handphoneController.dispose();
  }

  void saveProfile() async {
    String newName = nameController.text;
    String newEmail = emailController.text;
    String newPhone = handphoneController.text;

    bool success =
        await userController.updateUserById(newName, newEmail, newPhone);

    if (success) {
      UserProvider userProvider =
          Provider.of<UserProvider>(context, listen: false);
      setState(() {
        // Simpan data baru ke SharedPreferences
        _prefs.setString('name', newName);
        _prefs.setString('phone', newPhone);
        _prefs.setString('email', newEmail);

        // Memperbarui nilai di UserProvider
        userProvider.updateUserInfo(newName, newPhone, userProvider.balance);
      });

      await Future.delayed(const Duration(seconds: 1));

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const NavBar(
            initialIndex: 2,
          ),
        ),
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Perubahan Berhasil'),
          backgroundColor: Colors.green,
          behavior: SnackBarBehavior.floating,
        ),
      );
    } else {
      Navigator.pop(context);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Perubahan Gagal'),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profil',
          style: blackFont18.copyWith(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50,
              ),
              Column(
                children: [
                  Consumer<UserUpdateImageProvider>(
                      builder: (context, value, child) {
                    if (value.state == ImageState.result) {
                      return UserImage(
                          image: value.image, onTap: () => popUpPicker());
                    } else if (value.state == ImageState.loading) {
                      return const ImageLoading();
                    } else {
                      return UserImage(
                          image: image, onTap: () => popUpPicker());
                    }
                  }),
                  const SizedBox(height: 20),
                  Text(
                    'Ubah Foto Profil',
                    style: blueFont14.copyWith(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Nama*',
                style: blackFont16.copyWith(fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.black)),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintStyle: blackFont16,
                      hintText: name),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Email*',
                style: blackFont16.copyWith(fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.black),
                  color: Colors.grey[200],
                ),
                child: TextField(
                  controller: emailController,
                  enabled: false,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintStyle: blackFont16,
                    hintText: email,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Nomor Hp*',
                style: blackFont16.copyWith(fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.black)),
                child: TextField(
                  controller: handphoneController,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintStyle: blackFont16,
                    hintText: phone,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(24, 10, 24, 20),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 52,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: blueColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: saveProfile,
            child: Text(
              'Simpan',
              style: whiteFont14.copyWith(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  void popUpPicker() {
    showGeneralDialog(
      barrierLabel: "Create Option",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 300),
      context: context,
      pageBuilder: (_, __, ___) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              //height: 300,
              // width: WebWidth.getWidth(context),
              margin: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height / 3,
                  left: 24,
                  right: 24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Material(
                color: Colors.transparent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        child: const Divider(
                          color: Colors.white,
                        )),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                        imagePickerOption(true);
                      },
                      child: Container(
                        color: Colors.transparent,
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Wrap(
                              spacing: 16,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                Icon(
                                  Icons.camera_alt,
                                  color: blueColor,
                                ),
                                Text("Camera",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(fontSize: 14)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        child: const Divider()),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                        imagePickerOption(false);
                      },
                      child: Container(
                        color: Colors.transparent,
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Wrap(
                              spacing: 16,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                Icon(
                                  Icons.image,
                                  color: blueColor,
                                ),
                                Text("Gallery",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(fontSize: 14)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        child: const Divider(
                          color: Colors.white,
                        )),
                  ],
                ),
              ),
            ),
          ],
        );
      },
      transitionBuilder: (_, anim, __, child) {
        return SlideTransition(
          position: Tween(begin: const Offset(0, 2), end: const Offset(0, 0))
              .animate(anim),
          child: child,
        );
      },
    );
  }

  Future<void> imagePickerOption(bool isCamera) async {
    final ImagePicker picker = ImagePicker();
    XFile? photo = await picker.pickImage(
      source: isCamera ? ImageSource.camera : ImageSource.gallery,
      imageQuality: 35,
    );

    if (photo?.path != null && context.mounted) {
      debugPrint("photo?.path: ${photo?.path}");
      context.read<UserUpdateImageProvider>().updateImage(photo!.path);
    }
  }
}

class UserImage extends StatelessWidget {
  final String image;
  final VoidCallback onTap;

  const UserImage({
    super.key,
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: onTap,
        child: CachedNetworkImage(
          imageUrl: image,
          imageBuilder: (context, imageProvider) => Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image:
                    DecorationImage(image: imageProvider, fit: BoxFit.cover)),
          ),
          progressIndicatorBuilder: (_, __, ___) => const ImageLoading(),
          errorWidget: (context, url, error) => Image.asset(
            'assets/profile.png',
            width: 80,
            height: 80,
          ),
        ),
      ),
    );
  }
}

class ImageLoading extends StatelessWidget {
  const ImageLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 80,
        height: 80,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: const Color(0xffE4EDF6),
            border: Border.all(color: const Color(0xffC6D4E9))),
        child: const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
