import 'package:flutter/material.dart';

class WhiteBox extends StatefulWidget {
  final String title;
  final String iconpath;
  final String text1;
  final String text2;
  final String value1;
  final String value2;

  const WhiteBox(
      {super.key,
      required this.title,
      required this.iconpath,
      required this.text1,
      required this.text2,
      required this.value1,
      required this.value2});

  @override
  State<WhiteBox> createState() => WhiteBoxState();
}

class WhiteBoxState extends State<WhiteBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 185,
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: const Color.fromRGBO(255, 255, 255, 1),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.3),
              spreadRadius: 1,
              blurRadius: 2,
              // offset: Offset(0, 3), // changes position of shadow
            )
          ]),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: 161,
            height: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 14,
                    color: Color.fromRGBO(29, 27, 32, 1),
                  ),
                ),
                const Icon(
                  Icons.open_in_new_outlined,
                  size: 16,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          SizedBox(
            width: 161,
            height: 48,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(widget.iconpath),
                SizedBox(
                    width: 105,
                    height: 48,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.text1,
                              style: const TextStyle(
                                fontSize: 12,
                                color: Color.fromRGBO(98, 91, 113, 1),
                              ),
                            ),
                            Text(
                              widget.value1,
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Color.fromRGBO(179, 38, 30, 1),
                                fontSize: 16,
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.text2,
                              style: const TextStyle(
                                fontSize: 12,
                                color: Color.fromRGBO(98, 91, 113, 1),
                              ),
                            ),
                            Text(
                              widget.value2,
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Color.fromRGBO(98, 91, 113, 1),
                                fontSize: 16,
                              ),
                            )
                          ],
                        )
                      ],
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class WhiteBoxnoW extends StatefulWidget {
  final String title;
  final String iconpath;
  final String text1;
  final String value1;

  const WhiteBoxnoW(
      {super.key,
      required this.title,
      required this.iconpath,
      required this.text1,
      required this.value1});

  @override
  State<WhiteBoxnoW> createState() => WhiteBoxnoWState();
}

class WhiteBoxnoWState extends State<WhiteBoxnoW> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 185,
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: const Color.fromRGBO(255, 255, 255, 1),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.15),
              spreadRadius: 1,
              blurRadius: 3,
              // offset: Offset(0, 3), // changes position of shadow
            )
          ]),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: 161,
            height: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 14,
                    color: Color.fromRGBO(29, 27, 32, 1),
                  ),
                ),
                const Icon(
                  Icons.open_in_new_outlined,
                  size: 16,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          SizedBox(
            width: 161,
            height: 48,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(widget.iconpath),
                SizedBox(
                    width: 105,
                    height: 24,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.text1,
                              style: const TextStyle(
                                fontSize: 12,
                                color: Color.fromRGBO(98, 91, 113, 1),
                              ),
                            ),
                            Text(
                              widget.value1,
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Color.fromRGBO(98, 91, 113, 1),
                                fontSize: 16,
                              ),
                            )
                          ],
                        ),
                      ],
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class WhiteBoxnoVal extends StatefulWidget {
  final String title;
  final String iconpath;
  final String text1;
  final String text2;

  const WhiteBoxnoVal(
      {super.key,
      required this.title,
      required this.iconpath,
      required this.text1,
      required this.text2});

  @override
  State<WhiteBoxnoVal> createState() => WhiteBoxnoValState();
}

class WhiteBoxnoValState extends State<WhiteBoxnoVal> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 185,
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: const Color.fromRGBO(255, 255, 255, 1),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.15),
              spreadRadius: 1,
              blurRadius: 3,
              // offset: Offset(0, 3), // changes position of shadow
            )
          ]),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: 161,
            height: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 14,
                    color: Color.fromRGBO(29, 27, 32, 1),
                  ),
                ),
                const Icon(
                  Icons.open_in_new_outlined,
                  size: 16,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          SizedBox(
            width: 161,
            height: 48,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(widget.iconpath),
                SizedBox(
                    width: 105,
                    height: 34,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              widget.text1,
                              style: const TextStyle(
                                fontSize: 12,
                                color: Color.fromRGBO(98, 91, 113, 1),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              widget.text2,
                              style: const TextStyle(
                                fontSize: 12,
                                color: Color.fromRGBO(98, 91, 113, 1),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
