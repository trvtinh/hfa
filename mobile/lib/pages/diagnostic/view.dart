import 'package:flutter/material.dart';
import 'package:health_for_all/common/entities/user.dart';
import 'package:health_for_all/pages/diagnostic/screen/important_view.dart';
import 'package:health_for_all/pages/diagnostic/screen/unread_view.dart';
import 'package:health_for_all/pages/diagnostic/screen/seen_view.dart';

class DiagnosticPage extends StatelessWidget {
  final UserData user;
  const DiagnosticPage({super.key, required this.user, });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Chẩn đoán'),
            elevation: 0,
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  'assets/images/HFA_small_icon.png',
                ),
              ),
            ],
            bottom: const TabBar(
              tabs: [
                Tab(
                  child: Text('Chưa xem'),
                ),
                Tab(
                  child: Text('Quan trọng'),
                ),
                Tab(
                  child: Text('Đã xem'),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              UnreadPage(user: user,),
              ImportantPage(user: user,),
              SeenPage(user: user,),
            ],
          ),
        ),
      ),
    );
  }
}
