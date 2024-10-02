import 'package:flutter/material.dart';

class DetailView extends StatefulWidget {
  final int index;
  // final String avapath;
  // final String name;
  // final String gender;
  // final String age;
  // final String person;

  const DetailView({
    super.key,
    required this.index,
    // required this.avapath,
    // required this.name,
    // required this.gender,
    // required this.age,
    // required this.person,
  });

  @override
  State<DetailView> createState() => DetailViewState();
}

class DetailViewState extends State<DetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chi tiết chẩn đoán'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 40,
                    child: Text(
                      'Chẩn đoán tới',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                        fontSize: 14,
                      ),
                    ),
                  )
                ],
              ),
              // PatientBox(
              //     avapath: avapath,
              //     name: name,
              //     gender: gender,
              //     age: age,
              //     person: person)
            ],
          ),
        ),
      ),
    );
  }
}
