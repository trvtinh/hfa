import 'package:flutter/material.dart';

class ComboBox extends StatefulWidget {
  final String leadingiconpath;
  final String title;
  final String value;
  final String unit;
  final IconButton? edit;
  final IconButton? upload;
  final bool check;

  const ComboBox({super.key, required this.leadingiconpath, required this.title, required this.value, required this.unit, this.edit, this.upload, required this.check});

  @override
  State<ComboBox> createState() => _ComboBoxState();
}

class IconWidget extends StatelessWidget {
  final Icon icon;

  const IconWidget({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: icon,
    );
  }
}

class IconWidgetRound extends StatelessWidget {
  final Icon icon;

  const IconWidgetRound({super.key, required this.icon});

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

class _ComboBoxState extends State<ComboBox> {
  @override
  Widget build(BuildContext context) {
    bool? ischeck = widget.check;
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 72,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: widget.check ? Theme.of(context).colorScheme.primaryContainer : Theme.of(context).colorScheme.surface,
      ),
      child: Row(
        children: [
          Expanded(
            child: Row(children: [
              //Icon
              Image.asset(widget.leadingiconpath),

              // Tên chỉ số
              const SizedBox(width: 8),
              SizedBox(
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
              SizedBox(
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
            ],),
          ),
          // Chỉnh sửa
          const IconWidgetRound(icon: Icon(Icons.edit_note)),
          const SizedBox(width: 8,),
          // Thêm file
          const IconWidgetRound(icon: Icon(Icons.attach_file)),
          const SizedBox(width: 15,),
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