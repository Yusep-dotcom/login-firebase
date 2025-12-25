import 'package:app_1/app/controllers/auth_controller.dart';
import 'package:app_1/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  LoginView({super.key});
  final authC = Get.find<AuthController>();

  final emailC = TextEditingController();
  final passC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('LoginView'), centerTitle: true),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                controller: emailC,
                decoration: InputDecoration(
                  label: Text('Email'),
                  border: OutlineInputBorder(),
                  hint: Text('Mausukan Email Anda'),
                ),
              ),
              SizedBox(height: 17),
              TextField(
                controller: passC,
                decoration: InputDecoration(
                  label: Text('Email'),
                  border: OutlineInputBorder(),
                  hint: Text('Mausukan Email Anda'),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => authC.login(emailC.text, passC.text),
                child: Text('Login'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Belum Punya Akun'),
                  SizedBox(height: 10),
                  TextButton(
                    onPressed: () => Get.toNamed(Routes.HOME),
                    child: Text('Daftar'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
