import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_for_all/common/entities/diagnostic.dart';
import 'package:health_for_all/common/helper/datetime_change.dart';
import 'package:health_for_all/pages/diagnostic/controller.dart';
import 'package:health_for_all/pages/diagnostic/widget/animated_container.dart';

class SeenPage extends StatelessWidget {
  const SeenPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DiagnosticController>();
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('diagnostic')
                  .where('toUId', isEqualTo: controller.state.profile.value!.id)
                  .where('tap', isEqualTo: 'seen')
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
                  shrinkWrap: true,
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
                        print(index);
                        print(diagnostic);
                        return FutureBuilder(
                          future: controller.getData(diagnostic.medicalId!),
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

                            final medicaldata = medicalSnapshot.data!;
                            return animatedcontainer(
                              doctor: doctor,
                              time: DatetimeChange.timestamptoHHMMDDMMYYYY(
                                  diagnostic.timestamp!),
                              med: medicaldata,
                              notification: diagnostic.content!,
                              isImportant: false.obs,
                              attachments: diagnostic.imageURL!,
                              isExpanded: false.obs,
                              user: controller.state.profile.value!,
                              documentId: diagnostic.id!,
                              tap: diagnostic.tap!,
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
