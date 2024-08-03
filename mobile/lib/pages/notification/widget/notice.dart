import 'package:flutter/material.dart';

class Notice extends StatelessWidget {
  const Notice({super.key});

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
                              Icons.warning_amber,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            const SizedBox(width: 12,),
                            Text(
                              '· HFA ·',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onPrimaryContainer,
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                fontFamily: 'Roboto',
                              )
                            ),
                            const SizedBox(width: 12,),
                            Text(
                              '06:00 Sáng, 27-07-2024',
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
                        'Cảnh báo',
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