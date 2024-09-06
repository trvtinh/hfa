import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_for_all/pages/type_med_history/widget/data_day.dart';
import 'package:health_for_all/pages/type_med_history/widget/line_chart_sample.dart';
import 'package:intl/intl.dart';

class TypeMedHistory extends StatefulWidget {
  final String title;
  const TypeMedHistory(this.title, {super.key});

  @override
  _TypeMedHistoryState createState() => _TypeMedHistoryState();
}

class _TypeMedHistoryState extends State<TypeMedHistory> {
  // Use List<List<String>> for hour and index
  List<String> day = [
    "27/07/2024",
    "26/07/2024",
  ];

  List<List<String>> hour = [
    ["06:00"], // First entry has one time
    ["10:00", "14:00"], // Second entry has two times
  ];

  List<List<String>> index = [
    ["120/80"], // First entry corresponds to one index value
    ["115/75", "125/85"], // Second entry corresponds to two index values
  ];
  bool change_page = true;
  bool show_comment = true;
  bool show_diagnostic = false;
  bool show_alarm = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title), // Use widget.title in StatefulWidget
        actions: [
          GestureDetector(
              onTap: () {
                setState(() {
                  change_page = !change_page;
                });
              },
              child: change_page
                  ? Icon(
                      Icons.list_outlined,
                      size: 24,
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    )
                  : Icon(
                      Icons.assessment_outlined,
                      size: 24,
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    )),
          SizedBox(
            width: 12,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Divider(
              height: 1,
            ),
            navigate(context),
            Divider(
              height: 2,
              color: Colors.black,
            ),
            if (change_page)
              for (int i = 0; i < day.length; i++)
                DataDay(day: day[i], hour: hour[i], index: index[i])
            else
              LineChartSample(
                show_comment: show_comment,
                show_diagnostic: show_diagnostic,
                show_alarm: show_alarm, 
                title: widget.title,
              ),
          ],
        ),
      ),
    );
  }

  Widget navigate(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: GestureDetector(
        child: Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(18)),
                        ),
                        padding: EdgeInsets.all(16),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 30,
                            ),
                            Row(
                              children: [
                                _buildDateTimeField(
                                  context,
                                  'Từ ngày',
                                  Icons.today,
                                  selectDate,
                                  TextEditingController(),
                                  width:
                                      (MediaQuery.of(context).size.width - 44) /
                                          2,
                                ),
                                const SizedBox(
                                  width: 12,
                                ),
                                _buildDateTimeField(
                                  context,
                                  'Tới ngày',
                                  Icons.today,
                                  selectDate,
                                  TextEditingController(),
                                  width:
                                      (MediaQuery.of(context).size.width - 44) /
                                          2,
                                ),
                              ],
                            ),
                            Expanded(
                              child: CalendarDatePicker(
                                firstDate: DateTime(2020),
                                lastDate: DateTime(2100),
                                initialDate: DateTime.now(),
                                onDateChanged: (DateTime date) {
                                  // Handle date selection
                                },
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                backgroundColor: Colors.transparent,
                              ),
                              onPressed: () {
                                Get.back();
                              },
                              child: Text("Chọn"),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.arrow_back_ios,
                      size: 20,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    Text(
                      "28/07/2024",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      " - ",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "03/08/2024",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                        fontSize: 16,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
                onTap: () {
                  setState(() {
                    show_comment = true;
                    show_alarm = false;
                    show_diagnostic = false;
                  });
                },
                child: icon_round(context, show_comment,
                    icon: Icons.comment_outlined)),
            SizedBox(
              width: 6,
            ),
            GestureDetector(
                onTap: () {
                  setState(() {
                    show_comment = false;
                    show_alarm = false;
                    show_diagnostic = true;
                  });
                },
                child: image_round(
                    context, show_diagnostic, "assets/images/result2.png")),
            SizedBox(
              width: 6,
            ),
            GestureDetector(
                onTap: () {
                  setState(() {
                    show_comment = false;
                    show_alarm = true;
                    show_diagnostic = false;
                  });
                },
                child: icon_round(context, show_alarm,
                    icon: Icons.warning_amber_outlined)),
          ],
        ),
      ),
    );
  }

  Widget icon_round(BuildContext context, bool choose, {IconData? icon}) {
    return Container(
      decoration: BoxDecoration(
        color: choose
            ? Theme.of(context).colorScheme.inversePrimary
            : Colors.white,
        shape: BoxShape.circle,
        border: Border.all(color: Theme.of(context).colorScheme.outlineVariant),
      ),
      padding: EdgeInsets.all(4),
      child: Icon(
        icon,
        color: Theme.of(context).colorScheme.primary,
        size: 18,
      ),
    );
  }

  Widget image_round(BuildContext context, bool choose, String path) {
    return Container(
      decoration: BoxDecoration(
        color: choose
            ? Theme.of(context).colorScheme.inversePrimary
            : Colors.white,
        shape: BoxShape.circle,
        border: Border.all(color: Theme.of(context).colorScheme.outlineVariant),
      ),
      padding: EdgeInsets.all(4),
      child: Image.asset(
        path,
        height: 18,
        width: 18,
      ),
    );
  }

  final dateController = TextEditingController();
  DateTime datetime = DateTime.now();

  // Replace this with your actual method to select date
  Future<void> selectDate(BuildContext context) async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: datetime,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (selectedDate != null) {
      datetime = selectedDate;
      final formattedDate = DateFormat('dd/MM/yyyy').format(selectedDate);
      dateController.text = formattedDate;
    }
  }

  Widget _buildDateTimeField(
      BuildContext context,
      String label,
      IconData icon,
      Future<void> Function(BuildContext) onTap,
      TextEditingController controller,
      {required double width}) {
    return SizedBox(
      width: width,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          prefixIcon:
              Icon(icon, color: Theme.of(context).colorScheme.onSurfaceVariant),
          border: const OutlineInputBorder(),
          labelText: label,
        ),
        readOnly: true,
        onTap: () => onTap(context),
      ),
    );
  }
}
