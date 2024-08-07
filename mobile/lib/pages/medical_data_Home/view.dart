import 'package:flutter/material.dart';

// class GreyBox extends StatefulWidget {
//   final String title;
//   final String iconpath;
//   final String value;
//   final String unit;
//   final String time;

//   const ComboBox({super.key, required this.title, required this.iconpath, required this.value, required this.unit, required this.time});

//   @override
//   State<GreyBox> createState() => GreyBoxState();
// }

// class GreyBoxState extends State<GreyBox>{
//   @override
//   Widget build(BuildContext context){
//     return Container(
//       height: 112,
//       width: 186,
//       padding: Padding(

//       ),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(16),
//         color: Color.fromRGBO(243, 237, 247, 1),
//         boxShadow: [
//           BoxShadow(
//             color: Color.fromRGBO(0, 0, 0, 0.15),
//             spreadRadius: 1,
//             blurRadius: 3,
//             // offset: Offset(0, 3), // changes position of shadow
//           )
//         ]
//       ),
//       child: Column(
//         children: [
//           Row(

//           )
//         ],
//       ),
//     );
//   }

// }

class Medical_data_Home extends StatelessWidget {
  const Medical_data_Home({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            const Divider(
              color: Colors.black,
              thickness: 0.5,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 40,
              child: const Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // SizedBox(
                      //   width: 2,
                      // ),
                      Icon(
                        Icons.monitor_heart_outlined,
                        size: 24,
                        color: Color.fromRGBO(73, 69, 79, 1),
                      ),
                      Text(
                        "Dữ liệu y tế",
                        selectionColor: Color.fromRGBO(73, 69, 79, 1),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Cập nhật lúc 06:00, 27/07/2024",
                        style: TextStyle(
                          color: Color.fromRGBO(121, 116, 126, 1),
                          fontSize: 12,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            const Divider(
              color: Colors.black,
              thickness: 0.5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 64,
                  width: 186,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Color.fromRGBO(234, 221, 255, 1),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.widgets_outlined,
                        size: 40,
                        color: Color.fromRGBO(101, 85, 143, 1),
                      ),
                      SizedBox(
                        width: 114,
                        height: 40,
                        // child: Align(
                        //   alignment: Alignment.centerLeft,
                        //   child: Text(
                        //     "Tất cả",
                        //     style: TextStyle(
                        //       color: Color.fromRGBO(33, 0, 93, 1),
                        //       fontSize: 24,
                        //     ),
                        //   ),
                        // )
                        child: Row(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Tất cả",
                                style: TextStyle(
                                  color: Color.fromRGBO(33, 0, 93, 1),
                                  fontSize: 24,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                "tp",
                                style: TextStyle(
                                  color: Color.fromRGBO(33, 0, 93, 1),
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Text(
                      //   style: TextStyle(
                      //     fontSize: 20,
                      //   ),
                      // ),
                      // SizedBox(
                      //   width: 32,
                      // ),
                    ],
                  ),
                ),
                Container(
                  height: 64,
                  width: 186,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Color.fromRGBO(234, 221, 255, 1),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.add_circle_outline,
                        size: 40,
                        color: Color.fromRGBO(101, 85, 143, 1),
                      ),
                      Text(
                        "Thêm",
                        style: TextStyle(
                          fontSize: 20,
                          color: Color.fromRGBO(33, 0, 93, 1),
                        ),
                      ),
                      SizedBox(
                        width: 32,
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 112,
                  width: 186,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Color.fromRGBO(243, 237, 247, 1),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Nhịp tim",
                            style: TextStyle(
                              color: Color.fromRGBO(29, 27, 32, 1),
                            ),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Icon(
                            Icons.open_in_new_outlined,
                            size: 16,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 16,
                          ),
                          Image.asset(
                            'assets/images/nhip_tim.png',
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Row(
                                // mainAxisAlignment: Alignment.,
                                children: [
                                  Text(
                                    "80",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Color.fromRGBO(33, 0, 93, 1),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    "lần/phút",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Color.fromRGBO(98, 91, 113, 1),
                                    ),
                                  )
                                ],
                              )),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 16,
                          ),
                          Text(
                            "06:00, 27/07/2024",
                            style: TextStyle(
                              color: Color.fromRGBO(121, 116, 126, 1),
                              fontSize: 12,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  height: 112,
                  width: 186,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Color.fromRGBO(243, 237, 247, 1),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "SPO2",
                            style: TextStyle(
                              color: Color.fromRGBO(29, 27, 32, 1),
                            ),
                          ),
                          SizedBox(
                            width: 32,
                          ),
                          Icon(
                            Icons.open_in_new_outlined,
                            size: 16,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 16,
                          ),
                          Image.asset('assets/images/spo2.png'),
                          SizedBox(
                            width: 8,
                          ),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Row(
                                // mainAxisAlignment: Alignment.,
                                children: [
                                  Text(
                                    "98",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Color.fromRGBO(33, 0, 93, 1),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    "%",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Color.fromRGBO(98, 91, 113, 1),
                                    ),
                                  )
                                ],
                              )),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 16,
                          ),
                          Text(
                            "06:00, 27/07/2024",
                            style: TextStyle(
                              color: Color.fromRGBO(121, 116, 126, 1),
                              fontSize: 12,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 112,
                  width: 186,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Color.fromRGBO(243, 237, 247, 1),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Huyết áp",
                            style: TextStyle(
                              color: Color.fromRGBO(29, 27, 32, 1),
                            ),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Icon(
                            Icons.open_in_new_outlined,
                            size: 16,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 16,
                          ),
                          Image.asset('assets/images/huyet_ap.png'),
                          SizedBox(
                            width: 8,
                          ),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Row(
                                // mainAxisAlignment: Alignment.,
                                children: [
                                  Text(
                                    "120/80",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Color.fromRGBO(33, 0, 93, 1),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    "mmHg",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Color.fromRGBO(98, 91, 113, 1),
                                    ),
                                  )
                                ],
                              )),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 16,
                          ),
                          Text(
                            "06:00, 27/07/2024",
                            style: TextStyle(
                              color: Color.fromRGBO(121, 116, 126, 1),
                              fontSize: 12,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  height: 112,
                  width: 186,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Color.fromRGBO(243, 237, 247, 1),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Đường huyết",
                            style: TextStyle(
                              color: Color.fromRGBO(29, 27, 32, 1),
                            ),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Icon(
                            Icons.open_in_new_outlined,
                            size: 16,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 16,
                          ),
                          Image.asset('assets/images/duong_huyet.png'),
                          SizedBox(
                            width: 8,
                          ),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Row(
                                // mainAxisAlignment: Alignment.,
                                children: [
                                  Text(
                                    "100",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Color.fromRGBO(33, 0, 93, 1),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    "mg/dL",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Color.fromRGBO(98, 91, 113, 1),
                                    ),
                                  )
                                ],
                              )),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 16,
                          ),
                          Text(
                            "06:00, 27/07/2024",
                            style: TextStyle(
                              color: Color.fromRGBO(121, 116, 126, 1),
                              fontSize: 12,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 112,
                  width: 186,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Color.fromRGBO(243, 237, 247, 1),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "HRV",
                            style: TextStyle(
                              color: Color.fromRGBO(29, 27, 32, 1),
                            ),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Icon(
                            Icons.open_in_new_outlined,
                            size: 16,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 16,
                          ),
                          Image.asset('assets/images/hrv.png'),
                          SizedBox(
                            width: 8,
                          ),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Row(
                                // mainAxisAlignment: Alignment.,
                                children: [
                                  Text(
                                    "--",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Color.fromRGBO(33, 0, 93, 1),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    "ms",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Color.fromRGBO(98, 91, 113, 1),
                                    ),
                                  )
                                ],
                              )),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 16,
                          ),
                          Text(
                            "-",
                            style: TextStyle(
                              color: Color.fromRGBO(121, 116, 126, 1),
                              fontSize: 12,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  height: 112,
                  width: 186,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Color.fromRGBO(243, 237, 247, 1),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "ECG",
                            style: TextStyle(
                              color: Color.fromRGBO(29, 27, 32, 1),
                            ),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Icon(
                            Icons.open_in_new_outlined,
                            size: 16,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 16,
                          ),
                          Image.asset('assets/images/ecg.png'),
                          SizedBox(
                            width: 8,
                          ),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Row(
                                // mainAxisAlignment: Alignment.,
                                children: [
                                  Text(
                                    "ECG",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Color.fromRGBO(33, 0, 93, 1),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    " ",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Color.fromRGBO(98, 91, 113, 1),
                                    ),
                                  )
                                ],
                              )),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 16,
                          ),
                          Text(
                            "06:00, 27/07/2024",
                            style: TextStyle(
                              color: Color.fromRGBO(121, 116, 126, 1),
                              fontSize: 12,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 112,
                  width: 186,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Color.fromRGBO(243, 237, 247, 1),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Thân nhiệt",
                            style: TextStyle(
                              color: Color.fromRGBO(29, 27, 32, 1),
                            ),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Icon(
                            Icons.open_in_new_outlined,
                            size: 16,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 16,
                          ),
                          Image.asset('assets/images/than_nhiet.png'),
                          SizedBox(
                            width: 8,
                          ),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Row(
                                // mainAxisAlignment: Alignment.,
                                children: [
                                  Text(
                                    "36",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Color.fromRGBO(33, 0, 93, 1),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    "°C",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Color.fromRGBO(98, 91, 113, 1),
                                    ),
                                  )
                                ],
                              )),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 16,
                          ),
                          Text(
                            "06:00, 20/07/2024",
                            style: TextStyle(
                              color: Color.fromRGBO(121, 116, 126, 1),
                              fontSize: 12,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  height: 112,
                  width: 186,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Color.fromRGBO(243, 237, 247, 1),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Axit Uric",
                            style: TextStyle(
                              color: Color.fromRGBO(29, 27, 32, 1),
                            ),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Icon(
                            Icons.open_in_new_outlined,
                            size: 16,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 16,
                          ),
                          Image.asset('assets/images/nhip_tim.png'),
                          SizedBox(
                            width: 8,
                          ),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Row(
                                // mainAxisAlignment: Alignment.,
                                children: [
                                  Text(
                                    "7.0",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Color.fromRGBO(33, 0, 93, 1),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    "mg/dL",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Color.fromRGBO(98, 91, 113, 1),
                                    ),
                                  )
                                ],
                              )),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 16,
                          ),
                          Text(
                            "06:00, 21/07/2024",
                            style: TextStyle(
                              color: Color.fromRGBO(121, 116, 126, 1),
                              fontSize: 12,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 112,
                  width: 186,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Color.fromRGBO(243, 237, 247, 1),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Cân nặng",
                            style: TextStyle(
                              color: Color.fromRGBO(29, 27, 32, 1),
                            ),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Icon(
                            Icons.open_in_new_outlined,
                            size: 16,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 16,
                          ),
                          Image.asset('assets/images/can_nang.png'),
                          SizedBox(
                            width: 8,
                          ),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Row(
                                // mainAxisAlignment: Alignment.,
                                children: [
                                  Text(
                                    "70",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Color.fromRGBO(33, 0, 93, 1),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    "Kg",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Color.fromRGBO(98, 91, 113, 1),
                                    ),
                                  )
                                ],
                              )),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 16,
                          ),
                          Text(
                            "06:00, 20/07/2024",
                            style: TextStyle(
                              color: Color.fromRGBO(121, 116, 126, 1),
                              fontSize: 12,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  height: 112,
                  width: 186,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Color.fromRGBO(243, 237, 247, 1),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Phiếu xét nghiệm máu",
                            style: TextStyle(
                              color: Color.fromRGBO(29, 27, 32, 1),
                            ),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Icon(
                            Icons.open_in_new_outlined,
                            size: 16,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 16,
                          ),
                          Icon(
                            Icons.medical_information_outlined,
                            size: 40,
                            color: Color.fromRGBO(101, 85, 143, 1),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Row(
                                // mainAxisAlignment: Alignment.,
                                children: [
                                  Text(
                                    "OK",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Color.fromRGBO(33, 0, 93, 1),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    " ",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Color.fromRGBO(98, 91, 113, 1),
                                    ),
                                  )
                                ],
                              )),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 16,
                          ),
                          Text(
                            "06:00, 21/07/2024",
                            style: TextStyle(
                              color: Color.fromRGBO(121, 116, 126, 1),
                              fontSize: 12,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 112,
                  width: 186,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Color.fromRGBO(243, 237, 247, 1),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Kết quả khám",
                            style: TextStyle(
                              color: Color.fromRGBO(29, 27, 32, 1),
                            ),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Icon(
                            Icons.open_in_new_outlined,
                            size: 16,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 16,
                          ),
                          Icon(
                            Icons.medical_information_outlined,
                            size: 40,
                            color: Color.fromRGBO(101, 85, 143, 1),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Row(
                                // mainAxisAlignment: Alignment.,
                                children: [
                                  Text(
                                    "OK",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Color.fromRGBO(33, 0, 93, 1),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    " ",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Color.fromRGBO(98, 91, 113, 1),
                                    ),
                                  )
                                ],
                              )),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 16,
                          ),
                          Text(
                            "06:00, 20/07/2024",
                            style: TextStyle(
                              color: Color.fromRGBO(121, 116, 126, 1),
                              fontSize: 12,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 112,
                  width: 186,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
