import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:health_for_all/common/API/item.dart';
import 'package:health_for_all/pages/diagnostic/information.dart';
import 'package:health_for_all/pages/diagnostic_add/widget/from_doctor.dart';
import 'package:health_for_all/pages/diagnostic_add/widget/view_data_box.dart';
import 'package:health_for_all/pages/diagnostic_detail/widget/doctor_diagnostic.dart';
import 'package:health_for_all/pages/diagnostic_detail/widget/patient_box.dart';
import 'package:image_picker/image_picker.dart';

class DetailView extends StatefulWidget {
  final int index;
  final int page;

  const DetailView({
    super.key,
    required this.index,
    required this.page,
  });

  @override
  State<DetailView> createState() => DetailViewState();
}

class DetailViewState extends State<DetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chi tiết chẩn đoán'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 40,
                    child: Text(
                      'Chẩn đoán tới',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                        fontSize: 14,
                      ),
                    ),
                  )
                ],
              ),
              widget.page == 1
                  ? PatientBox(
                      avapath: Unread.avapath[widget.index],
                      name: Unread.users[widget.index],
                      gender: Unread.gender[widget.index],
                      age: Unread.age[widget.index],
                      person: Unread.person[widget.index],
                    )
                  : widget.page == 2
                      ? PatientBox(
                          avapath: Important.avapath[widget.index],
                          name: Important.users[widget.index],
                          gender: Important.gender[widget.index],
                          age: Important.age[widget.index],
                          person: Important.person[widget.index],
                        )
                      : PatientBox(
                          avapath: Seen.avapath[widget.index],
                          name: Seen.users[widget.index],
                          gender: Seen.gender[widget.index],
                          age: Seen.age[widget.index],
                          person: Seen.person[widget.index],
                        ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 40,
                    child: Text(
                      'Loại dữ liệu',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                        fontSize: 14,
                      ),
                    ),
                  )
                ],
              ),
              buildMedicalDataList(context),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 40,
                    child: Text(
                      'Chẩn đoán',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                        fontSize: 14,
                      ),
                    ),
                  )
                ],
              ),
              DoctorDiagnostic(
                  note: widget.page == 1
                      ? Unread.notifications[widget.index]
                      : widget.page == 2
                          ? Important.notifications[widget.index]
                          : Seen.notifications[widget.index]),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 40,
                    child: Text(
                      'Chẩn đoán',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                        fontSize: 14,
                      ),
                    ),
                  )
                ],
              ),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                      width: 1, color: Theme.of(context).colorScheme.outline),
                ),
                child: Column(
                  children: [
                    _buildFileList(),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              widget.page == 1
                  ? FromDoctor(doctorname: Unread.doctors[widget.index])
                  : widget.page == 2
                      ? FromDoctor(doctorname: Important.doctors[widget.index])
                      : FromDoctor(doctorname: Seen.doctors[widget.index])
            ],
          ),
        ),
      ),
    );
  }

  List<XFile> updateselectedFiles() {
    if (widget.index == 1) {
      return Unread.files[widget.index];
    } else if (widget.index == 2) {
      return Important.files[widget.index];
    }
    return Seen.files[widget.index];
  }

  List<String> updatetimedate() {
    if (widget.index == 1) {
      return Unread.timeDate;
    } else if (widget.index == 2) {
      return Important.timeDate;
    }
    return Seen.timeDate;
  }

  List<String> updatetitle() {
    if (widget.index == 1) {
      return Unread.titles[widget.index];
    } else if (widget.index == 2) {
      return Important.titles[widget.index];
    }
    return Seen.titles[widget.index];
  }

  List<String> updatetimes() {
    if (widget.index == 1) {
      return Unread.times[widget.index];
    } else if (widget.index == 2) {
      return Important.times[widget.index];
    }
    return Seen.times[widget.index];
  }

  List<String> updatevalues() {
    if (widget.index == 1) {
      return Unread.values[widget.index];
    } else if (widget.index == 2) {
      return Important.values[widget.index];
    }
    return Seen.values[widget.index];
  }

  late List<XFile> selectedFiles = updateselectedFiles();
  late List<String> timedate = updatetimedate();
  late List<String> title = updatetitle();
  late List<String> time = updatetimes();
  late List<String> value = updatevalues();

  Widget buildMedicalDataList(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          width: 1,
          color: Theme.of(context).colorScheme.outlineVariant,
        ),
      ),
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8), topRight: Radius.circular(8)),
              color: Theme.of(context).colorScheme.surfaceContainerHigh,
            ),
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: Text(timedate[widget.index]),
          ),
          // ListView.builder(
          //   itemCount: title.length,
          //   itemBuilder: (context, index) {
          //     return ViewDataBox(
          //       leadingiconpath: Item.getIconPath(int.parse(title[index])),
          //       title: Item.getTitle(int.parse(title[index])),
          //       value: value[index],
          //       unit: Item.getUnit(int.parse(title[index])),
          //       noteController: TextEditingController(),
          //       time: time[index],
          //     );
          //   },
          // ),
          for (int i = 0; i < title.length; i++)
            ViewDataBox(
              leadingiconpath: Item.getIconPath(int.parse(title[i])),
              title: Item.getTitle(int.parse(title[i])),
              value: value[i],
              unit: Item.getUnit(int.parse(title[i])),
              noteController: TextEditingController(),
              time: time[i],
            ),

          //   ViewDataBox(
          //     leadingiconpath: Item.getIconPath(int.parse(title[0])),
          //     title: Item.getTitle(int.parse(title[0])),
          //     value: value[0],
          //     unit: Item.getUnit(int.parse(title[0])),
          //     noteController: TextEditingController(),
          //     time: time[0],
          //   ),
          // ViewDataBox(
          //   leadingiconpath: Item.getIconPath(int.parse(title[1])),
          //   title: Item.getTitle(int.parse(title[1])),
          //   value: value[1],
          //   unit: Item.getUnit(int.parse(title[1])),
          //   noteController: TextEditingController(),
          //   time: time[1],
          // ),
          // ViewDataBox(
          //   leadingiconpath: Item.getIconPath(int.parse(title[2])),
          //   title: Item.getTitle(int.parse(title[2])),
          //   value: value[2],
          //   unit: Item.getUnit(int.parse(title[2])),
          //   noteController: TextEditingController(),
          //   time: time[2],
          // ),
        ],
      ),
    );
  }

  Widget _buildFileList() {
    if (selectedFiles.isEmpty) {
      return DottedBorder(
        borderType: BorderType.RRect,
        radius: const Radius.circular(4),
        dashPattern: const [2, 3],
        color: Theme.of(context).colorScheme.outline,
        child: Container(
          // width: 260,
          height: 32,
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
          alignment: Alignment.topLeft,
          child: Text(
            'Không có file đính kèm',
            style: TextStyle(color: Theme.of(context).colorScheme.outline),
          ),
        ),
      );
    } else {
      return ListView.builder(
        shrinkWrap: true,
        itemCount: selectedFiles.length,
        itemBuilder: (context, index) {
          final XFile file = selectedFiles[index];
          return _buildFileItem(file);
        },
      );
    }
  }

  Widget _buildFileItem(XFile file) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).colorScheme.primaryContainer,
        ),
        child: Row(
          children: [
            Icon(
              _getFileIcon(file),
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                file.name,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconData _getFileIcon(XFile file) {
    final String extension = file.name.split('.').last;
    switch (extension.toLowerCase()) {
      case 'jpg':
      case 'jpeg':
      case 'png':
      case 'gif':
        return Icons.image;
      case 'mp4':
      case 'avi':
      case 'mov':
        return Icons.video_file;
      case 'pdf':
        return Icons.picture_as_pdf;
      default:
        return Icons.insert_drive_file;
    }
  }
}
