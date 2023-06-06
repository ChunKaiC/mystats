import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class _Point {
  _Point(this.x, this.y);

  final double x;
  final double y;
}

class SummaryPage extends StatelessWidget {
  SummaryPage({super.key});

  List<_Point> data = [
    _Point(1, 35),
    _Point(2, 34),
    _Point(3, 32),
    _Point(4, 40),
    _Point(5, 35),
    _Point(6, 34),
    _Point(7, 32),
    _Point(8, 40),
    _Point(9, 35),
    _Point(10, 20),
    _Point(11, 32),
    _Point(12, 40),
    _Point(13, 35),
    _Point(14, 50),
    _Point(15, 32),
    _Point(16, 40),
    _Point(17, 35),
    _Point(18, 34),
    _Point(19, 32),
    _Point(20, 40),
    _Point(21, 35),
    _Point(22, 34),
    _Point(23, 32),
    _Point(24, 40)
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          width: double.infinity,
          height: 300,
          margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: SfCartesianChart(
            zoomPanBehavior:
                ZoomPanBehavior(enablePinching: true, enablePanning: true),
            primaryXAxis: NumericAxis(),
            // Chart title
            title: ChartTitle(text: 'Weight Graph'),
            // Enable legend
            // legend: Legend(isVisible: true),
            // Enable tooltip
            tooltipBehavior: TooltipBehavior(enable: true),
            series: <ChartSeries<_Point, double>>[
              LineSeries<_Point, double>(
                  dataSource: data,
                  xValueMapper: (_Point point, _) => point.x,
                  yValueMapper: (_Point point, _) => point.y,
                  name: 'Points',
                  // Enable data label
                  dataLabelSettings: DataLabelSettings(isVisible: true))
            ],
          ),
        ),
        Container(
          width: double.infinity,
          height: 300,
          margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: SfCartesianChart(
            zoomPanBehavior:
                ZoomPanBehavior(enablePinching: true, enablePanning: true),
            borderColor: Colors.amber,
            primaryXAxis: NumericAxis(),
            // Chart title
            title: ChartTitle(text: 'Calories Graph'),
            // Enable legend
            // legend: Legend(isVisible: true),
            // Enable tooltip
            tooltipBehavior: TooltipBehavior(enable: true),
            series: <ChartSeries<_Point, double>>[
              LineSeries<_Point, double>(
                  dataSource: data,
                  xValueMapper: (_Point point, _) => point.x,
                  yValueMapper: (_Point point, _) => point.y,
                  name: 'Points',
                  // Enable data label
                  dataLabelSettings: DataLabelSettings(isVisible: true))
            ],
          ),
        ),
        Container(
          width: double.infinity,
          height: 300,
          margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: SfCartesianChart(
            zoomPanBehavior:
                ZoomPanBehavior(enablePinching: true, enablePanning: true),
            primaryXAxis: NumericAxis(),
            // Chart title
            title: ChartTitle(text: 'Weight Graph'),
            // Enable legend
            // legend: Legend(isVisible: true),
            // Enable tooltip
            tooltipBehavior: TooltipBehavior(enable: true),
            series: <ChartSeries<_Point, double>>[
              LineSeries<_Point, double>(
                  dataSource: data,
                  xValueMapper: (_Point point, _) => point.x,
                  yValueMapper: (_Point point, _) => point.y,
                  name: 'Points',
                  // Enable data label
                  dataLabelSettings: DataLabelSettings(isVisible: true))
            ],
          ),
        ),
      ],
    );
  }
}
