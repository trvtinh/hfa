import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_for_all/common/API/firebase_API.dart';
import 'package:health_for_all/common/entities/diagnostic.dart';
import 'package:health_for_all/common/helper/datetime_change.dart';
import 'package:health_for_all/pages/diagnostic/controller.dart';
import 'package:health_for_all/pages/diagnostic/widget/animated_container.dart';
import 'package:health_for_all/pages/diagnostic/information.dart';

class UnreadPage extends StatefulWidget {
  const UnreadPage({super.key});

  @override
  State<UnreadPage> createState() => _UnreadPageState();
}

class _UnreadPageState extends State<UnreadPage> {
  final controller = Get.find<DiagnosticController>();
  // void _setImportant(int index) {
  //   setState(() {
  //     isImportant[index] = !isImportant[index];
  //   });
  // }

  // void _toggleContainer(int index) {
  //   setState(() {
  //     _isExpandedList[index] = !_isExpandedList[index];
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          // children: List.generate(Unread.doctors.length, (index) {
          //   return animatedcontainer(
          //     doctor: Unread.doctors[index],
          //     time: Unread.timeDate[index],
          //     title: Unread.titles[index][0],
          //     value: Unread.values[index][0],
          //     unit: Unread.titles[index][0],
          //     notification: Unread.notifications[index],
          //     isImportant: Unread.isImportant[index],
          //     attachments: Unread.attachments[index],
          //     isAttached: Unread.isAttached[index],
          //     isExpanded: false.obs,
          //     index: index,
          //     page: 1,
          //   );
          // }),
          children: [
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('diagnostic')
                  .where('toUId', isEqualTo: controller.state.profile.value!.id)
                  // .where('tap', isEqualTo: 'unread')
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }
                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return const Center(child: Text('No diagnostics found.'));
                }
                final diagnostics = snapshot.data!.docs
                    .map((doc) => Diagnostic.fromFirestore(
                        doc as DocumentSnapshot<Map<String, dynamic>>))
                    .toList();
                return ListView.builder(
                  itemCount: diagnostics.length,
                  itemBuilder: (context, index) {
                    final diagnostic = diagnostics[index];
                    return FutureBuilder<String>(
                      future: controller.getNameByUId(diagnostic.fromUId!),
                      builder: (context, nameSnapshot) {
                        if (nameSnapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }

                        final doctor = nameSnapshot.data ?? 'Unknown';

                        return FutureBuilder<DocumentSnapshot>(
                          future: FirebaseApi.getDocumentSnapshotById(
                              'medicalData', diagnostic.medicalId!),
                          builder: (context, medicalSnapshot) {
                            if (medicalSnapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }

                            if (!medicalSnapshot.hasData ||
                                medicalSnapshot.hasError) {
                              return const Text('Error loading medical data');
                            }

                            final medicaldata = medicalSnapshot.data;
                            return animatedcontainer(
                              doctor: doctor,
                              time: DatetimeChange.timestamptoHHMMDDMMYYYY(
                                  diagnostic.timestamp!),
                              title:
                                  'clgt', // Replace with actual data from `medicaldata`
                              value:
                                  'clgt', // Replace with actual data from `medicaldata`
                              unit:
                                  'clgt', // Replace with actual data from `medicaldata`
                              notification: diagnostic.content!,
                              isImportant: false.obs,
                              attachments: diagnostic.imageURL!.length,
                              isAttached: diagnostic.imageURL!.isNotEmpty,
                              isExpanded: false.obs,
                              index: index,
                              page: 1,
                            );
                          },
                        );
                      },
                    );
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
