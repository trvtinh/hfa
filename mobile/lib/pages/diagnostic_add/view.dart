import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_for_all/pages/diagnostic_add/controller.dart';
import 'package:health_for_all/pages/diagnostic_add/information.dart';
import 'package:health_for_all/pages/diagnostic_add/widget/add_file.dart';
import 'package:health_for_all/pages/diagnostic_add/widget/diagnostic_text.dart';
import 'package:health_for_all/pages/diagnostic_add/widget/from_doctor.dart';
import 'package:health_for_all/pages/diagnostic_add/widget/send_diagnostic.dart';
import 'package:health_for_all/pages/diagnostic_add/widget/type_of_data.dart';
import 'package:image_picker/image_picker.dart';

class AddView extends StatefulWidget {
  @override
  State<AddView> createState() => AddViewState();
}

class DiagnosticAddViewState extends State<DiagnosticAddView> {
  final diagnosticController = Get.find<DiagnosticAddController>();
  List<XFile> selectedFiles = [];
  void updateFiles(List<XFile> newFiles) {
    setState(() {
      selectedFiles = newFiles;
      for (var i in selectedFiles) {
        log('combobox : ${i.path}');
      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Thêm chẩn đoán'),
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SendDiagnostic(),
                      const SizedBox(height: 16),
                      TypeOfData(),
                      const SizedBox(height: 16),
                      DiagnosticText(),
                      const SizedBox(height: 16),
                      AddFile(
                        files: selectedFiles,
                        onFilesChanged: updateFiles,
                      ),
                    ],
                  ),
                ),
              ),
              FromDoctor(
                  doctorname: diagnosticController
                          .appController.state.profile.value!.name ??
                      ""),
              _buildActionButtons(context),
            ],
          ),
        ));
  }

  Widget _buildActionButtons(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildActionButton(context, "Hủy"),
            const SizedBox(width: 15),
            const VerticalDivider(width: 1, indent: 5, endIndent: 5),
            const SizedBox(width: 15),
            _buildActionButton(context, "Lưu"),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(BuildContext context, String label) {
    return SizedBox(
      height: 40,
      width: (MediaQuery.of(context).size.width / 2) - 40,
      child: TextButton(
        onPressed: () async {
          if (label == 'Lưu') {
            try {
              // Show success dialog
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Thành công'),
                    content: const Text('Dữ liệu đã được ghi nhận'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(); // Dismiss the dialog
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  );
                },
              );
            } catch (e) {
              // Handle any errors
              print('Error saving data: $e');
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Error'),
                    content: const Text(
                        'An error occurred while saving data. Please try again.'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(); // Dismiss the dialog
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  );
                },
              );
            }
          }
        },
        child: Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
    );
  }
}
