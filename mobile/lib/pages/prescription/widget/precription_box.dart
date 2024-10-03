import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_for_all/common/entities/medicine_base.dart';
import 'package:health_for_all/pages/prescription/widget/edit_prescription.dart';
import 'package:health_for_all/pages/prescription/widget/prescription_detail.dart';

class PrescriptionBox extends StatefulWidget {
  final String name;
  final String note;
  final List<MedicineBase> med;
  final int order;
  final String start_date;
  final String end_date;
  final List<String> dose;

  const PrescriptionBox(
      {super.key,
      required this.name,
      required this.start_date,
      required this.end_date,
      required this.order, required this.note, required this.med, required this.dose});

  @override
  State<PrescriptionBox> createState() => _PrescriptionBoxState();
}

class _PrescriptionBoxState extends State<PrescriptionBox> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => PrescriptionDetail(
              name: widget.name,
              order: widget.order,
              med: widget.med,
              dose: widget.dose,
              note: widget.note,
              startDate: widget.start_date,
              endDate: widget.end_date,
            ));
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceContainer,
              borderRadius: BorderRadius.circular(18),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.3),
                  spreadRadius: 0.6,
                  blurRadius: 2,
                  // offset: Offset(0, 3), // changes position of shadow
                )
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.medication_liquid_sharp,
                      color: Theme.of(context).colorScheme.primary,
                      size: 32,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.name,
                          style: TextStyle(
                            fontSize: 14,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                        Text(
                          "${widget.med.length} loại thuốc",
                          style: TextStyle(
                            fontSize: 12,
                            color: Theme.of(context).colorScheme.outline,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Từ ngày:  ${widget.start_date}",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onSurface,
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          "Tới ngày: ${widget.end_date}",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onSurface,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 16),
                    GestureDetector(
                      onTap: () {
                        _showDialog(context);
                      },
                      child: Icon(Icons.border_color,
                          size: 20,
                          color: Theme.of(context).colorScheme.primary),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          insetPadding: const EdgeInsets.all(10),
          content: SizedBox(
            width: MediaQuery.of(context).size.width - 70,
            child: const SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(child: EditPrescription()),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
