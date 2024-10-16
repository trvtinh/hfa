import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_for_all/pages/application/controller.dart';
import 'package:health_for_all/pages/homepage/widget/WhiteBox.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});
  final appController = Get.find<ApplicationController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
                    Obx(() => Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const SizedBox(width: 12),
                              CircleAvatar(
                                  radius: 28,
                                  backgroundImage: CachedNetworkImageProvider(
                                      appController
                                              .state.profile.value?.photourl ??
                                          'https://s3-alpha-sig.figma.com/img/447d/ffec/b39241368aea1a19b6a61652750c7316?Expires=1723420800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=Q3518w86n~r1T95c867IZ4KfhmZWH2VjaBSvsuGASCjV4DVOqIHyyX1aTHbMwVGavXu~nj1hwsqyUk2fLCst~Mv7Ld5495xnB9vABr5rP4QgaSsfLkZyS0plApMhQ7P4gJn1wXNvZRc2yq6UELDcyg6ZrfnJUDna7i7dW6z7hDCg2-2uSATU8v4-uq5U5mhrZ883gatl7ZNw5sLmCFB3LNN-2SmCbskKe2rPynkWEr4kXg8UIRdmCw2zsJN2EEwnwkvJUaj3qVucjsImnnQ65EuF8V7LhOpVP3l3qBkxlK-IpQjPAlQ23j-d2Bsa9PavrclCgDwLkaO66tX3vzJpFQ__')),
                              const SizedBox(width: 12),
                              Container(
                                width: 130,
                                height: 56,
                                padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          appController
                                                  .state.profile.value?.name ??
                                              "",
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 88,
                                          height: 20,
                                          child: Row(
                                            children: [
                                              Text(
                                                "Nam",
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: Color.fromRGBO(
                                                      121, 116, 126, 1),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 12,
                                              ),
                                              Text(
                                                "24 tuổi",
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: Color.fromRGBO(
                                                      121, 116, 126, 1),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(width: 12),
                              const SizedBox(
                                width: 146,
                                height: 56,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    SizedBox(
                                      width: 120,
                                      height: 16,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Người nhà:",
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Color.fromRGBO(
                                                  121, 116, 126, 1),
                                            ),
                                          ),
                                          // SizedBox(
                                          //   width: 30,
                                          // ),
                                          Badge(
                                            // child: Text("2"),
                                            label: Text("2"),
                                            largeSize: 16,
                                            backgroundColor:
                                                Color.fromRGBO(125, 82, 96, 1),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 120,
                                      height: 16,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Chuyên gia:",
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Color.fromRGBO(
                                                  121, 116, 126, 1),
                                            ),
                                          ),
                                          // SizedBox(
                                          //   width: 30,
                                          // ),
                                          Badge(
                                            // child: Text("2"),
                                            label: Text("1"),
                                            largeSize: 16,
                                            backgroundColor:
                                                Color.fromRGBO(125, 82, 96, 1),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 120,
                                      height: 16,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Đang theo dõi:",
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Color.fromRGBO(
                                                  121, 116, 126, 1),
                                            ),
                                          ),
                                          // SizedBox(
                                          //   width: 30,
                                          // ),
                                          Badge(
                                            // child: Text("2"),
                                            label: Text("1"),
                                            largeSize: 16,
                                            backgroundColor:
                                                Color.fromRGBO(125, 82, 96, 1),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ]))
                  ]),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
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
                  const SizedBox(
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
                        const Icon(
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
                                child: const Column(
                                  children: [
                                    Text(
                                      "Chưa cập nhật",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Color.fromRGBO(121, 116, 126, 1),
                                      ),
                                    ),
                                    Text(
                                      "03",
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
                                child: const Column(
                                  children: [
                                    Text(
                                      "Đã cập nhật",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Color.fromRGBO(121, 116, 126, 1),
                                      ),
                                    ),
                                    Text(
                                      "07",
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
                                child: const Column(
                                  children: [
                                    Text(
                                      "Tổng số",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Color.fromRGBO(121, 116, 126, 1),
                                      ),
                                    ),
                                    Text(
                                      "10",
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
                  const SizedBox(
                    width: 356,
                    height: 16,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Cập nhật lúc 06:00, 27/07/2024",
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
            const SizedBox(
              height: 16,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                WhiteBox(
                    title: 'Chẩn đoán',
                    iconpath: 'assets/images/health_and_safety.png',
                    text1: 'Chưa xem',
                    text2: 'Đã xem',
                    value1: '03',
                    value2: '07'),
                WhiteBox(
                    title: 'Đơn thuốc',
                    iconpath: 'assets/images/medication_liquid.png',
                    text1: 'Đang uống',
                    text2: 'Hoàn thành',
                    value1: '03',
                    value2: '07'),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                WhiteBoxnoW(
                    title: 'Nhắc nhở',
                    iconpath: 'assets/images/date_range.png',
                    text1: 'Số lời nhắc',
                    value1: '07'),
                WhiteBoxnoW(
                    title: 'Cảnh báo',
                    iconpath: 'assets/images/warning_amber.png',
                    text1: 'Số cảnh báo',
                    value1: '07'),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                WhiteBox(
                    title: 'Thông báo',
                    iconpath: 'assets/images/notifications.png',
                    text1: 'Chưa xem',
                    text2: 'Đã xem',
                    value1: '03',
                    value2: '07'),
                WhiteBoxnoVal(
                    title: 'Trò chuyện với HFA',
                    iconpath: 'assets/images/smart_toy.png',
                    text1: 'Trò chuyện y tế',
                    text2: 'với HFA'),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              height: 84,
              width: 380,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: const Color.fromRGBO(234, 221, 255, 1),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.3),
                      spreadRadius: 1,
                      blurRadius: 2,
                      // offset: Offset(0, 3), // changes position of shadow
                    )
                  ]),
              child: const Column(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 356,
                    height: 20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Kết nối với thiết bị",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
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
                    height: 32,
                    child: Row(
                      children: [
                        Icon(
                          Icons.developer_board,
                          size: 32,
                          color: Color.fromRGBO(101, 85, 143, 1),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Text(
                          "Đang kết nối",
                          style: TextStyle(
                            fontSize: 12,
                            color: Color.fromRGBO(52, 199, 89, 1),
                          ),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Text(
                          "HFA-Careport-0123",
                          style: TextStyle(
                            fontSize: 14,
                            color: Color.fromRGBO(33, 0, 93, 1),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
    // return const Center(
    //   child: Text('Homepage'),
    // );
  }
}
