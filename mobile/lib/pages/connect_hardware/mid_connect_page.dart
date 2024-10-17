import 'package:flutter/material.dart';

class MidConnectPage extends StatelessWidget {
  const MidConnectPage({super.key, required this.address});
  final String address;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kết nối với thiết bị"),
      ),
      body: Center(
        child: Column(
          children: [
            Text("Địa chỉ Bluetooth HFA - Careport"),
            GestureDetector(
              onTap: (){

              },
              child: Text(
                address,
              ),
            ),
          ],
        ),
      ),
    );
  }
}