import 'package:flutter/material.dart';

class GreyBox extends StatefulWidget {
  final String title;
  final String iconpath;
  final String value;
  final String unit;
  final String time;
  final Icon? warning;

  const GreyBox(
      {super.key,
      required this.title,
      required this.iconpath,
      required this.value,
      required this.unit,
      required this.time,
      this.warning});

  @override
  State<GreyBox> createState() => GreyBoxState();
}

class IconWarning extends StatelessWidget {
  final Icon icon;

  const IconWarning({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: icon,
    );
  }
}

class GreyBoxState extends State<GreyBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 112,
      width: 186,
      // padding: Padding(

      // ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: const Color.fromRGBO(243, 237, 247, 1),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.15),
              spreadRadius: 1,
              blurRadius: 3,
              // offset: Offset(0, 3), // changes position of shadow
            )
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: 162,
            height: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 12,
                    color: Color.fromRGBO(29, 27, 32, 1),
                  ),
                ),
                Icon(
                  Icons.open_in_new_outlined,
                  size: 16,
                ),
              ],
            ),
          ),
          SizedBox(
            width: 162,
            height: 40,
            child: Row(
              children: [
                Image.asset(widget.iconpath),
                const SizedBox(
                  width: 8,
                ),
                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        widget.value,
                        style: TextStyle(
                          fontSize: 28,
                          color: Color.fromRGBO(33, 0, 93, 1),
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        widget.unit,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 11,
                          color: Color.fromRGBO(98, 91, 113, 1),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            width: 162,
            height: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.time,
                  style: TextStyle(
                    color: Color.fromRGBO(121, 116, 126, 1),
                    fontSize: 12,
                  ),
                ),
                const IconWarning(
                    icon: Icon(
                  size: 16,
                  Icons.priority_high_outlined,
                  color: Color.fromRGBO(179, 38, 30, 1),
                )),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Medical_data_Home extends StatelessWidget {
  const Medical_data_Home({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            const Divider(
              color: Colors.black,
              thickness: 0.5,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 40,
              child: const Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // SizedBox(
                      //   width: 2,
                      // ),
                      Icon(
                        Icons.monitor_heart_outlined,
                        size: 24,
                        color: Color.fromRGBO(73, 69, 79, 1),
                      ),
                      Text(
                        "Dữ liệu y tế",
                        selectionColor: Color.fromRGBO(73, 69, 79, 1),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Cập nhật lúc 06:00, 27/07/2024",
                        style: TextStyle(
                          color: Color.fromRGBO(121, 116, 126, 1),
                          fontSize: 12,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            const Divider(
              color: Colors.black,
              thickness: 0.5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 64,
                  width: 186,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Color.fromRGBO(234, 221, 255, 1),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.widgets_outlined,
                        size: 40,
                        color: Color.fromRGBO(101, 85, 143, 1),
                      ),
                      SizedBox(
                        width: 114,
                        height: 40,
                        // child: Align(
                        //   alignment: Alignment.centerLeft,
                        //   child: Text(
                        //     "Tất cả",
                        //     style: TextStyle(
                        //       color: Color.fromRGBO(33, 0, 93, 1),
                        //       fontSize: 24,
                        //     ),
                        //   ),
                        // )
                        child: Row(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Tất cả",
                                style: TextStyle(
                                  color: Color.fromRGBO(33, 0, 93, 1),
                                  fontSize: 24,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                "tp",
                                style: TextStyle(
                                  color: Color.fromRGBO(33, 0, 93, 1),
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Text(
                      //   style: TextStyle(
                      //     fontSize: 20,
                      //   ),
                      // ),
                      // SizedBox(
                      //   width: 32,
                      // ),
                    ],
                  ),
                ),
                Container(
                  height: 64,
                  width: 186,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Color.fromRGBO(234, 221, 255, 1),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.add_circle_outline,
                        size: 40,
                        color: Color.fromRGBO(101, 85, 143, 1),
                      ),
                      Text(
                        "Thêm",
                        style: TextStyle(
                          fontSize: 20,
                          color: Color.fromRGBO(33, 0, 93, 1),
                        ),
                      ),
                      SizedBox(
                        width: 32,
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GreyBox(
                    title: 'Nhịp tim',
                    iconpath: 'mobile/assets/images/nhip_tim.png',
                    value: '80',
                    unit: 'lần/phút',
                    time: '06:00, 27/07/2024'),
                GreyBox(
                    title: 'SPO2',
                    iconpath: 'assets/medical_data_Home_images/spo2.png',
                    value: '98',
                    unit: '%%',
                    time: '06:00, 27/07/2024'),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GreyBox(
                    title: 'Huyết áp',
                    iconpath:
                        'assets/medical_data_Home_images/blood-pressure.png',
                    value: '120/80',
                    unit: 'mmHg',
                    time: '06:00, 27/07/2024'),
                GreyBox(
                    title: 'Đường huyết',
                    iconpath: 'assets/medical_data_Home_images/blood sugar.png',
                    value: '100',
                    unit: 'mg/dL',
                    time: '06:00, 27/07/2024'),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GreyBox(
                  title: 'HRV',
                  iconpath:
                      'assets/medical_data_Home_images/favorite_border.png',
                  value: '--',
                  unit: 'ms',
                  time: '-',
                ),
                GreyBox(
                  title: 'ECG',
                  iconpath: 'assets/medical_data_Home_images/ecg-outline.png',
                  value: 'ECG',
                  unit: ' ',
                  time: '06:00, 27/07/2024',
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GreyBox(
                  title: 'Thân nhiệt',
                  iconpath: 'assets/medical_data_Home_images/thermometer.png',
                  value: '36',
                  unit: '°C',
                  time: '06:00, 20/07/2024',
                ),
                GreyBox(
                  title: 'Axit Uric',
                  iconpath: 'assets/medical_data_Home_images/Axit Uric.png',
                  value: '7.0',
                  unit: 'mg/dL',
                  time: '06:00, 21/07/2024',
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GreyBox(
                  title: 'Cân nặng',
                  iconpath: 'assets/medical_data_Home_images/scale.png',
                  value: '70',
                  unit: 'Kg',
                  time: '06:00, 27/07/2024',
                ),
                GreyBox(
                  title: 'Phiếu xét nghiệm máu',
                  iconpath:
                      'assets/medical_data_Home_images/medical_information.png',
                  value: 'OK',
                  unit: ' ',
                  time: '06:00, 01/07/2024',
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GreyBox(
                  title: 'Kết quả khám',
                  iconpath:
                      'assets/medical_data_Home_images/medical_information.png',
                  value: 'OK',
                  unit: ' ',
                  time: '06:00, 27/07/2024',
                ),
                const SizedBox(
                  height: 112,
                  width: 186,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
