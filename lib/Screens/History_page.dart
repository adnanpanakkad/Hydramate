import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:water_tracking_app/db/functions/db_functions.dart';
import 'package:water_tracking_app/model/stepcount_model.dart';
import 'package:intl/intl.dart';

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
    return _buildChart(
        'Water (number of glass)', Colors.blue, waterData, 'waterValue');
  }

  Widget _buildChart(String seriesName, Color seriesColor,
      List<ChartSampleData> data, String valueField) {
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
      series:
          getDefaultNumericSeries(seriesName, seriesColor, data, valueField),
      tooltipBehavior: _tooltipBehavior,
    );
  }

  List<ColumnSeries<ChartSampleData, String>> getDefaultNumericSeries(
      String seriesName,
      Color seriesColor,
      List<ChartSampleData> data,
      String valueField) {
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
    final List<String> days = _generateDays();
    final String today = _getFormattedDate(DateTime.now());

    setState(() {
      stepsData = List.generate(
        days.length,
        (index) => ChartSampleData(
          xValue: days[index],
          yValue: _getStepCountForDay(days[index], newStepCount),
        ),
      );
    });
  }

  void _updateWaterChart(int waterConsumption) {
    final List<String> days = _generateDays();
    final String today = _getFormattedDate(DateTime.now());

    setState(() {
      waterData = List.generate(
        days.length,
        (index) => ChartSampleData(
          xValue: days[index],
          waterValue: _getWaterConsumptionForDay(days[index], waterConsumption),
          yValue: 0,
        ),
      );
    });
  }

 int _getStepCountForDay(String day, int newStepCount) {
  // Assume you have a method to fetch historical step count data for the day
  // If data is not available, default to 0
  int previousStepCount = _fetchHistoricalStepCount(day) ?? 0;
  
  // Add today's step count to the previous step count
  return day == _getFormattedDate(DateTime.now())
      ? newStepCount + previousStepCount
      : previousStepCount;
}

int _getWaterConsumptionForDay(String day, int waterConsumption) {
  // Assume you have a method to fetch historical water consumption data for the day
  // If data is not available, default to 0
  int previousWaterConsumption = _fetchHistoricalWaterConsumption(day) ?? 0;
  
  // Add today's water consumption to the previous water consumption
  return day == _getFormattedDate(DateTime.now())
      ? waterConsumption + previousWaterConsumption
      : previousWaterConsumption;
}

// Replace the following methods with your actual code to fetch historical data
int? _fetchHistoricalStepCount(String day) {
  // Implement code to fetch historical step count data for the given day
  // Return null if data is not available
  return null;
}

int? _fetchHistoricalWaterConsumption(String day) {
  // Implement code to fetch historical water consumption data for the given day
  // Return null if data is not available
  return null;
}


  List<String> _generateDays() {
    final List<String> days = [];
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('EEE');

    for (int i = 6; i >= 0; i--) {
      final DateTime day = now.subtract(Duration(days: i));
      final String formattedDay = formatter.format(day);
      days.add(formattedDay);
    }

    return days.reversed.toList();
  }

  String _getFormattedDate(DateTime date) {
    final DateFormat formatter = DateFormat('EEE');
    return formatter.format(date);
  }
}
