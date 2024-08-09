import 'package:flutter/material.dart';

class AddNewData extends StatefulWidget {
  final String leadingiconpath;
  final String title;
  final String value;
  final String unit;
  final IconButton? edit;
  final IconButton? upload;
  final bool check;
  final Function()? onTap;
  AddNewData({super.key, required this.leadingiconpath, required this.title, required this.value, required this.unit, this.edit, this.upload, required this.check, required this.onTap, });

  @override
  State<AddNewData> createState() => _ComboBoxState();
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



void toggle(){
  
}

class _ComboBoxState extends State<AddNewData> {
  final infor = TextEditingController();
  @override
  Widget build(BuildContext context) {
    bool? ischeck = false;
    return GestureDetector(
      onTap: (){
        showDialog(
          context: context, 
          builder: (BuildContext context){
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  
                ),
              ),
            );
          }
        );
      },
      child: Container(
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
            IconWidgetRound(icon: const Icon(Icons.edit_note)),
            const SizedBox(width: 8,),
            // Thêm file
            IconWidgetRound(icon: const Icon(Icons.attach_file)),
            const SizedBox(width: 15,),
            // TickBox
            Checkbox(
              value: ischeck,
              onChanged: (bool? value) {
                setState(() {
                  ischeck = value!;
                });
              },
            ),     
          ],
        ),
      ),
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