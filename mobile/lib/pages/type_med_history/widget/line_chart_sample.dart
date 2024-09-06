import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:health_for_all/pages/alarm/view.dart';
import 'package:health_for_all/pages/type_med_history/widget/alarm_widget.dart';
import 'package:health_for_all/pages/type_med_history/widget/comment_widget.dart';
import 'package:health_for_all/pages/type_med_history/widget/diagnostic_widget.dart';

class LineChartSample extends StatefulWidget {
  @override
  final bool show_comment;
  final bool show_diagnostic;
  final bool show_alarm;
  final String title;
  const LineChartSample(
      {super.key,
      required this.show_comment,
      required this.show_diagnostic,
      required this.show_alarm,
      required this.title});
  _LineChartSampleState createState() => _LineChartSampleState();
}

class _LineChartSampleState extends State<LineChartSample> {
  // X-axis and Y-axis data based on random points generated earlier
  final List<int> xAxisData = [21, 23, 25, 29, 30, 23, 29, 25];
  final List<int> yAxisData = [125, 105, 115, 95, 105, 115, 125, 95];

  @override
  Widget build(BuildContext context) {
    final minY = yAxisData.reduce((curr, next) => curr < next ? curr : next);
    final maxY = yAxisData.reduce((curr, next) => curr > next ? curr : next);
    final minX = 0;
    final maxX = xAxisData.length - 1;

    // Calculate intervals for 4 lines on Y-axis and smaller intervals for X-axis
    final yInterval = (maxY - minY) / 4;
    final xInterval = (maxX - minX) /
        6; // Decrease this value to show more frequent X-axis lines

    return Column(
      children: [
        Container(
          height: 300, // Adjusted height to account for padding and text
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          padding: EdgeInsets.only(left: 12, right: 24, top: 26, bottom: 8),
          child: LineChart(
            LineChartData(
              // Limit the number of grid lines to 4 on the Y-axis and more frequent on X-axis
              gridData: FlGridData(
                show: true,
                drawVerticalLine: true,
                verticalInterval: xInterval, // More frequent grid columns
                horizontalInterval: yInterval, // 4 grid rows
                getDrawingHorizontalLine: (value) {
                  return FlLine(
                    color: Colors.grey.withOpacity(0.5),
                    strokeWidth: 1,
                  );
                },
                getDrawingVerticalLine: (value) {
                  return FlLine(
                    color: Colors.grey.withOpacity(0.5),
                    strokeWidth: 1,
                  );
                },
              ),
              borderData: FlBorderData(
                show: true,
                border: Border.all(color: const Color(0xff37434d), width: 1),
              ),
              titlesData: FlTitlesData(
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 35, // Adjust space for text
                    getTitlesWidget: (value, meta) {
                      final index = value.toInt();
                      if (index >= 0 && index < xAxisData.length) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text('${xAxisData[index]} / 07',
                              style: TextStyle(fontSize: 10)),
                        );
                      } else {
                        return const SizedBox.shrink();
                      }
                    },
                    interval: xInterval, // More frequent X-axis labels
                  ),
                ),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 40, // Adjust space for text
                    getTitlesWidget: (value, meta) {
                      return Text('${value.toInt()}/80',
                          style: TextStyle(fontSize: 10));
                    },
                    interval: yInterval, // Keep Y-axis labels showing 4 lines
                  ),
                ),
                topTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: false, // Hide titles on the top
                  ),
                ),
                rightTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: false, // Hide titles on the right
                  ),
                ),
              ),
              minX: minX.toDouble(),
              maxX: maxX.toDouble(),
              minY: minY.toDouble() - yInterval,
              maxY: maxY.toDouble() + yInterval,
              lineBarsData: [
                LineChartBarData(
                  spots: List.generate(
                    xAxisData.length,
                    (index) => FlSpot(
                      index.toDouble(), // X coordinate
                      yAxisData[index].toDouble(), // Y coordinate
                    ),
                  ),
                  isCurved: true,
                  color: Colors.red,
                  barWidth: 3,
                  isStrokeCapRound: true,
                  dotData: FlDotData(show: true), // Display dots on the points
                  belowBarData: BarAreaData(
                    show: true,
                    color: Colors.red.withOpacity(0.3),
                  ),
                ),
              ],
            ),
          ),
        ),
        Divider(
          height: 1,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              if (widget.show_comment)
                Row(
                  children: [
                    Icon(
                      Icons.comment_outlined,
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                      size: 24,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text(
                      "Bình luận (1)",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                        fontSize: 14,
                      ),
                    ),
                  ],
                )
              else if (widget.show_diagnostic)
                Row(
                  children: [
                    Icon(
                      Icons.health_and_safety_outlined,
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                      size: 24,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text(
                      "Chuẩn đoán (1)",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                        fontSize: 14,
                      ),
                    ),
                  ],
                )
              else
                Row(
                  children: [
                    Icon(
                      Icons.warning_amber_outlined,
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                      size: 24,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text(
                      "Cảnh báo (1)",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
        Divider(
          height: 1,
        ),
        Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              if (widget.show_comment)
                CommentWidget(
                  name: 'Nguyễn Văn B',
                  time: '06:00',
                  date: '29/07/2024',
                  state: 'Đã bình luận',
                  medName: widget.title,
                  index: '125/80 mg/dL',
                  commend: 'Hơi cao. Đề nghị đo thêm vào buổi chiều',
                )
              else if (widget.show_diagnostic)
                DiagnosticWidget(
                  name: 'Nguyễn Văn B',
                  time: '06:00',
                  date: '29/07/2024',
                  state: 'Đã bình luận',
                  medName: widget.title,
                  index: '125/80 mg/dL',
                  commend: 'Hơi cao. Đề nghị đo thêm vào buổi chiều',
                )
              else
                AlarmWidget(
                  name: 'Nguyễn Văn B',
                  time: '06:00',
                  date: '29/07/2024',
                  state: 'Đã bình luận',
                  medName: widget.title,
                  index: '125/80 mg/dL',
                  commend: 'Hơi cao. Đề nghị đo thêm vào buổi chiều',
                ),
            ],
          ),
        ),
      ],
    );
  }
}
