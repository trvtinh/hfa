import 'package:flutter/material.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem(
      {super.key,
      required this.name,
      required this.time,
      required this.content,
      required this.title});
  final String name;
  final String time;
  final String content;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(children: [
            Expanded(
                child: Row(
              children: [
                Icon(
                  Icons.person_add_alt,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(
                  width: 12,
                ),
                Text('· $name ·',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Roboto',
                    )),
                const SizedBox(
                  width: 12,
                ),
                Text(time,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Roboto',
                    )),
              ],
            )),
            Icon(
              Icons.keyboard_arrow_down,
              color: Theme.of(context).colorScheme.outline,
            ),
          ]),
          const SizedBox(
            height: 12,
          ),
          Text(
            title,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSecondaryContainer,
              fontSize: 16,
              fontWeight: FontWeight.normal,
              fontFamily: 'Roboto',
            ),
            softWrap: true,
          ),
          const SizedBox(
            height: 3,
          ),
          Text(
            content,
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
              fontSize: 16,
              fontWeight: FontWeight.normal,
              fontFamily: 'Roboto',
            ),
            softWrap: true,
          ),
        ],
      ),
    );
  }
}
