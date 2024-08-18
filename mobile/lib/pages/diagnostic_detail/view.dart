import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailView extends StatelessWidget {
  const DetailView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chi tiết chẩn đoán'),
        elevation: 0,
      ),
    );
  }
}
