import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class DemoECG extends StatefulWidget {
  @override
  const DemoECG({super.key});
  @override
  _DemoECGState createState() => _DemoECGState();
}

class _DemoECGState extends State<DemoECG> {
  List<FlSpot> spots = [];

  @override
  void initState() {
    super.initState();
    loadCsvData();
  }

  // Load CSV data from the local file and parse it, limiting to 10,000 points
  Future<void> loadCsvData() async {
    final data = await rootBundle.loadString('assets/ecg_20000_points.csv');
    final lines = const LineSplitter().convert(data);
    List<FlSpot> parsedSpots = [];

    int limit = 3000; // Set limit to 10,000 data points
    int count = 0;

    for (var line in lines.skip(1)) {
      if (count >= limit) break; // Stop after reaching 10,000 points
      final values = line.split(',');
      double x = double.parse(values[0]); // Convert time string to seconds
      double y = double.parse(values[1]);
      parsedSpots.add(FlSpot(x, y));
      count++;
    }

    setState(() {
      spots = parsedSpots;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Get the screen height using MediaQuery
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(title: const Text("ECG - Điện tâm đồ")),
      body: spots.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(),
                ),
                height:
                    screenHeight / 3, // Set height to 1/3 of the screen height
                padding: const EdgeInsets.all(16.0),
                child: LineChart(
                  LineChartData(
                    gridData:
                        const FlGridData(show: false), // Hide all grid lines
                    borderData: FlBorderData(show: false), // Hide chart border
                    titlesData: const FlTitlesData(
                      bottomTitles: AxisTitles(
                        sideTitles:
                            SideTitles(showTitles: false), // Hide bottom titles
                      ),
                      leftTitles: AxisTitles(
                        sideTitles:
                            SideTitles(showTitles: false), // Hide left titles
                      ),
                      rightTitles: AxisTitles(
                        sideTitles:
                            SideTitles(showTitles: false), // Hide right titles
                      ),
                      topTitles: AxisTitles(
                        sideTitles:
                            SideTitles(showTitles: false), // Hide top titles
                      ),
                    ),
                    minX: spots.first.x,
                    maxX: spots.last.x,
                    minY: spots
                        .map((spot) => spot.y)
                        .reduce((a, b) => a < b ? a : b),
                    maxY: spots
                        .map((spot) => spot.y)
                        .reduce((a, b) => a > b ? a : b),
                    lineBarsData: [
                      LineChartBarData(
                        spots: spots,
                        isCurved: false,
                        color: Colors.red,
                        barWidth: 2,
                        isStrokeCapRound: true,
                        dotData: const FlDotData(show: false),
                        belowBarData: BarAreaData(show: false),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
