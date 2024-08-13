import 'package:flutter/material.dart';
import 'package:health_for_all/pages/application/controller.dart';
import 'package:health_for_all/pages/following/Widget/PinkBox.dart';
import 'package:get/get.dart';
import 'package:health_for_all/pages/following_medical_data/view.dart';
import 'package:health_for_all/pages/profile/controller.dart';

class Following extends StatelessWidget {
  final appController = Get.find<ApplicationController>();
  final profileController = Get.find<ProfileController>();

  Following({super.key});

  @override
  Widget build(BuildContext context) {
    final relativesIds = appController.state.profile.value?.relatives ?? [];
    final patientsIds = appController.state.profile.value?.patients ?? [];

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
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
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 319,
                    height: 22,
                    child: Row(
                      children: [
                        Icon(
                          Icons.bookmark_added_outlined,
                          size: 24,
                          color: Color.fromRGBO(73, 69, 79, 1),
                        ),
                        const SizedBox(width: 8),
                        SizedBox(
                          height: 18,
                          child: Text(
                            "Đang theo dõi",
                            style: TextStyle(
                              color: Color.fromRGBO(73, 69, 79, 1),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 17,
                    height: 16,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        '(${relativesIds.length + patientsIds.length})',
                        style: const TextStyle(
                          color: Color.fromRGBO(121, 116, 126, 1),
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // StreamBuilder for relatives
            StreamBuilder(
              stream: profileController.getUserByIds(relativesIds),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return const Center(
                    child: Text('Chưa có người thân!'),
                  );
                } else if (snapshot.hasData) {
                  final users = snapshot.data ?? [];
                  if (users.isEmpty) {
                    return const Center(
                      child: Text("Chưa có người thân"),
                    );
                  }
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      final user = users[index];
                      return InkWell(
                        onTap: () => Get.to(() => FollowingMedicalData()),
                        child: Pinkbox(
                          avapath: user.photourl ?? '',
                          name: user.name ?? 'Không tên',
                          gender: "",
                          age: "",
                          time: "",
                          person: "Người thân",
                          warning: "",
                        ),
                      );
                    },
                  );
                } else {
                  return const Center(
                    child: Text("Chưa có người thân"),
                  );
                }
              },
            ),
            const SizedBox(height: 16),
            // StreamBuilder for patients
            StreamBuilder(
              stream: profileController.getUserByIds(patientsIds),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return const Center(
                    child: Text('Chưa có bệnh nhân!'),
                  );
                } else if (snapshot.hasData) {
                  final users = snapshot.data ?? [];
                  if (users.isEmpty) {
                    return const Center(
                      child: Text("Chưa có bệnh nhân"),
                    );
                  }
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      final user = users[index];
                      return InkWell(
                        onTap: () => Get.to(() => FollowingMedicalData()),
                        child: Pinkbox(
                          avapath: user.photourl ?? '',
                          name: user.name ?? 'Không tên',
                          gender: "",
                          age: "",
                          time: "",
                          person: "Bệnh nhân",
                          warning: "",
                        ),
                      );
                    },
                  );
                } else {
                  return const Center(
                    child: Text("Chưa có bệnh nhân"),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
