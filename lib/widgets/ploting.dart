import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Ploting extends StatelessWidget {
  const Ploting(
      {super.key,
      required this.dataCount,
      required this.dataPoints,
      required this.maximumY,
      required this.palet});

  final double maximumY;
  final int dataCount;
  final List<FlSpot> dataPoints;
  final List<Color> palet;

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        clipData: FlClipData.all(),
        gridData: FlGridData(show: false),
        titlesData: FlTitlesData(
          bottomTitles: SideTitles(
            showTitles: true,
            getTitles: (value) {
              // Customize the x-axis labels here based on your requirements
              return value.toInt().toString();
            },
            margin: 8,
          ),
          leftTitles: SideTitles(
            showTitles: true,
            getTitles: (value) {
              // Display the y-axis values based on the actual data points
              return value.toInt().toString();
            },
            margin: 8,
          ),
          rightTitles: SideTitles(showTitles: false),
          topTitles: SideTitles(showTitles: false),
        ),
        borderData: FlBorderData(
          show: true,
          border: Border.all(
            color: palet[0],
            width: 1,
          ),
        ),
        minX: (dataCount.toDouble() - 20),
        maxX: dataCount.toDouble(),
        minY: 0,
        maxY: maximumY,
        lineBarsData: [
          LineChartBarData(
            spots: dataPoints.getRange(0, dataPoints.length - 1).toList(),
            isCurved: true,
            colors: [palet[1]],
            belowBarData:
                BarAreaData(show: true, colors: [palet[2]]),
          ),
        ],
      ),
    );
  }
}
