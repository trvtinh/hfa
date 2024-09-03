import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PrescriptionDetail extends StatefulWidget {
  final String name;
  final int order;
  final List<String> tablet;
  final List<int> sl_tablet;
  const PrescriptionDetail(
      {super.key,
      required this.name,
      required this.order,
      required this.tablet,
      required this.sl_tablet});

  @override
  State<PrescriptionDetail> createState() => _PrescriptionDetailState();
}

class _PrescriptionDetailState extends State<PrescriptionDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Đơn thuốc ${widget.order}",
          style: TextStyle(
            fontSize: 22,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        actions: [
          Icon(
            Icons.medication_liquid,
            size: 48,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Column(
        children: [
          const Divider(
            height: 1,
          ),
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                name_prescription(),
                list_tablet(),
                time(),
                file(),
                note(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget name_prescription() {
    return Container(
      child: Column(
        children: [
          const SizedBox(
            height: 4,
          ),
          Row(
            children: [
              Text(
                "Tên đơn thuốc",
                style: TextStyle(
                  fontSize: 14,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 4,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: 56,
            decoration: BoxDecoration(
                border: Border.all(
                    color: Theme.of(context).colorScheme.outlineVariant),
                borderRadius: BorderRadius.circular(5)),
            child: Row(
              children: [
                Icon(
                  Icons.medication_liquid,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                const SizedBox(
                  width: 12,
                ),
                Text(
                  widget.name,
                  style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }

  Widget list_tablet() {
    return Container(
      child: Column(
        children: [
          const SizedBox(
            height: 4,
          ),
          Row(
            children: [
              Text(
                "Danh sách thuốc (${widget.sl_tablet.length})",
                style: TextStyle(
                  fontSize: 14,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 4,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              border: Border.all(
                  color: Theme.of(context).colorScheme.outlineVariant),
            ),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                    color: Theme.of(context).colorScheme.primaryContainer,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Tên thuốc",
                        style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                      ),
                      Text(
                        "Số lượng",
                        style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                      )
                    ],
                  ),
                ),
                for (int i = 0; i < widget.tablet.length; i++)
                  medicine(widget.tablet[i], widget.sl_tablet[i],
                      (i != widget.tablet.length - 1)),
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }

  Widget medicine(String name, int number, bool ok) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.medication,
                    size: 24,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    number.toString(),
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        if (ok)
          const Divider(
            height: 1,
          ),
      ],
    );
  }

  Widget time() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 4,
        ),
        Row(
          children: [
            Text(
              "Thời gian",
              style: TextStyle(
                fontSize: 14,
                color: Theme.of(context).colorScheme.secondary,
              ),
            )
          ],
        ),
        const SizedBox(
          height: 4,
        ),
        _buildDateTimeField(
          context,
          Icons.today,
          selectDate,
          TextEditingController(),
          width: (MediaQuery.of(context).size.width - 32),
        ),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }

  final dateController = TextEditingController();
  DateTime datetime = DateTime.now();

  Future<void> selectDate(BuildContext context) async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: datetime,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (selectedDate != null) {
      datetime = selectedDate;
      final formattedDate = DateFormat('dd/MM/yyyy').format(selectedDate);
      dateController.text = formattedDate;
    }
  }

  Widget _buildDateTimeField(
      BuildContext context,
      IconData icon,
      Future<void> Function(BuildContext) onTap,
      TextEditingController controller,
      {required double width}) {
    return SizedBox(
      width: width,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          prefixIcon:
              Icon(icon, color: Theme.of(context).colorScheme.onSurfaceVariant),
          border: OutlineInputBorder(
              borderSide: BorderSide(
            color: Theme.of(context).colorScheme.outlineVariant,
            width: 1,
          )),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.outlineVariant,
              width: 1,
            ),
          ),
        ),
        readOnly: true,
        onTap: () => onTap(context),
      ),
    );
  }

  Widget file() {
    return Column(
      children: [
        const SizedBox(
          height: 4,
        ),
        Row(
          children: [
            Text(
              "File đính kèm",
              style: TextStyle(
                fontSize: 14,
                color: Theme.of(context).colorScheme.secondary,
              ),
            )
          ],
        ),
        const SizedBox(
          height: 4,
        ),
        Container(
          width: MediaQuery.of(context).size.width - 32,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                  color: Theme.of(context).colorScheme.outlineVariant)),
          child: const Column(
            children: [
              Text("..."),
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }

  Widget note() {
    return Column(
      children: [
        const SizedBox(
          height: 4,
        ),
        Row(
          children: [
            Text(
              "Ghi chú",
              style: TextStyle(
                fontSize: 14,
                color: Theme.of(context).colorScheme.secondary,
              ),
            )
          ],
        ),
        const SizedBox(
          height: 4,
        ),
        _buildNoteField(context, Icons.edit_note, noteController,
            width: MediaQuery.of(context).size.width - 32),
      ],
    );
  }

  final noteController = TextEditingController();
  Widget _buildNoteField(
      BuildContext context, IconData icon, TextEditingController controller,
      {required double width}) {
    return SizedBox(
      width: width,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.outlineVariant,
              width: 1,
            ),
          ),
        ),
        readOnly: true,
      ),
    );
  }
}
