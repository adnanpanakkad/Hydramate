import 'package:flutter/material.dart';
import 'package:kdgaugeview/kdgaugeview.dart';

class BMIDetailsScreen extends StatelessWidget {
  final double bmiValue;

  const BMIDetailsScreen({super.key, required this.bmiValue});

  String getBMIStatus() {
    if (bmiValue == 0.0) return 'Unknown';
    if (bmiValue < 18.5) return 'Underweight';
    if (bmiValue < 24.9) return 'Normal weight';
    if (bmiValue < 29.9) return 'Overweight';
    return 'Obese';
  }

  String getBMIInterpretation() {
    if (bmiValue == 0.0) return 'Please calculate BMI first';
    if (bmiValue < 18.5) {
      return 'You are underweight. Consider gaining some weight for better health.';
    }
    if (bmiValue < 24.9) return 'Congratulations! You have a normal BMI.';
    if (bmiValue < 29.9) {
      return 'You are overweight. Consider starting a healthy diet and exercise routine.try to archive 10000 steps per day';
    }
    return 'You are obese. Seek medical advice to manage your weight and try to archive 20000 steps per day';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent.shade100,
        title: const Text('BMI Details'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: SizedBox(
                  height: 300,
                  width: 300,
                  child: KdGaugeView(
                    minSpeed: 0,
                    maxSpeed: 40,
                    speed: bmiValue,
                    speedTextStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 60,
                        fontWeight: FontWeight.bold),
                    animate: true,
                    duration: const Duration(seconds: 2),
                    alertSpeedArray: const [0, 18.4, 24.9, 29.9],
                    alertColorArray: const [
                      Colors.orange,
                      Colors.green,
                      Colors.orange,
                      Colors.red
                    ],
                    unitOfMeasurement: 'BMI',
                    unitOfMeasurementTextStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.w700),
                    gaugeWidth: 15,
                    fractionDigits: 1,
                  ),
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                getBMIStatus(),
                style: const TextStyle(
                    fontSize: 36.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24.0),
              const Text(
                'BMI Value',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8.0),
              Text(
                bmiValue.toStringAsFixed(1),
                style: const TextStyle(
                    fontSize: 36.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 44.0),
              const Text(
                'Health Details',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 18.0),
              Text(
                getBMIInterpretation(),
                style: const TextStyle(fontSize: 18.0),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
