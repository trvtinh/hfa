import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_for_all/pages/overall_medical_data_history/widget/medical_history_box.dart';

class ComboBox extends StatefulWidget {
  final String leadingiconpath;
  final String time;
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
    required this.time,
  });

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

void toggle() {}

class _ComboBoxState extends State<ComboBox> {
  final infor = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _showDialog(context);
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 80,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  //Icon
                  Image.asset(widget.leadingiconpath),

                  // Tên chỉ số và giờ
                  const SizedBox(width: 8),
                  Container(
                    height: 63,
                    width: MediaQuery.of(context).size.width / 4,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  widget.title,
                                  style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.onSurface,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                widget.time,
                                style: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSurfaceVariant,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ],
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
                                color: Theme.of(context)
                                    .colorScheme
                                    .onPrimaryContainer,
                                fontWeight: FontWeight.w500,
                                fontSize: 20),
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
            IconWidgetRound(
                icon: Icon(
              Icons.edit_note,
              color: Theme.of(context).colorScheme.outline,
              size: 17,
            )),
            const SizedBox(
              width: 8,
            ),
            // Thêm file
            IconWidgetRound(
                icon: Icon(
              Icons.attach_file,
              color: Theme.of(context).colorScheme.outline,
              size: 17,
            )),
            const SizedBox(
              width: 15,
            ),
            // Comment
            IconWidgetRound(
                icon: Icon(
              Icons.comment,
              color: Theme.of(context).colorScheme.outline,
              size: 17,
            )),
            const SizedBox(
              width: 8,
            ),
            // Đánh giá
            ImageWidgetRound(
              path: 'assets/images/xet_nghiem_mau.png',
            ),
            const SizedBox(
              width: 8,
            ),
          ],
        ),
      ),
    );
  }

  static String _getTime(int index) {
    const titles = [
      '06:00,  29/07/2024',
      '06:00,  29/07/2024',
      '06:00,  29/07/2024',
      '06:00,  29/07/2024',
      '06:00,  29/07/2024',
      '06:00,  29/07/2024',
    ];
    return titles[index];
  }

  static String _getUnit(int index) {
    const units = [
      'mmHg',
      'mmHg',
      'mmHg',
      'mmHg',
      'mmHg',
      'mmHg',
    ];
    return units[index];
  }

  static String _getValue(int index) {
    const titles = [
      '120/80',
      '120/80',
      '120/80',
      '120/80',
      '120/80',
      '120/80',
    ];
    return titles[index];
  }

  // void _showDialog(BuildContext context) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return Dialog(
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(20.0),
  //         ),
  //         child: Container(
  //           height: 500,
  //           width: 100,
  //           padding: EdgeInsets.all(20.0),
  //           child: Column(
  //             mainAxisSize: MainAxisSize.min,
  //             children: [
  //               Text(
  //                 'Popup Title',
  //                 style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
  //               ),
  //               SizedBox(height: 20.0),
  //               Text('container.'),
  //               SizedBox(height: 20.0),
  //               ElevatedButton(
  //                 onPressed: () {
  //                   Navigator.of(context).pop();
  //                 },
  //                 child: Text('Close'),
  //               ),
  //             ],
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(16),
              width: 380,
              height: 640,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildDialogHeader(),
                  _buildHistory(),
                  // const SizedBox(height: 24),
                  // _buildDialogInputFields(),
                  // const SizedBox(height: 4),
                  // AddFile(
                  //   files: selectedFiles,
                  //   onFilesChanged: updateFiles,
                  // ),
                  // const SizedBox(height: 24),
                  // _buildDialogActions(context),
                ],
              ),
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

  Column _buildHistory() {
    return Column(
      children: [
        MedicalHistoryBox(
            time: _getTime(0), value: _getValue(0), unit: _getUnit(0)),
        MedicalHistoryBox(
            time: _getTime(1), value: _getValue(1), unit: _getUnit(1)),
        MedicalHistoryBox(
            time: _getTime(2), value: _getValue(2), unit: _getUnit(2)),
        MedicalHistoryBox(
            time: _getTime(3), value: _getValue(3), unit: _getUnit(3)),
        MedicalHistoryBox(
            time: _getTime(4), value: _getValue(4), unit: _getUnit(4)),
        MedicalHistoryBox(
            time: _getTime(5), value: _getValue(5), unit: _getUnit(5)),
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

class ImageWidgetRound extends StatelessWidget {
  final String path;

  ImageWidgetRound({required this.path});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Image.asset(
          path,
          height: 17,
        ),
      ),
    );
  }
}
