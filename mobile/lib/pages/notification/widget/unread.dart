import 'package:flutter/material.dart';

class Unread extends StatelessWidget {
  const Unread({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Icon(
                              Icons.person_add_alt,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            const SizedBox(width: 12,),
                            Text(
                              '· Nguyễn Văn B ·',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onPrimaryContainer,
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                fontFamily: 'Roboto',
                              )
                            ),
                            const SizedBox(width: 12,),
                            Text(
                              'now',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onSurfaceVariant,
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                fontFamily: 'Roboto',
                              )
                            ),
                          ],
                        )
                      ),
                      Icon(
                        Icons.keyboard_arrow_down,
                        color: Theme.of(context).colorScheme.outline,
                      ),
                    ]
                  ),
                  const SizedBox(height: 12,),
                  Row(
                    children: [
                      Text(
                        'Đã gửi bình luận',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSecondaryContainer,
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'Roboto',
                        )
                      ),
                    ]
                  ),
                  const SizedBox(height: 3,),
                  Row(
                    children: [
                      Text(
                        'Lorem ipsum dolor sit amet, consectetur ',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'Roboto',
                        )
                      ),
                    ]
                  ),
                ],
              ),
            ),
          ]
        ),
      )
    );
  }
}