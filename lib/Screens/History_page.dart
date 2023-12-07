import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartSampleData {
  ChartSampleData(
      {this.xValue, required this.yValue, required this.secondSeriesYValue});

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
  List<ChartSampleData> stepsData = [];
  List<ChartSampleData> waterData = [];

  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(
        enable: true, format: 'Score: point.y', canShowMarker: false);
    stepsData = <ChartSampleData>[
      ChartSampleData(xValue: 1, yValue: 240, secondSeriesYValue: 0),
      ChartSampleData(xValue: 2, yValue: 250, secondSeriesYValue: 0),
      ChartSampleData(xValue: 3, yValue: 281, secondSeriesYValue: 0),
      ChartSampleData(xValue: 4, yValue: 358, secondSeriesYValue: 0),
      ChartSampleData(xValue: 5, yValue: 237, secondSeriesYValue: 0),
      ChartSampleData(xValue: 6, yValue: 358, secondSeriesYValue: 0),
      ChartSampleData(xValue: 7, yValue: 237, secondSeriesYValue: 0),
    ];

    waterData = <ChartSampleData>[
      ChartSampleData(xValue: 1, yValue: 236, secondSeriesYValue: 0),
      ChartSampleData(xValue: 2, yValue: 242, secondSeriesYValue: 0),
      ChartSampleData(xValue: 3, yValue: 313, secondSeriesYValue: 0),
      ChartSampleData(xValue: 4, yValue: 359, secondSeriesYValue: 0),
      ChartSampleData(xValue: 5, yValue: 272, secondSeriesYValue: 0),
      ChartSampleData(xValue: 6, yValue: 359, secondSeriesYValue: 0),
      ChartSampleData(xValue: 7, yValue: 272, secondSeriesYValue: 0),
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
        child: Column(
          children: [
            _buildStepsChart(),
            _buildWaterChart(),
          ],
        ),
      ),
    );
  }

  Widget _buildStepsChart() {
    return _buildChart('Steps', Colors.amber, stepsData);
  }

  Widget _buildWaterChart() {
    return _buildChart('Water', Colors.blue, waterData);
  }

  Widget _buildChart(
      String seriesName, Color seriesColor, List<ChartSampleData> data) {
    return SfCartesianChart(
      title: ChartTitle(text: '$seriesName History'),
      plotAreaBorderWidth: 0,
      legend: Legend(isVisible: true, position: LegendPosition.top),
      primaryXAxis: NumericAxis(
          title: AxisTitle(text: 'Day'),
          minimum: 0,
          maximum: 8,
          interval: 1,
          majorGridLines: MajorGridLines(width: 0),
          majorTickLines: MajorTickLines(size: 0),
          edgeLabelPlacement: EdgeLabelPlacement.hide),
      primaryYAxis: NumericAxis(
          title: AxisTitle(text: seriesName),
          axisLine: AxisLine(width: 0),
          majorTickLines: MajorTickLines(size: 0)),
      series: getDefaultNumericSeries(seriesName, seriesColor, data),
      tooltipBehavior: _tooltipBehavior,
    );
  }

  List<ColumnSeries<ChartSampleData, num>> getDefaultNumericSeries(
      String seriesName, Color seriesColor, List<ChartSampleData> data) {
    return <ColumnSeries<ChartSampleData, num>>[
      ColumnSeries<ChartSampleData, num>(
        dataSource: data,
        color: seriesColor,
        xValueMapper: (ChartSampleData sales, _) => sales.xValue as num,
        yValueMapper: (ChartSampleData sales, _) => sales.yValue,
        name: seriesName,
      ),
    ];
  }

  @override
  void dispose() {
    stepsData.clear();
    waterData.clear();
    super.dispose();
  }
}
