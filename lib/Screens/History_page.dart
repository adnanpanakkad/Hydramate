import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:water_tracking_app/db/functions/db_functions.dart';
import 'package:water_tracking_app/model/stepcount_model.dart';

class ChartSampleData {
  ChartSampleData({
    this.xValue,
    required this.yValue,
    this.waterValue,
  });

  final dynamic xValue;
  final num yValue;
  final num? waterValue;
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
      _updateStepCountChart(stepCount);
    });
  }

  void _loadWaterConsumptionFromHive() async {
    HiveDb db = HiveDb();
    Box<UserstepdataModel> waterBox =
        await Hive.openBox<UserstepdataModel>(db.stepCountBoxKey);
    UserstepdataModel? model = waterBox.get('UserDetailsTracking');
    setState(() {
      // Assuming 'waterglass' is a field that stores daily water consumption
      int waterConsumption = int.parse(model!.waterglass);
      _updateWaterChart(waterConsumption);
    });
  }

  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(
        enable: true, format: 'Score: point.y', canShowMarker: false);

    _loadStepCountFromHive();
    _loadWaterConsumptionFromHive();

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
    return _buildChart('Step Count', Colors.amber, stepsData, 'yValue');
  }

  Widget _buildWaterChart() {
    return _buildChart('Water (number of glass)', Colors.blue, waterData, 'waterValue');
  }

  Widget _buildChart(
      String seriesName, Color seriesColor, List<ChartSampleData> data, String valueField) {
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
      series: getDefaultNumericSeries(seriesName, seriesColor, data, valueField),
      tooltipBehavior: _tooltipBehavior,
    );
  }

  List<ColumnSeries<ChartSampleData, String>> getDefaultNumericSeries(
      String seriesName, Color seriesColor, List<ChartSampleData> data, String valueField) {
    return <ColumnSeries<ChartSampleData, String>>[
      ColumnSeries<ChartSampleData, String>(
        dataSource: data,
        color: seriesColor,
        xValueMapper: (ChartSampleData sales, _) => sales.xValue as String,
        yValueMapper: (ChartSampleData sales, _) {
          switch (valueField) {
            case 'yValue':
              return sales.yValue;
            case 'waterValue':
              return sales.waterValue;
            default:
              throw Exception('Invalid valueField');
          }
        },
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

  void _updateStepCountChart(int newStepCount) {
    setState(() {
      stepsData = <ChartSampleData>[
        ChartSampleData(xValue: 'Mon', yValue: newStepCount),
        ChartSampleData(xValue: 'Tue', yValue: newStepCount),
        ChartSampleData(xValue: 'Wed', yValue: newStepCount),
        ChartSampleData(xValue: 'Thu', yValue: newStepCount),
        ChartSampleData(xValue: 'Fri', yValue: newStepCount),
        ChartSampleData(xValue: 'Sat', yValue: newStepCount),
        ChartSampleData(xValue: 'Sun', yValue: newStepCount),
      ];
    });
  }

  void _updateWaterChart(int waterConsumption) {
    setState(() {
      waterData = <ChartSampleData>[
        ChartSampleData(xValue: 'Mon', waterValue: waterConsumption, yValue: 0),
        ChartSampleData(xValue: 'Tue', waterValue: waterConsumption, yValue: 0),
        ChartSampleData(xValue: 'Wed', waterValue: waterConsumption,yValue: 0),
        ChartSampleData(xValue: 'Thu', waterValue: waterConsumption,yValue: 0),
        ChartSampleData(xValue: 'Fri', waterValue: waterConsumption,yValue: 0),
        ChartSampleData(xValue: 'Sat', waterValue: waterConsumption,yValue: 0),
        ChartSampleData(xValue: 'Sun', waterValue: waterConsumption,yValue: 0),
      ];
    });
  }
}
// The rest of your code remains unchanged.
