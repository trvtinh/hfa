import 'package:flutter/material.dart';
import 'package:health_for_all/common/entities/user.dart';
import 'package:health_for_all/pages/following_medical_data/widget/following_person_box.dart';

class SendDiagnostic extends StatelessWidget {
  const SendDiagnostic({super.key, required this.user});
  final UserData user;
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            width: 1,
          ),
        ),
        padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 40,
                  width: 175,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(12, 10, 16, 10),
                    child: Row(
                      children: [
                        Icon(
                          Icons.tune,
                          color: Theme.of(context).colorScheme.primary,
                          size: 18,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          'Gửi chẩn đoán tới',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            FollowingPersonBox(
              avapath: user.photourl!,
              name: user.name!,
              gender: user.gender != "" ? user.gender! : "chưa cập nhật",
              age: user.age != 0 ? user.age!.toString() : "chưa cập nhật",
              person: "Bệnh nhân",
            ),
          ],
        ),
      ),
    );
  }
}
