import 'package:flutter/material.dart';
import 'package:health_for_all/common/entities/user.dart';

class PatientBox extends StatelessWidget {
  final UserData user;

  const PatientBox({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 380,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
            color: Theme.of(context).colorScheme.outlineVariant, width: 1),
        // boxShadow: const [
        //   BoxShadow(
        //     color: Color.fromRGBO(0, 0, 0, 0.3),
        //     spreadRadius: 1,
        //     blurRadius: 2,
        //   )
        // ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundImage: NetworkImage(user.photourl!),
          ),
          const SizedBox(
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
                      user.name!,
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
                      user.gender!,
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).colorScheme.outline,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      '${user.age}',
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).colorScheme.outline,
                      ),
                    ),
                    Text(
                      ' tuổi',
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
          const SizedBox(
            width: 10,
          ),
          SizedBox(
            width: 125,
            height: 52,
            child: Column(
              children: [
                Container(
                  width: 100,
                  height: 24,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Theme.of(context).colorScheme.primaryFixedDim,
                  ),
                  padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                  child: SizedBox(
                    width: 88,
                    height: 16,
                    child: Text(
                      'bản thân',
                      style: TextStyle(
                        fontSize: 12,
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
