import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_for_all/pages/medical_data_homepage/view.dart';

class Orangebox extends StatelessWidget {
  final String val1;
  final String val2;
  final String val3;
  final String time;

  const Orangebox({
    super.key,
    required this.val1,
    required this.val2,
    required this.val3,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => MedicalDataHome(
              time: time,
            ));
      },
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Theme.of(context).colorScheme.errorContainer,
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.3),
              spreadRadius: 1,
              blurRadius: 2,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Dữ liệu sức khỏe",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                Icon(
                  Icons.open_in_new,
                  size: 16,
                ),
              ],
            ),
            SizedBox(height: 8,),
            Row(
              children: [
                const Icon(
                  Icons.monitor_heart_outlined,
                  size: 48,
                  color: Color.fromRGBO(101, 85, 143, 1),
                ),
                SizedBox(width: 12,),
                Column(
                  children: [
                    const Text(
                      "Chưa cập nhật",
                      style: TextStyle(
                        fontSize: 12,
                        color: Color.fromRGBO(121, 116, 126, 1),
                      ),
                    ),
                    Text(
                      val1,
                      style: const TextStyle(
                        fontSize: 22,
                        color: Color.fromRGBO(179, 38, 30, 1),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 16,),
                Column(
                  children: [
                    const Text(
                      "Đã cập nhật",
                      style: TextStyle(
                        fontSize: 12,
                        color: Color.fromRGBO(121, 116, 126, 1),
                      ),
                    ),
                    Text(
                      val2,
                      style: const TextStyle(
                        fontSize: 22,
                        color: Color.fromRGBO(52, 199, 89, 1),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 16,),
                Column(
                  children: [
                    const Text(
                      "Tổng số",
                      style: TextStyle(
                        fontSize: 12,
                        color: Color.fromRGBO(121, 116, 126, 1),
                      ),
                    ),
                    Text(
                      val3,
                      style: const TextStyle(
                        fontSize: 22,
                        color: Color.fromRGBO(29, 27, 32, 1),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  time,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color.fromRGBO(121, 116, 126, 1),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
