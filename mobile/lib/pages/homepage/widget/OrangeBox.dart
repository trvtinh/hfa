import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:health_for_all/pages/medical_data_homepage/view.dart';

class Orangebox extends StatefulWidget {
  final String val1;
  final String val2;
  final String val3;
  final String time;

  const Orangebox(
      {super.key,
      required this.val1,
      required this.val2,
      required this.val3,
      required this.time});

  @override
  State<Orangebox> createState() => OrangeboxState();
}

class OrangeboxState extends State<Orangebox> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => Medical_data_Home()),
        // );
        Get.to(() => MedicalDataHome());
      },
      child: Container(
        height: 124,
        width: 380,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Theme.of(context).colorScheme.errorContainer,
            boxShadow: const [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.3),
                spreadRadius: 1,
                blurRadius: 2,
                // offset: Offset(0, 3), // changes position of shadow
              )
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: 356,
              height: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Dữ liệu sức khỏe",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  Icon(
                    Icons.open_in_new,
                    size: 16,
                  )
                ],
              ),
            ),
            SizedBox(
              width: 356,
              height: 48,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.monitor_heart_outlined,
                    size: 48,
                    color: Color.fromRGBO(101, 85, 143, 1),
                  ),
                  SizedBox(
                    child: Row(
                      children: [
                        Container(
                          width: 100,
                          height: 48,
                          child: Column(
                            children: [
                              Text(
                                "Chưa cập nhật",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color.fromRGBO(121, 116, 126, 1),
                                ),
                              ),
                              Text(
                                widget.val1,
                                style: TextStyle(
                                  fontSize: 22,
                                  color: Color.fromRGBO(179, 38, 30, 1),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: 100,
                          height: 48,
                          child: Column(
                            children: [
                              Text(
                                "Đã cập nhật",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color.fromRGBO(121, 116, 126, 1),
                                ),
                              ),
                              Text(
                                widget.val2,
                                style: TextStyle(
                                  fontSize: 22,
                                  color: Color.fromRGBO(52, 199, 89, 1),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: 100,
                          height: 48,
                          child: Column(
                            children: [
                              Text(
                                "Tổng số",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color.fromRGBO(121, 116, 126, 1),
                                ),
                              ),
                              Text(
                                widget.val3,
                                style: TextStyle(
                                  fontSize: 22,
                                  color: Color.fromRGBO(29, 27, 32, 1),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 356,
              height: 16,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    widget.time,
                    style: TextStyle(
                      fontSize: 12,
                      color: Color.fromRGBO(121, 116, 126, 1),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
