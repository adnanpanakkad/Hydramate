import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:water_tracking_app/db/functions/db_functions.dart';
import 'package:water_tracking_app/model/stepcount_model.dart';

class ChartSampleData {
  ChartSampleData({
    this.xValue,
    required this.yValue,
    // required this.secondSeriesYValue,
  });

  final dynamic xValue;
  final num yValue;
  // final num secondSeriesYValue;
}

class NumericDefault extends StatefulWidget {
  const NumericDefault({Key? key}) : super(key: key);

  @override
  NumericDefaultState createState() => NumericDefaultState();
}

class NumericDefaultState extends State<NumericDefault> {
  late TooltipBehavior _tooltipBehavior;
  List<ChartSampleData> stepsData = [];
  List<ChartSampleData> waterData = [];

  int stepCount = 0;

  void _loadStepCountFromHive() async {
    HiveDb db = HiveDb();
    Box<UserstepdataModel> stepCountBox =
        await Hive.openBox<UserstepdataModel>(db.stepCountBoxKey);
    UserstepdataModel? model = stepCountBox.get('UserDetailsTracking');
    setState(() {
      stepCount = int.parse(model!.dailystepCount);
    });
  }    

  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(
        enable: true, format: 'Score: point.y', canShowMarker: false);
    stepsData = <ChartSampleData>[
      ChartSampleData(xValue: 'Mon', yValue: stepCount),
      ChartSampleData(xValue: 'Tue', yValue: stepCount),
      ChartSampleData(xValue: 'Wed', yValue: stepCount),
      ChartSampleData(xValue: 'Thu', yValue: stepCount),
      ChartSampleData(xValue: 'Fri', yValue: stepCount),
      ChartSampleData(xValue: 'Sat', yValue: stepCount),
      ChartSampleData(xValue: 'Sun', yValue: stepCount),
    ];

    waterData = <ChartSampleData>[
      ChartSampleData(xValue: 'Mon', yValue: 236,  ),
      ChartSampleData(xValue: 'Tue', yValue: 242, ),
      ChartSampleData(xValue: 'Wed', yValue: 313, ),
      ChartSampleData(xValue: 'Thu', yValue: 359, ),
      ChartSampleData(xValue: 'Fri', yValue: 272, ),
      ChartSampleData(xValue: 'Sat', yValue: 359, ),
      ChartSampleData(xValue: 'Sun', yValue: 272, ),
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
    return _buildChart('Step Count', Colors.amber, stepsData);
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
      primaryXAxis: CategoryAxis(
        title: AxisTitle(text: 'Day'),
        majorGridLines: MajorGridLines(width: 0),
        majorTickLines: MajorTickLines(size: 0),
      ),
      primaryYAxis: NumericAxis(
          title: AxisTitle(text: seriesName),
          axisLine: AxisLine(width: 0),
          majorTickLines: MajorTickLines(size: 0)),
      series: getDefaultNumericSeries(seriesName, seriesColor, data),
      tooltipBehavior: _tooltipBehavior,
    );
  }

  List<ColumnSeries<ChartSampleData, String>> getDefaultNumericSeries(
      String seriesName, Color seriesColor, List<ChartSampleData> data) {
    return <ColumnSeries<ChartSampleData, String>>[
      ColumnSeries<ChartSampleData, String>(
        dataSource: data,
        color: seriesColor,
        xValueMapper: (ChartSampleData sales, _) => sales.xValue as String,
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
