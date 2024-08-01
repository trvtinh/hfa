import 'package:flutter/material.dart';

class ComboBox extends StatefulWidget {
  final Icon leadingicon;
  final String title;
  final String value;
  final String unit;
  final IconButton? edit;
  final IconButton? upload;
  final bool check;

  const ComboBox({super.key, required this.leadingicon, required this.title, required this.value, required this.unit, this.edit, this.upload, required this.check});

  @override
  State<ComboBox> createState() => _ComboBoxState();
}

class IconWidget extends StatelessWidget {
  final Icon icon;

  IconWidget({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: icon,
    );
  }
}

class IconWidgetRound extends StatelessWidget {
  final Icon icon;

  IconWidgetRound({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: icon,
      ),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
    );
  }
}

class _ComboBoxState extends State<ComboBox> {
  @override
  Widget build(BuildContext context) {
    bool? ischeck = widget.check;
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 72,
      decoration: BoxDecoration(
        color: widget.check ? Theme.of(context).colorScheme.primaryContainer : Theme.of(context).colorScheme.surface,
      ),
      child: Row(
        children: [
          //Icon
          SizedBox(width: 12),
          IconWidget(icon: widget.leadingicon),

          // Tên chỉ số
          SizedBox(width: 8),
          Container(
            height: 55,
            width: MediaQuery.of(context).size.width/4,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.title,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontWeight: FontWeight.w500
                ),
              ),
            ),
          ),

          // Số đo
          Container(
            height: 55,
            width: MediaQuery.of(context).size.width/4,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    widget.value,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                      fontWeight: FontWeight.w500,
                      fontSize: 20
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    widget.unit,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Chỉnh sửa
          IconWidgetRound(icon: Icon(Icons.edit_note)),
          SizedBox(width: 8,),
          // Thêm file
          IconWidgetRound(icon: Icon(Icons.attach_file)),
          SizedBox(width: 15,),
          // TickBox
          Checkbox(
            value: ischeck,
            onChanged: (bool? value) {
              setState(() {
                ischeck = value;
              });
            },
          ),     
        ],
      ),
    );
  }
}