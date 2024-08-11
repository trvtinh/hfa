import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_for_all/common/API/firebase_API.dart';
import 'package:health_for_all/common/entities/medical_data.dart';
import 'package:health_for_all/common/enum/type_medical_data.dart';
import 'package:health_for_all/pages/application/controller.dart';
import 'package:health_for_all/pages/medical_data/controller.dart';
import 'package:health_for_all/pages/medical_data/widget/add_file.dart';
import 'package:image_picker/image_picker.dart';

class ComboBox extends StatefulWidget {
  final String leadingiconpath;
  final String title;
  final String time;
  final RxString? value; // Changed to RxString
  final RxString? unit; // Changed to RxString
  final TextEditingController valueController;
  final TextEditingController unitController;
  final TextEditingController noteController;

  ComboBox({
    super.key,
    required this.leadingiconpath,
    required this.title,
    this.value,
    this.unit,
    required this.valueController,
    required this.unitController,
    required this.noteController,
    required this.time,
  });

  @override
  _ComboBoxState createState() => _ComboBoxState();
}

class _ComboBoxState extends State<ComboBox> {
  final medicalController = Get.find<MedicalDataController>();
  final appController = Get.find<ApplicationController>();
  List<XFile> selectedFiles = [];
  void updateFiles(List<XFile> newFiles) {
    setState(() {
      selectedFiles = newFiles;
      for (var i in selectedFiles) log('combobox : ' + i.path);
    });
  }

  bool ischeck = false;
  @override
  Widget build(BuildContext context) {
    bool haveFile = (selectedFiles.length > 0);
    bool haveNote = widget.noteController.text.isNotEmpty;
    return GestureDetector(
      onTap: () {
        if (haveNote) print('true');
        else print('false');
        _showDialog(context);
      },
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 76,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: ischeck
                  ? Theme.of(context).colorScheme.primaryContainer
                  : Theme.of(context).colorScheme.surface,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(widget.leadingiconpath),
                const SizedBox(width: 8),
                Expanded(child: _buildTextContainer(widget.title, widget.time)),
                Expanded(child: _buildValueUnitColumn(context)),
                const SizedBox(width: 8),
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).colorScheme.surfaceContainerLowest,
                    border: Border.all(
                        color: Theme.of(context).colorScheme.outlineVariant),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(1.5),
                    child: haveNote
                        ? Badge(
                            child: Icon(
                              Icons.edit_note, // Icon when files are present
                              color: ischeck
                                  ? Theme.of(context).colorScheme.primary
                                  : Theme.of(context)
                                      .colorScheme
                                      .outlineVariant,
                            ),
                          )
                        : Icon(
                            Icons.edit_note, // Icon when no files are present
                            color: ischeck
                                ? Theme.of(context).colorScheme.primary
                                : Theme.of(context).colorScheme.outlineVariant,
                          ),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).colorScheme.surfaceContainerLowest,
                    border: Border.all(
                        color: Theme.of(context).colorScheme.outlineVariant),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(1.5),
                    child: haveFile
                        ? Badge(
                            child: Icon(
                              Icons.attach_file, // Icon when files are present
                              color: ischeck
                                  ? Theme.of(context).colorScheme.primary
                                  : Theme.of(context)
                                      .colorScheme
                                      .outlineVariant,
                            ),
                          )
                        : Icon(
                            Icons.attach_file, // Icon when no files are present
                            color: ischeck
                                ? Theme.of(context).colorScheme.primary
                                : Theme.of(context).colorScheme.outlineVariant,
                          ),
                  ),
                ),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: () {
                    selectedFiles.clear();
                    ischeck = false;
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:
                          Theme.of(context).colorScheme.surfaceContainerLowest,
                      border: Border.all(
                          color: Theme.of(context).colorScheme.outlineVariant),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(1.5),
                      child: Icon(
                        Icons.clear,
                        color: ischeck
                            ? Theme.of(context).colorScheme.error
                            : Theme.of(context).colorScheme.outlineVariant,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
        ],
      ),
    );
  }

  Widget _buildTextContainer(String name, String time) {
    return Container(
      height: 76,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              name,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurface,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              time,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildValueUnitColumn(BuildContext context) {
    return SizedBox(
        height: 55,
        child: Obx(
          () => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment:
                CrossAxisAlignment.start, // Align text to the start
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  medicalController.state.data[widget.title]?.value ?? "",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  medicalController.state.data[widget.title]?.unit ?? "",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildDialogHeader(),
                  const SizedBox(height: 24),
                  _buildDialogInputFields(),
                  const SizedBox(height: 4),
                  AddFile(
                    files: selectedFiles,
                    onFilesChanged: updateFiles,
                  ),
                  const SizedBox(height: 24),
                  _buildDialogActions(context),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Row _buildDialogHeader() {
    return Row(
      children: [
        Image.asset(widget.leadingiconpath),
        const SizedBox(width: 10),
        Text(widget.title, style: const TextStyle(fontSize: 24)),
      ],
    );
  }

  Column _buildDialogInputFields() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _buildDialogTextField(
                  'Giá trị đo', 'Giá trị', widget.valueController),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: _buildDialogTextField('Đơn vị', '', widget.unitController),
            ),
          ],
        ),
        const SizedBox(height: 6),
        _buildDialogTextField('Ghi chú', 'Ghi chú', widget.noteController,
            icon: Icons.edit_note),
      ],
    );
  }

  Widget _buildDialogTextField(
      String label, String hint, TextEditingController controller,
      {IconData? icon}) {
    return SizedBox(
      height: 78,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          hintStyle: TextStyle(
            color: Theme.of(context).colorScheme.outline,
            fontSize: 16,
          ),
          border: const OutlineInputBorder(),
          prefixIcon: icon != null
              ? Icon(icon, color: Theme.of(context).colorScheme.primary)
              : null,
        ),
      ),
    );
  }

  Row _buildDialogActions(BuildContext context) {
    MedicalEntity data = MedicalEntity();
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: () async {
            ischeck = false;

            // Await the result of getDocumentId
            medicalController.clearController();
            Get.back();
          },
          child: Text(
            'Hủy',
            style: TextStyle(
              fontSize: 14,
              color: Theme.of(context).colorScheme.error,
            ),
          ),
        ),
        const SizedBox(width: 16),
        TextButton(
          onPressed: () async {
            ischeck = true;
            String? typeId = await FirebaseApi.getDocumentId(
                'type_medical_data', 'name', widget.title);
            // List<String> imageUrl = [];

            // for (var i in selectedFiles) {
            //   String? url =
            //       await FirebaseApi.uploadImage(i.path, 'medicalData');
            //   imageUrl.add(url!);
            // }
            // Create MedicalEntity with the obtained typeId
            data = MedicalEntity(
                userId: appController.state.profile.value!.id,
                typeId: typeId,
                time: medicalController.updateTimestamp(),
                value: widget.valueController.text,
                unit: widget.unitController.text,
                note: widget.noteController.text,
                imagePaths: [for (var i in selectedFiles) i.path],
                imageUrls: []);
            medicalController.state.data[widget.title] = data;
            medicalController.clearController();
            log(medicalController.state.data.toString());
            Get.back();
          },
          child: Text(
            'Xác nhận',
            style: TextStyle(
              fontSize: 14,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
      ],
    );
  }
}
