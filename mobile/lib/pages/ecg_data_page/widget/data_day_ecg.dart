import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_for_all/common/entities/ecg_entity.dart';
import 'package:health_for_all/pages/ecg_data_page/widget/ecg_chart.dart';

class DataDayEcg extends StatefulWidget {
  final String date;
  final EcgEntity data;

  const DataDayEcg(
      {super.key, required this.data, required this.date});

  @override
  State<DataDayEcg> createState() => _DataDayEcgState();
}

class _DataDayEcgState extends State<DataDayEcg> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: (){
            Get.to(() => EcgChart(y: widget.data.value!.map((e)=> double.parse(e)).toList()));
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                Flexible(
                  flex: 2, // Control the space for the hour and index
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start, // Align text to the left
                    children: [
                      Row(
                        children: [
                          Text(
                            widget.date,
                            style: TextStyle(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurfaceVariant,
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(
                              width: 6), // Adds space between hour and index
                          Text(
                            "--",
                            style: TextStyle(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onPrimaryContainer,
                              fontSize: 22,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const Divider(
          height: 1,
        ),
      ],
    );
  }
}
