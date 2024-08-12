import 'package:flutter/material.dart';
import 'package:health_for_all/pages/homepage/widget/WhiteBox.dart';

class FollowingMedicalData extends StatelessWidget {
  const FollowingMedicalData({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Đang theo dõi'),
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/images/HFA_small_icon.png',
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Divider(
              color: Colors.black,
              thickness: 0.5,
            ),
            SizedBox(height: 12),
            Container(
              height: 80,
              width: 380,
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Theme.of(context).colorScheme.errorContainer,
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.3),
                      spreadRadius: 1,
                      blurRadius: 2,
                    )
                  ]),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 28,
                    backgroundImage: NetworkImage(
                        'https://s3-alpha-sig.figma.com/img/72f7/1c48/1924a99473c91bfdac585c9cc9c2bc58?Expires=1724025600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=X6quQiCcFFGcfoofQCAGCsblRzhs3bElFjlYDJk8LJAY99JkXmHDxvzkoxZ3DglGkWmVMyT7Ph-KHYGEEzb7zAy-XInm5gD97KSEFKeQJin1xZZoYv7oz8~-MWPoiZfxHs6iK5Yln4TdblueC64ZI8iMgy45QrrrawUvlJDsE8VsF057jJp91m9bazCZgcY69qm9cq4g5ftg8mXCNl~lvn9s4MpOLBGlLiRSL6K168BU30~oevuzsWcUBDd7ln6BZFYur0oEQpq4jyRrfbpIMC-u0USM3jMk78YodrTEH79Y~IC4MwUzCfq92fGUUi2Y3r1u7VJmI37Cqvkon3HJTw__'),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  SizedBox(
                    width: 130,
                    height: 68,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Nguyễn Văn A',
                              style: TextStyle(
                                fontSize: 16,
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'Nam',
                              style: TextStyle(
                                fontSize: 14,
                                color: Theme.of(context).colorScheme.outline,
                              ),
                            ),
                            SizedBox(width: 12),
                            Text(
                              '25 tuổi',
                              style: TextStyle(
                                fontSize: 14,
                                color: Theme.of(context).colorScheme.outline,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  SizedBox(
                    width: 146,
                    height: 52,
                    child: Column(
                      children: [
                        Container(
                          width: 120,
                          height: 24,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color:
                                Theme.of(context).colorScheme.primaryFixedDim,
                          ),
                          padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
                          child: SizedBox(
                            width: 88,
                            height: 16,
                            child: Text(
                              'Người nhà',
                              style: TextStyle(
                                fontSize: 12,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onPrimaryContainer,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 16),
            Container(
              height: 124,
              width: 380,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Theme.of(context).colorScheme.secondaryContainer,
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
                                      '03',
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
                                      '07',
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
                                      '10',
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
                          'Cập nhật lúc 06:00, 27/07/2024',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color.fromRGBO(121, 116, 126, 1),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Row(
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
            SizedBox(
              height: 16,
            ),
            Row(
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
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                WhiteBox(
                    title: 'Thông báo',
                    iconpath: 'assets/images/notifications.png',
                    text1: 'Chưa xem',
                    text2: 'Đã xem',
                    value1: '03',
                    value2: '07'),
                const SizedBox(
                  width: 185,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
