import 'package:flutter/material.dart';

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
  State<ComboBox> createState() => _ComboBoxState();
}

class _ComboBoxState extends State<ComboBox> {
  final infor = TextEditingController();
  bool ischeck = false; // Moved ischeck here

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          ischeck = !ischeck;
        });
        if (!ischeck) {
          print('true');
        } else {
          print('false');
        
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Image.asset(widget.leadingiconpath),
                          SizedBox(width: 10,),
                          Text(
                            widget.title,
                            style: const TextStyle(
                              fontSize: 24,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 24,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 150,
                            height: 78,
                            child: TextField(
                              controller: infor,
                              decoration: const InputDecoration(
                                labelText: 'Giá trị đo',
                                hintText: "Giá trị",
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          SizedBox(width: 20,),
                          Container(
                            width: 120,
                            height: 78,
                            child: TextField(
                              controller: infor,
                              decoration: const InputDecoration(
                                labelText: 'Đơn vị',
                                hintText: 'lần/phút',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 290,
                            height: 56,
                            child: TextField(
                              controller: infor,
                              decoration: InputDecoration(
                                labelText: 'Ghi chú',
                                hintText: 'Ghi chú',
                                border: OutlineInputBorder(),
                                prefixIcon: Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Icon(
                                    Icons.edit_note,
                                    color: Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 24,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Align(
                            alignment: Alignment.centerRight,
                            child: Row(
                              children: [
                                ElevatedButton(
                                  onPressed: (){
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
                                SizedBox(width: 16,),
                                ElevatedButton(
                                  onPressed: (){
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
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            }
          );
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 72,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: ischeck ? Theme.of(context).colorScheme.primaryContainer : Theme.of(context).colorScheme.surface,
        ),
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  //Icon
                  Image.asset(widget.leadingiconpath),
                  // Tên chỉ số
                  const SizedBox(width: 8),
                  Container(
                    height: 55,
                    width: MediaQuery.of(context).size.width / 4,
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
                    width: MediaQuery.of(context).size.width / 4,
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
                ],
              ),
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
