import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_for_all/pages/medical_data_homepage/widget/GreyBox.dart';
import 'package:health_for_all/pages/overall_medical_data_history/view.dart';

class MedicalDataHome extends StatelessWidget {
  const MedicalDataHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dữ liệu sức khỏe'),
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('assets/images/HFA_small_icon.png'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
          child: Column(
            children: [
              _buildHeader(context),
              const SizedBox(height: 16),
              _buildButtons(context),
              const SizedBox(height: 16),
              _buildGreyBoxRow1(),
              const SizedBox(height: 16),
              _buildGreyBoxRow2(),
              const SizedBox(height: 16),
              _buildGreyBoxRow3(),
              const SizedBox(height: 16),
              _buildGreyBoxRow4(),
              const SizedBox(height: 16),
              _buildGreyBoxRow5(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 40,
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Color.fromRGBO(202, 196, 208, 1),
            width: 1,
          ),
          bottom: BorderSide(
            color: Color.fromRGBO(202, 196, 208, 1),
            width: 1,
          ),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                Icons.monitor_heart_outlined,
                size: 24,
                color: Color.fromRGBO(73, 69, 79, 1),
              ),
              SizedBox(width: 8),
              Text(
                "Dữ liệu y tế",
                style: TextStyle(
                  color: Color.fromRGBO(73, 69, 79, 1),
                ),
              ),
            ],
          ),
          Text(
            "Cập nhật lúc 06:00, 27/07/2024",
            style: TextStyle(
              color: Color.fromRGBO(121, 116, 126, 1),
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: _buildButton(
            onTap: () {
              Get.to(() => OverallMedicalDataHistoryPage());
            },
            icon: Icons.widgets_outlined,
            label: "Tất cả",
          ),
        ),
        SizedBox(
          width: 15,
        ),
        Expanded(
          child: _buildButton(
            onTap: () {},
            icon: Icons.add_circle_outline,
            label: "Thêm",
          ),
        )
      ],
    );
  }

  Widget _buildButton(
      {required VoidCallback onTap,
      required IconData icon,
      required String label}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 64,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: const Color.fromRGBO(234, 221, 255, 1),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.3),
              blurRadius: 2,
            ),
          ],
        ),
        child: Row(
          children: [
            const SizedBox(width: 12),
            Icon(icon, size: 40, color: const Color.fromRGBO(101, 85, 143, 1)),
            const SizedBox(width: 8),
            Text(
              label,
              style: const TextStyle(
                color: Color.fromRGBO(33, 0, 93, 1),
                fontSize: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGreyBoxRow1() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: GreyBox(
            title: 'Nhịp tim',
            iconpath: 'assets/medical_data_Home_images/heart-rate.png',
            value: '80',
            unit: 'lần/phút',
            time: '06:00, 27/07/2024',
            warning: false,
          ),
        ),
        SizedBox(
          width: 15,
        ),
        Expanded(
          child: GreyBox(
            title: 'SPO2',
            iconpath: 'assets/medical_data_Home_images/spo2.png',
            value: '98',
            unit: '%',
            time: '06:00, 27/07/2024',
            warning: false,
          ),
        ),
      ],
    );
  }

  Widget _buildGreyBoxRow2() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: GreyBox(
            title: 'Huyết áp',
            iconpath: 'assets/medical_data_Home_images/blood-pressure.png',
            value: '120/80',
            unit: 'mmHg',
            time: '06:00, 27/07/2024',
            warning: false,
          ),
        ),
        SizedBox(
          width: 15,
        ),
        Expanded(
          child: GreyBox(
            title: 'Đường huyết',
            iconpath: 'assets/medical_data_Home_images/blood sugar.png',
            value: '100',
            unit: 'mg/dL',
            time: '06:00, 27/07/2024',
            warning: false,
          ),
        ),
      ],
    );
  }

  Widget _buildGreyBoxRow3() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: GreyBox(
            title: 'HRV',
            iconpath: 'assets/medical_data_Home_images/favorite_border.png',
            value: '--',
            unit: 'ms',
            time: '-',
            warning: false,
          ),
        ),
        SizedBox(
          width: 15,
        ),
        Expanded(
          child: GreyBox(
            title: 'ECG',
            iconpath: 'assets/medical_data_Home_images/ecg-outline.png',
            value: 'ECG',
            unit: ' ',
            time: '06:00, 27/07/2024',
            warning: false,
          ),
        ),
      ],
    );
  }

  Widget _buildGreyBoxRow4() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: GreyBox(
            title: 'Thân nhiệt',
            iconpath: 'assets/medical_data_Home_images/thermometer.png',
            value: '36',
            unit: '°C',
            time: '06:00, 20/07/2024',
            warning: true,
          ),
        ),
        SizedBox(
          width: 15,
        ),
        Expanded(
          child: GreyBox(
            title: 'Axit Uric',
            iconpath: 'assets/medical_data_Home_images/Axit Uric.png',
            value: '7.0',
            unit: 'mg/dL',
            time: '06:00, 21/07/2024',
            warning: true,
          ),
        ),
      ],
    );
  }

  Widget _buildGreyBoxRow5() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: GreyBox(
            title: 'Cân nặng',
            iconpath: 'assets/medical_data_Home_images/scale.png',
            value: '70',
            unit: 'Kg',
            time: '06:00, 27/07/2024',
            warning: false,
          ),
        ),
        SizedBox(
          width: 15,
        ),
        Expanded(
          child: GreyBox(
            title: 'Phiếu xét nghiệm máu',
            iconpath: 'assets/medical_data_Home_images/medical_information.png',
            value: 'OK',
            unit: ' ',
            time: '06:00, 01/07/2024',
            warning: true,
          ),
        ),
      ],
    );
  }
}
