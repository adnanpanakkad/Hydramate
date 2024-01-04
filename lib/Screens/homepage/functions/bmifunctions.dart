import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:water_tracking_app/Screens/bmi_screen.dart';

 final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  
bmipopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextField(
                    controller: _heightController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'height in cm',
                      icon: Icon(Icons.accessibility_new),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: _weightController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'weight in kg',
                      icon: Icon(Icons.monitor_weight),
                    ),
                  ),
                  const SizedBox(height: 15),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightBlueAccent.shade100,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      if (_heightController.text.isNotEmpty &&
                          _weightController.text.isNotEmpty) {
                        double bmi = calculateBMI();
                        _heightController.text = '';
                        _weightController.text = '';

                        {
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(
                                  builder: (ctx) => BMIDetailsScreen(
                                        bmiValue: bmi,
                                      )));
                        }
                      }
                    },
                    child: const Text("Calculate"),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }

  double calculateBMI() {
    double height = double.parse(_heightController.text) / 100;
    double weight = double.parse(_weightController.text);

    double heightSquare = height * height;
    double result = weight / heightSquare;
    return result;
  }

  Future<void> archivePopup(BuildContext context) async {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.SUCCES,
      animType: AnimType.BOTTOMSLIDE,
      title: 'Congratulations!',
      desc: 'Archived your goal today',
      btnOkText: 'Okay',
      btnOkOnPress: () {},
    ).show();
  }