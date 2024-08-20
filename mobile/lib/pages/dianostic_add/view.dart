import 'package:flutter/material.dart';
import 'package:health_for_all/pages/dianostic_add/widget/send_diagnostic.dart';
import 'package:get/get.dart';

class AddView extends StatelessWidget {
  const AddView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Thêm chẩn đoán'),
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SendDiagnostic(),
              const SizedBox(height: 16),
            ],
          ),
        ));
  }
}
