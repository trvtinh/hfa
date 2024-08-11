import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_for_all/pages/medical_data/controller.dart';
import 'package:health_for_all/pages/medical_data/widget/add_file.dart';

class ComboBox extends StatefulWidget {
  final String leadingiconpath;
  final String title;
<<<<<<< HEAD
  final String time;
  final RxString? value; // Changed to RxString
  final RxString? unit; // Changed to RxString
  final TextEditingController valueController;
  final TextEditingController unitController;
  final TextEditingController noteController;
=======
  final String value;
  final String unit;
  final IconButton? edit;
  final IconButton? upload;
>>>>>>> 416fb578f78090ebf15969f4ecdb1f2a664f0fa1

  ComboBox({
    super.key,
    required this.leadingiconpath,
    required this.title,
<<<<<<< HEAD
    this.value,
    this.unit,
    required this.valueController,
    required this.unitController,
    required this.noteController, 
    required this.time,
=======
    required this.value,
    required this.unit,
    this.edit,
    this.upload,
>>>>>>> 416fb578f78090ebf15969f4ecdb1f2a664f0fa1
  });

  @override
  _ComboBoxState createState() => _ComboBoxState();
}

class _ComboBoxState extends State<ComboBox> {
  final TextEditingController valueController = TextEditingController();
  final TextEditingController unitController = TextEditingController();
  final TextEditingController noteController = TextEditingController();
  bool isChecked = false;
  final controller = Get.find<MedicalDataController>();
  @override
  Widget build(BuildContext context) {
    bool haveFile = (selectedFiles.length > 0);
    bool haveNote = widget.noteController.text.isNotEmpty;
    return GestureDetector(
      onTap: () {
        _showDialog(context);
      },
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 76,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: isChecked
                  ? Theme.of(context).colorScheme.primaryContainer
                  : Theme.of(context).colorScheme.surface,
            ),
            child: Row(
              children: [
                Image.asset(widget.leadingiconpath),
                const SizedBox(width: 8),
<<<<<<< HEAD
                Expanded(child: _buildTextContainer(widget.title, widget.time)),
                Expanded(child: _buildValueUnitColumn(context)),
=======
                Expanded(child: _buildTextContainer(widget.title)),
                Expanded(child: _buildValueUnitColumn()),
>>>>>>> 416fb578f78090ebf15969f4ecdb1f2a664f0fa1
                const SizedBox(width: 8),
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).colorScheme.surfaceContainerLowest,
                    border: Border.all(color: Theme.of(context).colorScheme.outlineVariant),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(1.5),
                    child: haveNote
                      ? Badge(
                        child: Icon(
                            Icons.edit_note, // Icon when files are present
                            color: ischeck
                                ? Theme.of(context).colorScheme.primary
                                : Theme.of(context).colorScheme.outlineVariant,
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
<<<<<<< HEAD
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).colorScheme.surfaceContainerLowest,
                    border: Border.all(color: Theme.of(context).colorScheme.outlineVariant),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(1.5),
                    child: haveFile
                      ? Badge(
                        child: Icon(
                            Icons.attach_file, // Icon when files are present
                            color: ischeck
                                ? Theme.of(context).colorScheme.primary
                                : Theme.of(context).colorScheme.outlineVariant,
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
                  onTap: (){
                    selectedFiles.clear();
                    ischeck = false;
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).colorScheme.surfaceContainerLowest,
                      border: Border.all(color: Theme.of(context).colorScheme.outlineVariant),
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
=======
                IconWidgetRound(icon: const Icon(Icons.attach_file)),
                const SizedBox(width: 15),
                Checkbox(
                  value: isChecked,
                  onChanged: (value) => setState(() => isChecked = value!),
>>>>>>> 416fb578f78090ebf15969f4ecdb1f2a664f0fa1
                ),
              ],
            ),
          ),
          const Divider(height: 1),
        ],
      ),
    );
  }

<<<<<<< HEAD
  Widget _buildTextContainer(String name, String time) {
    return Container(
      height: 76,
=======
  Widget _buildTextContainer(String text) {
    return Container(
      height: 55,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          text,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSurface,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildValueUnitColumn() {
    return SizedBox(
      height: 55,
>>>>>>> 416fb578f78090ebf15969f4ecdb1f2a664f0fa1
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
<<<<<<< HEAD
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
=======
          Text(
            widget.value,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimaryContainer,
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
          ),
          Text(
            widget.unit,
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
>>>>>>> 416fb578f78090ebf15969f4ecdb1f2a664f0fa1
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
<<<<<<< HEAD
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
=======
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildDialogHeader(),
                const SizedBox(height: 24),
                _buildDialogInputFields(),
                const SizedBox(height: 4),
                AddFile(),
                const SizedBox(height: 24),
                _buildDialogActions(context),
              ],
>>>>>>> 416fb578f78090ebf15969f4ecdb1f2a664f0fa1
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
                  'Giá trị đo', 'Giá trị', valueController),
            ),
            const SizedBox(width: 20),
            Expanded(
<<<<<<< HEAD
              child: _buildDialogTextField('Đơn vị', '', widget.unitController),
=======
              child:
                  _buildDialogTextField('Đơn vị', 'lần/phút', unitController),
>>>>>>> 416fb578f78090ebf15969f4ecdb1f2a664f0fa1
            ),
          ],
        ),
        const SizedBox(height: 6),
        _buildDialogTextField('Ghi chú', 'Ghi chú', noteController,
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
<<<<<<< HEAD
          onPressed: () async {
            ischeck = false;

            // Await the result of getDocumentId
            medicalController.clearController();
            Get.back();
=======
          onPressed: () {
            setState(() => isChecked = false);
            Navigator.pop(context);
>>>>>>> 416fb578f78090ebf15969f4ecdb1f2a664f0fa1
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
<<<<<<< HEAD
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
=======
          onPressed: () {
            setState(() => isChecked = true);
            Navigator.pop(context);
>>>>>>> 416fb578f78090ebf15969f4ecdb1f2a664f0fa1
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
