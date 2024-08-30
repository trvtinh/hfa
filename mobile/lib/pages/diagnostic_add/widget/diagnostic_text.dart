import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class DiagnosticText extends StatefulWidget {
  @override
  State<DiagnosticText> createState() => DiagnosticTextState();
}

class DiagnosticTextState extends State<DiagnosticText> {
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          width: 1,
        ),
      ),
      child: TextField(
        // minLines: 3,
        maxLines: null,
        decoration: InputDecoration(
          labelText: 'Chẩn đoán',
          labelStyle: TextStyle(
            color: Theme.of(context).colorScheme.outline,
            fontSize: 16,
          ),
          hintText: 'Chẩn đoán ....',
          hintStyle: TextStyle(
            color: Theme.of(context).colorScheme.outline,
            fontSize: 16,
          ),
          border: OutlineInputBorder(),
          prefixIcon: Icon(
            Icons.edit_note,
            color: Theme.of(context).colorScheme.primary,
          ),
          // contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 100),
        ),
      ),
    );
  }
}
