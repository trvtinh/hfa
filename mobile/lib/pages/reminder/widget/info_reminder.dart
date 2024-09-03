import 'package:flutter/material.dart';

class InfoReminder extends StatefulWidget {
  final String name;
  final String gio;
  final String ngay;
  final List<bool> choosen_day;
  const InfoReminder(
      {super.key, required this.name, required this.gio, required this.ngay, required this.choosen_day});

  @override
  State<InfoReminder> createState() => _InfoReminderState();
}

class _InfoReminderState extends State<InfoReminder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.name,
          style: TextStyle(
            fontSize: 22,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceContainer,
        ),
        child: Column(
          children: [
            Divider(
              height: 1,
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  timeDate(),
                  detail(),
                  drink(),
                  measure(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget measure(){
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 4),
          child: Row(
            children: [
              Text(
                "Đo các loại dữ liệu y tế (3  )",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: Theme.of(context).colorScheme.outlineVariant)),
          child: Column(
            children: [
              data("Huyết áp", "mmHg", "assets/medical_data_Home_images/blood-pressure.png", "--"), Divider(height: 1,),
              data("Nhịp tim", "lần/phút", "assets/medical_data_Home_images/heart-rate.png", "--"), Divider(height: 1,),
              data("Đường huyết", "mg/dL", "assets/medical_data_Home_images/blood sugar.png", "--"),
            ],
          )
        ),
      ],
    );
  }

  Widget data(String name, String unit, String path, String index){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Image.asset(
            path,
            height: 24,
            width: 24,
          ),
          SizedBox(width: 10,),
          Expanded(
            child: Text(
              name,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurface,
                fontSize: 16,
              ),
            ),
          ),
          Container(
            width: 45,
            child: Column(
              children: [
                Text(
                  index,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                    fontSize: 22,
                  ),
                ),
                Text(
                  unit,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
          
          SizedBox(width: 40,),
          Row(
            children: [
              roundIcon(icon: Icons.edit_note_outlined), SizedBox(width: 8,),
              roundIcon(icon: Icons.attach_file_outlined), SizedBox(width: 8,),
              roundIcon(icon: Icons.clear_outlined),
            ],
          ),
        ],
      ),
    );
  }

  Widget roundIcon({IconData? icon}){
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(color: Theme.of(context).colorScheme.outlineVariant,)
      ),
      padding: EdgeInsets.all(4),
      child: Icon(
        icon,
        color: Theme.of(context).colorScheme.outlineVariant,
        size: 18,
      ),
    );
  }

  Widget drink(){
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 4),
          child: Row(
            children: [
              Text(
                "Uống thuốc (1)",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(4),),
          child: _buildDialogTextField(
            TextEditingController(),
            icon1: Icons.medication_liquid_sharp,
            icon2: Icons.open_in_new),
        ),
        SizedBox(height: 8,),
      ],
    );
  }

  Widget detail(){
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 4),
          child: Row(
            children: [
              Text(
                "Nội dung",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(4),),
          child: _buildDialogTextField(
            TextEditingController(),
            icon1: Icons.edit_note),
        ),
        SizedBox(height: 8,),
      ],
    );
  }

  Widget _buildDialogTextField(
  TextEditingController controller, {
  IconData? icon1, 
  IconData? icon2,
}) {
  return TextField(
    readOnly: true,
    controller: controller,
    decoration: InputDecoration(
      hintStyle: TextStyle(
        color: Theme.of(context).colorScheme.outline,
        fontSize: 16,
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: Theme.of(context).colorScheme.outline, 
          width: 1.0
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Theme.of(context).colorScheme.primary, 
          width: 2.0
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Theme.of(context).colorScheme.outlineVariant, 
          width: 1.0
        ),
      ),
      prefixIcon: icon1 != null
        ? Icon(icon1, color: Theme.of(context).colorScheme.primary)
        : null,
      suffixIcon: icon2 != null
        ? Icon(
            icon2, 
            color: Theme.of(context).colorScheme.secondary,
            size: 16,
          )
        : null,
    ),
  );
}


  Widget timeDate() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Row(
            children: [
              Text(
                "Thời gian",
                style: TextStyle(
                  fontSize: 14,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: Theme.of(context).colorScheme.outlineVariant)),
          child: Column(
            children: [
              Row(
                children: [
                  Icon(
                    Icons.schedule_outlined,
                    size: 24,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: Text(
                      widget.gio,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface,
                        fontSize: 22,
                      ),
                    ),
                  ),
                  Text(
                    "Hết hạn: " + widget.ngay,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: Column(
                  children: [
                    Row(
                      children: [
                        choice("T2"), SizedBox(width: 4,),
                        choice("T3"), SizedBox(width: 4,),
                        choice("T4"), SizedBox(width: 4,),
                        choice("T5"), SizedBox(width: 4,),
                      ],
                    ),
                    Row(
                    children: [
                      choice("T6"), SizedBox(width: 4,),
                      choice("T7"), SizedBox(width: 4,),
                      choice("CN"), SizedBox(width: 4,),
                    ],
                  ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 4,),
      ],
    );
  }

  final List<String> _selectedChoices = [];
  Widget choice(String name) {
    bool isSelected = _selectedChoices.contains(name);

    return Container(
      width: (MediaQuery.sizeOf(context).width - 3) / 5,
      child: ChoiceChip(
        label: Text(
          name,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSecondaryContainer,
          ),
        ),
        selected: isSelected,
        selectedColor: Theme.of(context).colorScheme.secondaryContainer,
        onSelected: (bool selected) {
          setState(() {
            if (selected) {
              _selectedChoices.add(name);
            } else {
              _selectedChoices.remove(name);
            }
          });
        },
      ),
    );
  }
}
