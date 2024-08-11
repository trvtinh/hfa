import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AddChoice extends StatefulWidget {
  final String name;
  const AddChoice({super.key, required this.name});

  @override
  State<AddChoice> createState() => _AddChoiceState();
}

class _AddChoiceState extends State<AddChoice> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(
        widget.name,
        style: TextStyle(
          fontSize: 14,
          color: Theme.of(context).colorScheme.onSecondaryContainer,
        ),
      ), 
      selected: value,
      onSelected: (newState){
        setState(() {
          value = newState;
        });
      },
    );
  }
}