import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_for_all/common/API/firebase_API.dart';
import 'package:health_for_all/pages/profile/controller.dart';
import 'package:health_for_all/pages/profile/page/search_view.dart';
import 'package:health_for_all/pages/profile/widget/user_ListTile.dart';
import 'package:health_for_all/pages/profile/widget/user_request_listTile.dart';

class FollowingPage extends StatefulWidget {
  const FollowingPage({super.key});
  final bool follow = true;
  @override
  State<FollowingPage> createState() => _FollowingPageState();
}

class _FollowingPageState extends State<FollowingPage> {
  final controller = Get.find<ProfileController>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SearchingBar(true),
            const SizedBox(
              height: 10,
            ),
            Text(
                'Người thân (${controller.state.profile.value!.relatives!.length})'),
            const Divider(),
            // Use the custom ListTile widgets here
            Container(
              constraints: const BoxConstraints(maxHeight: 150),
              child: StreamBuilder(
                stream: controller
                    .getUserByIds(controller.state.profile.value!.relatives!),
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
                      itemCount: users.length,
                      itemBuilder: (context, index) {
                        final user = users[index];
                        return UserListTile(
                          name: user.name!,
                          description: user.id!,
                          imageUrl: user.photourl!,
                          onTap: () {},
                          id: controller.state.profile.value!.id!,
                          collection: 'users',
                          fieldName: 'relatives',
                          valueToRemove: user.id!,
                        );
                      },
                    );
                  } else {
                    return const Center(
                      child: Text("Chưa có người thân!!!"),
                    );
                  }
                },
              ),
            ),

            Text(
                'Bệnh nhân (${controller.state.profile.value!.patients!.length})'),
            const Divider(),
            // Use the custom ListTile widgets here
            Container(
              constraints: BoxConstraints(maxHeight: 150),
              child: StreamBuilder(
                stream: controller
                    .getUserByIds(controller.state.profile.value!.patients!),
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
                      itemCount: users.length,
                      itemBuilder: (context, index) {
                        final user = users[index];
                        return UserListTile(
                            name: user.name!,
                            description: user.id!,
                            imageUrl: user.photourl!,
                            onTap: () {},
                            id: controller.state.profile.value!.id!,
                            collection: 'users',
                            fieldName: 'patients',
                            valueToRemove: user.id!);
                      },
                    );
                  } else {
                    return const Center(
                      child: Text("Chưa có bệnh nhân!!!"),
                    );
                  }
                },
              ),
            ),
            // ignore: prefer_const_constructors
            Text(
              'Chờ được duyệt (0)',
              style: TextStyle(color: Theme.of(context).colorScheme.error),
            ),
            const Divider(),
            Container(
              constraints: BoxConstraints(maxHeight: 150),
              child: StreamBuilder(
                stream: controller.getRequest(),
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
                      itemCount: users.length,
                      itemBuilder: (context, index) {
                        final user = users[index];
                        return UserRequestListtile(
                          name: user.user!.name!,
                          description: user.user!.id!,
                          imageUrl: user.user!.photourl!,
                          role: user.role!,
                          onDone: () async {
                            // Xử lý cho vai trò 'doctor'
                            if (user.role == 'doctor') {
                              try {
                                final a1 =
                                    await FirebaseApi.addValueToArrayField(
                                  'users',
                                  user.user!.id!,
                                  'patients',
                                  controller.state.profile.value!.id!,
                                );
                                final a2 =
                                    await FirebaseApi.addValueToArrayField(
                                  'users',
                                  controller.state.profile.value!.id!,
                                  'doctors',
                                  user.user!.id!,
                                );

                                if (a1 && a2) {
                                  await FirebaseApi.deleteDocument(
                                    'requestFollows',
                                    user.docID!,
                                  );
                                  print('Document deleted successfully');
                                } else {
                                  print('Failed to add values to array fields');
                                }
                              } catch (e) {
                                print('Error occurred: $e');
                              }
                            }

// Xử lý cho vai trò 'patient'
                            if (user.role == 'patient') {
                              try {
                                final a1 =
                                    await FirebaseApi.addValueToArrayField(
                                  'users',
                                  user.user!.id!,
                                  'doctors',
                                  controller.state.profile.value!.id!,
                                );
                                final a2 =
                                    await FirebaseApi.addValueToArrayField(
                                  'users',
                                  controller.state.profile.value!.id!,
                                  'patients',
                                  user.user!.id!,
                                );

                                if (a1 && a2) {
                                  await FirebaseApi.deleteDocument(
                                    'requestFollows',
                                    user.docID!,
                                  );
                                  print('Document deleted successfully');
                                } else {
                                  print('Failed to add values to array fields');
                                }
                              } catch (e) {
                                print('Error occurred: $e');
                              }
                            }

                            if (user.role == 'relative') {
                              try {
                                final a1 =
                                    await FirebaseApi.addValueToArrayField(
                                  'users',
                                  user.user!.id!,
                                  'relatives',
                                  controller.state.profile.value!.id!,
                                );
                                final a2 =
                                    await FirebaseApi.addValueToArrayField(
                                  'users',
                                  controller.state.profile.value!.id!,
                                  'relatives',
                                  user.user!.id!,
                                );

                                if (a1 && a2) {
                                  await FirebaseApi.deleteDocument(
                                    'requestFollows',
                                    user.docID!,
                                  );
                                  print('Document deleted successfully');
                                } else {
                                  print('Failed to add values to array fields');
                                }
                              } catch (e) {
                                print('Error occurred: $e');
                              }
                            }
                          },
                          onClear: () async {
                            await FirebaseApi.deleteDocument(
                                'requestFollows', user.docID!);
                          },
                        );
                      },
                    );
                  } else {
                    return const Center(
                      child: Text("Chưa có bác sĩ!!!"),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class SearchBar extends StatefulWidget {
//   const SearchBar({super.key});

//   @override
//   _SearchBarState createState() => _SearchBarState();
// }

// class _SearchBarState extends State<SearchBar> {
//   final TextEditingController _controller = TextEditingController();
//   bool _hasText = false;

//   void _onTextChanged(String text) {
//     setState(() {
//       _hasText = text.isNotEmpty;
//     });
//   }

//   void _clearText() {
//     _controller.clear();
//     _onTextChanged('');
//     FocusScope.of(context).unfocus(); // Dismiss the keyboard
//   }

//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       controller: _controller,
//       onChanged: _onTextChanged,
//       decoration: InputDecoration(
//         hintText: 'Thêm người muốn theo dõi dữ liệu',
//         prefixIcon: IconButton(
//           icon: Icon(_hasText ? Icons.arrow_back : Icons.add_circle_outline),
//           onPressed: () {
//             if (_hasText) {
//               _clearText();
//             }
//           },
//         ),
//         suffixIcon: _hasText
//             ? IconButton(
//                 icon: const Icon(Icons.clear),
//                 onPressed: _clearText,
//               )
//             : null,
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(28),
//           borderSide: BorderSide.none,
//         ),
//         filled: true,
//         fillColor: Theme.of(context)
//             .colorScheme
//             .surfaceContainerHigh, // Background color of the search bar
//         contentPadding:
//             const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
//       ),
//     );
//   }
// }
