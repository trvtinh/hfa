import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Show extends StatefulWidget {
  const Show({super.key});

  @override
  State<Show> createState() => _ShowState();
}

class _ShowState extends State<Show> {
  List<FlSpot> get allSpots => const [
        FlSpot(0, 20),
        FlSpot(2, 21),
        FlSpot(3, 24),
        FlSpot(6, 25),
        FlSpot(7, 27),
        FlSpot(10, 29),
        FlSpot(11, 34),
      ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300, // Adjust height as needed
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: LineChart(
          LineChartData(
            gridData: FlGridData(
              show: true,
              drawVerticalLine: true,
              drawHorizontalLine: true,
              getDrawingHorizontalLine: (value) {
                return const FlLine(
                  color: Colors.black12,
                  strokeWidth: 1,
                );
              },
              getDrawingVerticalLine: (value) {
                return const FlLine(
                  color: Colors.black12,
                  strokeWidth: 1,
                );
              },
            ),
            titlesData: FlTitlesData(
              show: true,
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 22,
                  getTitlesWidget: (value, meta) {
                    const style = TextStyle(
                      color: Color(0xff68737d),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    );
                    switch (value.toInt()) {
                      case 0:
                        return const Text('21/07', style: style);
                      case 2:
                        return const Text('23/07', style: style);
                      case 4:
                        return const Text('25/07', style: style);
                      case 6:
                        return const Text('27/07', style: style);
                      case 8:
                        return const Text('29/07', style: style);
                    }
                    return Container();
                  },
                ),
              ),
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (value, meta) {
                    const style = TextStyle(
                      color: Color(0xff67727d),
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    );
                    switch (value.toInt()) {
                      case 20:
                        return const Text('85/80', style: style);
                      case 40:
                        return const Text('95/80', style: style);
                      case 60:
                        return const Text('105/80', style: style);
                      case 80:
                        return const Text('115/80', style: style);
                      case 100:
                        return const Text('125/80', style: style);
                    }
                    return Container();
                  },
                  reservedSize: 42,
                ),
              ),
              rightTitles: const AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              topTitles: const AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
            ),
            borderData: FlBorderData(
              show: true,
              border: Border.all(color: Colors.black12, width: 1),
            ),
            minX: 0,
            maxX: 10,
            minY: 20,
            maxY: 120,
            lineBarsData: [
              LineChartBarData(
                spots: allSpots,
                isCurved: true,
                gradient: const LinearGradient(
                  colors: [Colors.red, Colors.red],
                ),
                barWidth: 3,
                isStrokeCapRound: true,
                belowBarData: BarAreaData(
                  show: true,
                  gradient: LinearGradient(
                    colors: [
                      Colors.red.withOpacity(0.3),
                      Colors.red.withOpacity(0.3)
                    ],
                  ),
                ),
                dotData: const FlDotData(show: true),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
