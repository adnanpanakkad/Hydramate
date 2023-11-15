import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartSampleData {
  ChartSampleData({this.xValue, required this.yValue, required this.secondSeriesYValue});

  final dynamic xValue;
  final num yValue;
  final num secondSeriesYValue;
}

class NumericDefault extends StatefulWidget {
  const NumericDefault({Key? key}) : super(key: key);

  @override
  _NumericDefaultState createState() => _NumericDefaultState();
}

class _NumericDefaultState extends State<NumericDefault> {
  late TooltipBehavior _tooltipBehavior;
  List<ChartSampleData> chartData = [];

  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(
        enable: true, format: 'Score: point.y', canShowMarker: false);
    chartData = <ChartSampleData>[
      ChartSampleData(xValue: 1, yValue: 240, secondSeriesYValue: 236),
      ChartSampleData(xValue: 2, yValue: 250, secondSeriesYValue: 242),
      ChartSampleData(xValue: 3, yValue: 281, secondSeriesYValue: 313),
      ChartSampleData(xValue: 4, yValue: 358, secondSeriesYValue: 359),
      ChartSampleData(xValue: 5, yValue: 237, secondSeriesYValue: 272),
      ChartSampleData(xValue: 6, yValue: 358, secondSeriesYValue: 359),
      ChartSampleData(xValue: 7, yValue: 237, secondSeriesYValue: 272),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History'),
      ),
      body: Center(
        child: _buildChart(),
      ),
    );
  }

  SfCartesianChart _buildChart() {
    return SfCartesianChart(
      title: ChartTitle(text: 'Step-water History'),
      plotAreaBorderWidth: 0,
      legend: Legend(isVisible: true, position: LegendPosition.top),
      primaryXAxis: NumericAxis(
          title: AxisTitle(text: 'Day'),
          minimum: 1,
          maximum: 7,
          interval: 1,
          majorGridLines: MajorGridLines(width: 0),
          majorTickLines: MajorTickLines(size: 0),
          edgeLabelPlacement: EdgeLabelPlacement.hide),
      primaryYAxis: NumericAxis(
          title: AxisTitle(text: 'Steps'),
          axisLine: AxisLine(width: 0),
          majorTickLines: MajorTickLines(size: 0)),
      series: getDefaultNumericSeries(),
      tooltipBehavior: _tooltipBehavior,
    );
  }

  List<ColumnSeries<ChartSampleData, num>> getDefaultNumericSeries() {
    return <ColumnSeries<ChartSampleData, num>>[
      ColumnSeries<ChartSampleData, num>(
          dataSource: chartData,
          color: const Color.fromRGBO(237, 221, 76, 1),
          name: 'Steps',
          xValueMapper: (ChartSampleData sales, _) => sales.xValue as num,
          yValueMapper: (ChartSampleData sales, _) => sales.secondSeriesYValue),
      ColumnSeries<ChartSampleData, num>(
          dataSource: chartData,
          color: const Color.fromRGBO(2, 109, 213, 1),
          xValueMapper: (ChartSampleData sales, _) => sales.xValue as num,
          yValueMapper: (ChartSampleData sales, _) => sales.yValue,
          name: 'Water'),
    ];
  }

  @override
  void dispose() {
    chartData.clear();
    super.dispose();
  }
}
