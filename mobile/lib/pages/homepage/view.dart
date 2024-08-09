import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          const Divider(
            color: Colors.black,
            thickness: 0.5,
          ),
          Container(
            height: 80,
            width: 380,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Theme.of(context).colorScheme.primaryContainer,
            ),
            child: const Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // SizedBox(
                        //   width: 8,
                        // ),
                        CircleAvatar(
                          radius: 28,
                          backgroundImage: NetworkImage(
                            'https://s3-alpha-sig.figma.com/img/447d/ffec/b39241368aea1a19b6a61652750c7316?Expires=1723420800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=Q3518w86n~r1T95c867IZ4KfhmZWH2VjaBSvsuGASCjV4DVOqIHyyX1aTHbMwVGavXu~nj1hwsqyUk2fLCst~Mv7Ld5495xnB9vABr5rP4QgaSsfLkZyS0plApMhQ7P4gJn1wXNvZRc2yq6UELDcyg6ZrfnJUDna7i7dW6z7hDCg2-2uSATU8v4-uq5U5mhrZ883gatl7ZNw5sLmCFB3LNN-2SmCbskKe2rPynkWEr4kXg8UIRdmCw2zsJN2EEwnwkvJUaj3qVucjsImnnQ65EuF8V7LhOpVP3l3qBkxlK-IpQjPAlQ23j-d2Bsa9PavrclCgDwLkaO66tX3vzJpFQ__',
                          ),
                        ),
                        // SizedBox(
                        //   width: 16,
                        // ),
                        Column(
                          children: [
                            Text(
                              "Nguyễn Văn A",
                              style: TextStyle(fontSize: 20),
                            ),
                            Row(
                              children: [
                                Text(
                                  "Nam",
                                  style: TextStyle(
                                    color: Color.fromRGBO(121, 116, 126, 1),
                                  ),
                                ),
                                SizedBox(
                                  width: 31,
                                ),
                                Text(
                                  "25 tuổi",
                                  style: TextStyle(
                                    color: Color.fromRGBO(121, 116, 126, 1),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                              ],
                            )
                          ],
                        ),
                        // Spacer(
                        //   flex: 1,
                        // ),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  "Người nhà:",
                                  style: TextStyle(
                                    color: Color.fromRGBO(121, 116, 126, 1),
                                  ),
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                Badge(
                                  // child: Text("2"),
                                  label: Text("2"),
                                  largeSize: 16,
                                  backgroundColor:
                                      Color.fromRGBO(125, 82, 96, 1),
                                )
                              ],
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  "Chuyên gia:",
                                  style: TextStyle(
                                    color: Color.fromRGBO(121, 116, 126, 1),
                                  ),
                                ),
                                SizedBox(
                                  width: 26,
                                ),
                                Badge(
                                  // child: Text("2"),
                                  label: Text("1"),
                                  largeSize: 16,
                                  backgroundColor:
                                      Color.fromRGBO(125, 82, 96, 1),
                                )
                              ],
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  "Đang theo dõi:",
                                  style: TextStyle(
                                    color: Color.fromRGBO(121, 116, 126, 1),
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Badge(
                                  // child: Text("2"),
                                  label: Text("1"),
                                  largeSize: 16,
                                  backgroundColor:
                                      Color.fromRGBO(125, 82, 96, 1),
                                )
                              ],
                            ),
                            // Text('Người nhà'),
                            // Text('Chuyên gia'),
                            // Text('Đang theo dõi'),
                          ],
                        ),
                      ])
                ]),
          ),
          Container(
            height: 124,
            width: 380,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Theme.of(context).colorScheme.errorContainer,
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Dữ liệu sức khỏe",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      width: 169,
                    ),
                    Icon(
                      Icons.open_in_new,
                      size: 16,
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.monitor_heart_outlined,
                      size: 48,
                      color: Color.fromRGBO(101, 85, 143, 1),
                    ),
                    Column(
                      children: [
                        Text(
                          "Chưa cập nhật",
                          style: TextStyle(
                            color: Color.fromRGBO(121, 116, 126, 1),
                          ),
                        ),
                        Text(
                          "03",
                          style: TextStyle(
                            fontSize: 16,
                            color: Color.fromRGBO(179, 38, 30, 1),
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "Đã cập nhật",
                          style: TextStyle(
                            color: Color.fromRGBO(121, 116, 126, 1),
                          ),
                        ),
                        Text(
                          "07",
                          style: TextStyle(
                            fontSize: 16,
                            color: Color.fromRGBO(52, 199, 89, 1),
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "Tổng số",
                          style: TextStyle(
                            color: Color.fromRGBO(121, 116, 126, 1),
                          ),
                        ),
                        Text(
                          "10",
                          style: TextStyle(
                            fontSize: 16,
                            color: Color.fromRGBO(29, 27, 32, 1),
                          ),
                        )
                      ],
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Cập nhập lúc 06:00, 27/07/2024",
                      style: TextStyle(
                        color: Color.fromRGBO(121, 116, 126, 1),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 100,
                width: 185,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white,
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Chẩn đoán",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Icon(
                            Icons.open_in_new,
                            size: 16,
                          ),
                        ]),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.health_and_safety_outlined,
                          size: 40,
                          color: Color.fromRGBO(101, 85, 143, 1),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Column(children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Chưa xem",
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(98, 91, 113, 1),
                                ),
                              ),
                              SizedBox(
                                width: 34,
                              ),
                              Text(
                                "03",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(179, 38, 30, 1),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Đã xem",
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(98, 91, 113, 1),
                                ),
                              ),
                              SizedBox(
                                width: 50,
                              ),
                              Text(
                                "07",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(98, 91, 113, 1),
                                ),
                              ),
                            ],
                          )
                        ])
                      ],
                    )
                  ],
                ),
              ),
              Container(
                height: 100,
                width: 185,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white,
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Đơn thuốc",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Icon(
                            Icons.open_in_new,
                            size: 16,
                          ),
                        ]),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.medication_liquid_sharp,
                          size: 40,
                          color: Color.fromRGBO(101, 85, 143, 1),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Column(children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Đang uống",
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(98, 91, 113, 1),
                                ),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Text(
                                "03",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(179, 38, 30, 1),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Hoàn thành",
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(98, 91, 113, 1),
                                ),
                              ),
                              SizedBox(
                                width: 25,
                              ),
                              Text(
                                "07",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(98, 91, 113, 1),
                                ),
                              ),
                            ],
                          )
                        ])
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 100,
                width: 185,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white,
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Nhắc nhở",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Icon(
                            Icons.open_in_new,
                            size: 16,
                          ),
                        ]),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.date_range_outlined,
                          size: 40,
                          color: Color.fromRGBO(101, 85, 143, 1),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Số lời nhắc",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(98, 91, 113, 1),
                              ),
                            ),
                            SizedBox(
                              width: 27,
                            ),
                            Text(
                              "07",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Color.fromRGBO(98, 91, 113, 1),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                height: 100,
                width: 185,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white,
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Cảnh báo",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Icon(
                            Icons.open_in_new,
                            size: 16,
                          ),
                        ]),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.warning_amber_outlined,
                          size: 40,
                          color: Color.fromRGBO(101, 85, 143, 1),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Số cảnh báo",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(98, 91, 113, 1),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "07",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Color.fromRGBO(98, 91, 113, 1),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 100,
                width: 185,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white,
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Thông báo",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Icon(
                            Icons.open_in_new,
                            size: 16,
                          ),
                        ]),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.notifications_none,
                          size: 40,
                          color: Color.fromRGBO(101, 85, 143, 1),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Column(children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Chưa xem",
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(98, 91, 113, 1),
                                ),
                              ),
                              SizedBox(
                                width: 34,
                              ),
                              Text(
                                "03",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(179, 38, 30, 1),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Đã xem",
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(98, 91, 113, 1),
                                ),
                              ),
                              SizedBox(
                                width: 50,
                              ),
                              Text(
                                "07",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(98, 91, 113, 1),
                                ),
                              ),
                            ],
                          )
                        ])
                      ],
                    )
                  ],
                ),
              ),
              Container(
                height: 100,
                width: 185,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white,
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Trò chuyện với HFA",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          ),
                          Icon(
                            Icons.open_in_new,
                            size: 16,
                          ),
                        ]),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.smart_toy_outlined,
                          size: 40,
                          color: Color.fromRGBO(101, 85, 143, 1),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Column(children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Trò chuyện y tế",
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(98, 91, 113, 1),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "với HFA",
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(98, 91, 113, 1),
                                ),
                              ),
                            ],
                          )
                        ])
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
          Container(
            height: 84,
            width: 380,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: const Color.fromRGBO(234, 221, 255, 1),
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Kết nối với thiết bị",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      width: 140,
                    ),
                    Icon(
                      Icons.open_in_new,
                      size: 16,
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(
                      Icons.developer_board,
                      size: 32,
                      color: Color.fromRGBO(101, 85, 143, 1),
                    ),
                    Text(
                      "Đang kết nối",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(52, 199, 89, 1),
                      ),
                    ),
                    Text(
                      "HFA-Careport-0123",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: Color.fromRGBO(33, 0, 93, 1),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
    // return const Center(
    //   child: Text('Homepage'),
    // );
  }
}
