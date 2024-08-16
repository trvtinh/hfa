import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddView extends StatelessWidget {
  const AddView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thêm chẩn đoán'),
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/images/HFA_small_icon.png',
            ),
          ),
        ],
      ),
    );
  }
}
