import 'package:flutter/material.dart';
import 'package:health_for_all/pages/following/Widget/PinkBox.dart';
import 'package:get/get.dart';
import 'package:health_for_all/pages/following_medical_data/view.dart';

class Following extends StatelessWidget {
  const Following({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 40,
              decoration: BoxDecoration(
                  border: Border(
                top: BorderSide(
                  color: Color.fromRGBO(202, 196, 208, 1),
                  width: 1,
                ),
                bottom: BorderSide(
                  color: Color.fromRGBO(202, 196, 208, 1),
                  width: 1,
                ),
              )),
              padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: const Column(
                children: [
                  Row(
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
                            SizedBox(width: 8),
                            SizedBox(
                              height: 18,
                              child: Text(
                                "Đang theo dõi",
                                selectionColor: Color.fromRGBO(73, 69, 79, 1),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // SizedBox(width: 8),
                      SizedBox(
                        width: 17,
                        height: 16,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "(3)",
                            style: TextStyle(
                              color: Color.fromRGBO(121, 116, 126, 1),
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            InkWell(
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => Medical_data_Home()),
                // );
                Get.to(() => FollowingMedicalData());
              },
              child: Pinkbox(
                avapath:
                    'https://s3-alpha-sig.figma.com/img/72f7/1c48/1924a99473c91bfdac585c9cc9c2bc58?Expires=1724025600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=X6quQiCcFFGcfoofQCAGCsblRzhs3bElFjlYDJk8LJAY99JkXmHDxvzkoxZ3DglGkWmVMyT7Ph-KHYGEEzb7zAy-XInm5gD97KSEFKeQJin1xZZoYv7oz8~-MWPoiZfxHs6iK5Yln4TdblueC64ZI8iMgy45QrrrawUvlJDsE8VsF057jJp91m9bazCZgcY69qm9cq4g5ftg8mXCNl~lvn9s4MpOLBGlLiRSL6K168BU30~oevuzsWcUBDd7ln6BZFYur0oEQpq4jyRrfbpIMC-u0USM3jMk78YodrTEH79Y~IC4MwUzCfq92fGUUi2Y3r1u7VJmI37Cqvkon3HJTw__',
                name: 'Nguyễn Văn A',
                gender: 'Nam',
                age: '25',
                time: '06:00, 27/07',
                person: 'Người nhà',
                warning: '1',
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Pinkbox(
              avapath:
                  'https://s3-alpha-sig.figma.com/img/2381/ee7d/7fba196014b07dcd2bee7a8e541cc2be?Expires=1724025600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=fhY~GbUkCHsNBUtNjONuRYRKCoG9zJOGSWdKRNNhdr2wCgYgouYWOW5ogbvCB~oGMFfa~EGYbglrzDj5PCL2rE72YwLongVGubOg8B4Qg5~gtb9BJnrAAeD2YSQxjcECysPD4917PO5tdoynwPoNR14Tzy6JXpSe5vYo9RzOLy8MArEznRsy5Ew9T-dLKNsd3uNkl9n7jp74ysYHL3oBQkuvwmVBSqzxdabZLYe61jKmE78cxZUXduZx-1maJXGrLkliXqR9g28ZyZNSxOLUun5vo4tz8~6aFFOWZ83oq5UH~AL7tAjdPA7jO7B18OUwoRWwFGaHlLPnWAPq~mlRog__',
              name: 'Nguyễn Thị B',
              gender: 'Nữ',
              age: '70',
              time: '06:00, 27/07',
              person: 'Bệnh nhân',
              warning: '0',
            ),
            const SizedBox(
              height: 16,
            ),
            Pinkbox(
              avapath:
                  'https://s3-alpha-sig.figma.com/img/d5fb/6bc1/39a3da5bc43ab0601942a4cf33722fa1?Expires=1724025600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=WaWg3dCSw~bn5W0u129kIGq8JAiaLjZkrmJfo-jetHH4xydh6U5mXCqRzSJg1E0Jq9BA3Z8-nYshchVVxRUZIjDwkKGfKLvJUL1ASg-~X38ciOze~yr948CQmMJ~DeOMQX9dp9vzpuKRkaSbVhzUxxHAHNb9hOKDpN5BlYw0--VObnmKcuZL5lUHDVgXLW7TUQOe8K5uN37VJ4SRnE0NNDkpar7RGa7nXT5BRnFmQ2-D7aEsJb0oSXVcKj60tgNG5m2tOblsoAMwLCDLlML4Ru8WaYi4YUXv~BIwgHFJXXYtlILMq8wdyTueUQRsevOWy~WTMF0~5PsdKOKpO6T-Lg__',
              name: 'Trần Văn C',
              gender: 'Nam',
              age: '50',
              time: '06:00, 27/07',
              person: 'Bệnh nhân',
              warning: '0',
            ),
          ],
        ),
      ),
    );
  }
}
