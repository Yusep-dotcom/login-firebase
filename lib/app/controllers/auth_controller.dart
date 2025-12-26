import 'package:app_1/app/modules/home/views/home_view.dart';
import 'package:app_1/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthController extends GetxController {
  //TODO: Implement AuthController
  FirebaseAuth auth = FirebaseAuth.instance;

  void login(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      Get.snackbar('ERROR', 'Email Dan Password harus diisi');
      return;
    }
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      Get.snackbar('Sukses', 'Berhasil masuk');
    } on FirebaseAuthException catch (e) {
      print('ERROR CODE: ${e.code}');
      print('ERROR Massage: ${e.message}');
    }
  }

  void signup(String email, String password) async {
    try {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      Get.snackbar('Sukses', 'anda berhasil mendaftar');
      Get.to(HomeView());
    } catch (e) {
      Get.snackbar(
        "About Login",
        "Login Message",
        backgroundColor: Colors.redAccent,
        snackPosition: SnackPosition.BOTTOM,
        titleText: const Text(
          "Account login failed",
          style: TextStyle(color: Colors.white),
        ),
      );
    }
  }

  void logout() async {
    await auth.signOut();
    Get.toNamed(Routes.HOME);
  }
}
