import 'package:flutter/material.dart';

class PatientBox extends StatefulWidget {
  final String avapath;
  final String name;
  final String gender;
  final String age;
  final String person;

  const PatientBox({
    super.key,
    required this.avapath,
    required this.name,
    required this.gender,
    required this.age,
    required this.person,
  });

  @override
  State<PatientBox> createState() => PatientBoxState();
}

class PatientBoxState extends State<PatientBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 380,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(width: 1),
          boxShadow: const [
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
            backgroundImage: NetworkImage(widget.avapath),
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
                      widget.name,
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
                      widget.gender,
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).colorScheme.outline,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      widget.age,
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
                    color: Theme.of(context).colorScheme.primaryFixedDim,
                  ),
                  padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                  child: SizedBox(
                    width: 88,
                    height: 16,
                    child: Text(
                      widget.person,
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
