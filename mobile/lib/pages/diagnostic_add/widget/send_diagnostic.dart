import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:health_for_all/pages/diagnostic_add/information.dart';
import 'package:health_for_all/pages/diagnostic_add/widget/patient_box_full.dart';
import 'package:health_for_all/pages/following_medical_data/widget/following_person_box.dart';

class SendDiagnostic extends StatefulWidget {
  @override
  State<SendDiagnostic> createState() => SendDiagnosticState();
}

class SendDiagnosticState extends State<SendDiagnostic> {
  RxInt showpatient = (-1).obs;

  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Obx(
        () => GestureDetector(
          onTap: () {
            showPopup(context);
          },
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
                showpatient.value == -1
                    ? SizedBox(
                        height: 40,
                        width: 356,
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Chưa chọn',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Theme.of(context)
                                  .colorScheme
                                  .secondaryFixedDim,
                            ),
                          ),
                        ),
                      )
                    : FollowingPersonBox(
                        avapath: avapath[showpatient.value],
                        name: patientname[showpatient.value],
                        gender: gender[showpatient.value],
                        age: age[showpatient.value],
                        person: people[showpatient.value])
              ],
            ),
          ),
        ),
      ),
    );
  }

  void init(int index) {
    for (int i = 0; i < ontap.length; i++) {
      ontap[i] = false.obs;
    }
    ontap[index] = true.obs;
  }

  void showPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Obx(
          () => Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(28),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    buildpopupHeader(),
                    const SizedBox(height: 24),
                    buildpopupPeople(),
                    const SizedBox(height: 24),
                    buildpopupActions(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Row buildpopupHeader() {
    return Row(
      children: [
        Icon(
          Icons.tune,
          size: 32,
          color: Theme.of(context).colorScheme.primary,
        ),
        const SizedBox(
          width: 16,
        ),
        Text(
          'Gửi chẩn đoán tới',
          style: TextStyle(
            fontSize: 24,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        )
      ],
    );
  }

  Column buildpopupPeople() {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            init(0);
          },
          child: PatientBoxFull(
              boxcolor: ontap[0] == true.obs
                  ? Theme.of(context).colorScheme.tertiaryContainer
                  : Theme.of(context).colorScheme.surface,
              avapath: avapath[0],
              name: patientname[0],
              gender: gender[0],
              age: age[0],
              time: time[0],
              person: people[0],
              warning: warning[0]),
        ),
        const SizedBox(
          height: 8,
        ),
        GestureDetector(
          onTap: () {
            init(1);
          },
          child: PatientBoxFull(
              boxcolor: ontap[1] == true.obs
                  ? Theme.of(context).colorScheme.tertiaryContainer
                  : Theme.of(context).colorScheme.surface,
              avapath: avapath[1],
              name: patientname[1],
              gender: gender[1],
              age: age[1],
              time: time[1],
              person: people[1],
              warning: warning[1]),
        ),
        const SizedBox(
          height: 8,
        ),
        GestureDetector(
          onTap: () {
            init(2);
          },
          child: PatientBoxFull(
              boxcolor: ontap[2] == true.obs
                  ? Theme.of(context).colorScheme.tertiaryContainer
                  : Theme.of(context).colorScheme.surface,
              avapath: avapath[2],
              name: patientname[2],
              gender: gender[2],
              age: age[2],
              time: time[2],
              person: people[2],
              warning: warning[2]),
        ),
      ],
    );
  }

  Row buildpopupActions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: () async {
            for (int i = 0; i < ontap.length; i++) {
              ontap[i] = false.obs;
            }
            showpatient.value = -1;
            Get.back();
          },
          child: Text(
            'Hủy',
            style: TextStyle(
              fontSize: 14,
              color: Theme.of(context).colorScheme.error,
            ),
          ),
        ),
        const SizedBox(width: 16),
        TextButton(
          onPressed: () async {
            // List<String> imageUrl = [];

            for (int i = 0; i < ontap.length; i++) {
              if (ontap[i] == true.obs) {
                showpatient.value = i;
              }
            }
            // Create MedicalEntity with the obtained typeId
            Get.back();
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
    );
  }
}