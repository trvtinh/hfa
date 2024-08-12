import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_for_all/pages/medical_data_homepage/Widget/GreyBox.dart';
import 'package:health_for_all/pages/overall_medical_data_history/view.dart';

class Medical_data_Home extends StatelessWidget {
  const Medical_data_Home({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dữ liệu sức khỏe'),
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/images/HFA_small_icon.png',
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 40,
              decoration: BoxDecoration(
                  border: Border(
                top: BorderSide(
                  color: Color.fromRGBO(202, 196, 208, 1),
                  width: 1,
                ),
                bottom: BorderSide(
                  color: Color.fromRGBO(202, 196, 208, 1),
                  width: 1,
                ),
              )),
              padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: const Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 155,
                        height: 22,
                        child: Row(
                          children: [
                            Icon(
                              Icons.monitor_heart_outlined,
                              size: 24,
                              color: Color.fromRGBO(73, 69, 79, 1),
                            ),
                            SizedBox(width: 8),
                            SizedBox(
                              height: 18,
                              child: Text(
                                "Dữ liệu y tế",
                                selectionColor: Color.fromRGBO(73, 69, 79, 1),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // SizedBox(width: 8),
                      SizedBox(
                        width: 181,
                        height: 16,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "Cập nhật lúc 06:00, 27/07/2024",
                            style: TextStyle(
                              color: Color.fromRGBO(121, 116, 126, 1),
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: (){
                    Get.to(()=>OverallMedicalDataHistoryPage());
                  },
                  child: Container(
                    height: 64,
                    width: 186,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Color.fromRGBO(234, 221, 255, 1),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.3),
                            blurRadius: 2,
                          ),
                        ]),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 12,
                        ),
                        Icon(
                          Icons.widgets_outlined,
                          size: 40,
                          color: Color.fromRGBO(101, 85, 143, 1),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text("Tất cả",
                            style: TextStyle(
                              color: Color.fromRGBO(33, 0, 93, 1),
                              fontSize: 24,
                            )),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 64,
                  width: 186,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Color.fromRGBO(234, 221, 255, 1),
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.3),
                          blurRadius: 2,
                        ),
                      ]),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 12,
                      ),
                      Icon(
                        Icons.add_circle_outline,
                        size: 40,
                        color: Color.fromRGBO(101, 85, 143, 1),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Thêm",
                        style: TextStyle(
                          fontSize: 20,
                          color: Color.fromRGBO(33, 0, 93, 1),
                        ),
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
                  iconpath: 'assets/medical_data_Home_images/heart-rate.png',
                  value: '80',
                  unit: 'lần/phút',
                  time: '06:00, 27/07/2024',
                  warning: false,
                ),
                GreyBox(
                  title: 'SPO2',
                  iconpath: 'assets/medical_data_Home_images/spo2.png',
                  value: '98',
                  unit: '%',
                  time: '06:00, 27/07/2024',
                  warning: false,
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
                  title: 'Huyết áp',
                  iconpath:
                      'assets/medical_data_Home_images/blood-pressure.png',
                  value: '120/80',
                  unit: 'mmHg',
                  time: '06:00, 27/07/2024',
                  warning: false,
                ),
                GreyBox(
                  title: 'Đường huyết',
                  iconpath: 'assets/medical_data_Home_images/blood sugar.png',
                  value: '100',
                  unit: 'mg/dL',
                  time: '06:00, 27/07/2024',
                  warning: false,
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
                  title: 'HRV',
                  iconpath:
                      'assets/medical_data_Home_images/favorite_border.png',
                  value: '--',
                  unit: 'ms',
                  time: '-',
                  warning: false,
                ),
                GreyBox(
                  title: 'ECG',
                  iconpath: 'assets/medical_data_Home_images/ecg-outline.png',
                  value: 'ECG',
                  unit: ' ',
                  time: '06:00, 27/07/2024',
                  warning: false,
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
                  warning: true,
                ),
                GreyBox(
                  title: 'Axit Uric',
                  iconpath: 'assets/medical_data_Home_images/Axit Uric.png',
                  value: '7.0',
                  unit: 'mg/dL',
                  time: '06:00, 21/07/2024',
                  warning: true,
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
                  warning: false,
                ),
                GreyBox(
                  title: 'Phiếu xét nghiệm máu',
                  iconpath:
                      'assets/medical_data_Home_images/medical_information.png',
                  value: 'OK',
                  unit: ' ',
                  time: '06:00, 01/07/2024',
                  warning: true,
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
                  warning: true,
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
