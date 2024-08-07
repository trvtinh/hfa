import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            height: 80,
            width: 380,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Theme.of(context).colorScheme.primaryContainer,
            ),
            child: const Row(children: [
              SizedBox(
                width: 8,
              ),
              CircleAvatar(
                radius: 28,
                backgroundImage: NetworkImage(
                  'https://s3-alpha-sig.figma.com/img/447d/ffec/b39241368aea1a19b6a61652750c7316?Expires=1723420800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=Q3518w86n~r1T95c867IZ4KfhmZWH2VjaBSvsuGASCjV4DVOqIHyyX1aTHbMwVGavXu~nj1hwsqyUk2fLCst~Mv7Ld5495xnB9vABr5rP4QgaSsfLkZyS0plApMhQ7P4gJn1wXNvZRc2yq6UELDcyg6ZrfnJUDna7i7dW6z7hDCg2-2uSATU8v4-uq5U5mhrZ883gatl7ZNw5sLmCFB3LNN-2SmCbskKe2rPynkWEr4kXg8UIRdmCw2zsJN2EEwnwkvJUaj3qVucjsImnnQ65EuF8V7LhOpVP3l3qBkxlK-IpQjPAlQ23j-d2Bsa9PavrclCgDwLkaO66tX3vzJpFQ__',
                ),
              ),
              SizedBox(
                width: 16,
              ),
              Column(
                children: [
                  Text(
                    "Nguyễn Văn A",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "Nam     25 tuổi",
                    style: TextStyle(
                      color: Color.fromRGBO(121, 116, 126, 1),
                    ),
                  ),
                ],
              ),
              Spacer(
                flex: 1,
              ),
              Column(
                children: [
                  Text('Người nhà'),
                  Text('Chuyên gia'),
                  Text('Đang theo dõi'),
                ],
              ),
            ]),
          ),
          Container(
            height: 124,
            width: 380,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Theme.of(context).colorScheme.errorContainer,
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
                          Icon(
                            Icons.open_in_new,
                            size: 16,
                          ),
                        ]),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.health_and_safety,
                          size: 40,
                          color: Color.fromRGBO(101, 85, 143, 1),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "Chưa xem",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(98, 91, 113, 1),
                                  ),
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
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  "Đã xem",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(98, 91, 113, 1),
                                  ),
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
              )
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
                          Icon(
                            Icons.open_in_new,
                            size: 16,
                          ),
                        ]),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.health_and_safety,
                          size: 40,
                        ),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  "Chưa xem",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(98, 91, 113, 1),
                                  ),
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
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  "Đã xem",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(98, 91, 113, 1),
                                  ),
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
              )
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
                          Icon(
                            Icons.open_in_new,
                            size: 16,
                          ),
                        ]),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.health_and_safety,
                          size: 40,
                        ),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  "Chưa xem",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(98, 91, 113, 1),
                                  ),
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
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  "Đã xem",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(98, 91, 113, 1),
                                  ),
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
              )
            ],
          ),
          Container(
            height: 84,
            width: 380,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: const Color.fromRGBO(234, 221, 255, 1),
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
