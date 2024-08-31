import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class DiagnosticText extends StatefulWidget {
  @override
  State<DiagnosticText> createState() => DiagnosticTextState();
}

class DiagnosticTextState extends State<DiagnosticText> {
  Widget build(BuildContext context) {
    return TextField(
      // minLines: 3,
      maxLines: 3,
      decoration: InputDecoration(
        labelText: 'Chẩn đoán',
        labelStyle: TextStyle(
          color: Theme.of(context).colorScheme.outline,
          fontSize: 16,
        ),
        hintText: 'Chẩn đoán',
        hintStyle: TextStyle(
          color: Theme.of(context).colorScheme.outline,
          fontSize: 16,
        ),
        border: OutlineInputBorder(),
        prefixIcon: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              Icons.edit_note,
              color: Theme.of(context).colorScheme.primary,
            ),
          ],
        ),
        // contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 100),
      ),
    );
  }
}
