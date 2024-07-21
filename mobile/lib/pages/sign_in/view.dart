import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogIn extends StatelessWidget {
  const LogIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Center(
        child: IconButton(onPressed: () => Get.toNamed('/application'), icon: Icon(Icons.arrow_back))
      ))
    );
  }
}