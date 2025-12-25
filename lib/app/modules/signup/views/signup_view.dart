import 'package:app_1/app/controllers/auth_controller.dart';
import 'package:app_1/app/modules/signup/controllers/signup_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';


class SignupView extends GetView<SignupController> {
  SignupView({super.key});
  final authC = Get.find<AuthController>();
  
  final emailC = TextEditingController();
  final passC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SignupView'), centerTitle: true),
      body:  Center(
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
                onPressed: () => authC.signup(emailC.text, passC.text),
                child: Text('Signup'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
