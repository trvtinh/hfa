import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_for_all/pages/medical_data/controller.dart';
import 'package:health_for_all/pages/medical_data/widget/add_file.dart';

class ComboBox extends StatefulWidget {
  final String leadingiconpath;
  final String title;
  final String value;
  final String unit;
  final IconButton? edit;
  final IconButton? upload;

  ComboBox({
    super.key,
    required this.leadingiconpath,
    required this.title,
    required this.value,
    required this.unit,
    this.edit,
    this.upload,
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
    return GestureDetector(
      onTap: () {
        _showDialog(context);
      },
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 72,
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
                Expanded(child: _buildTextContainer(widget.title)),
                Expanded(child: _buildValueUnitColumn()),
                const SizedBox(width: 8),
                IconWidgetRound(icon: const Icon(Icons.edit_note)),
                const SizedBox(width: 8),
                IconWidgetRound(icon: const Icon(Icons.attach_file)),
                const SizedBox(width: 15),
                Checkbox(
                  value: isChecked,
                  onChanged: (value) => setState(() => isChecked = value!),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
        ],
      ),
    );
  }

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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start, // Align text to the start
        children: [
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
            ),
          ),
        ],
      ),
    );
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
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
              child:
                  _buildDialogTextField('Đơn vị', 'lần/phút', unitController),
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
    return Container(
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
          onPressed: () {
            setState(() => isChecked = false);
            Navigator.pop(context);
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
          onPressed: () {
            setState(() => isChecked = true);
            Navigator.pop(context);
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

class IconWidgetRound extends StatelessWidget {
  final Icon icon;

  IconWidgetRound({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: icon,
      ),
    );
  }
}
