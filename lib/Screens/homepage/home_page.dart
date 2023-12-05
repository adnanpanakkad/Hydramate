import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:water_tracking_app/Screens/goalpage/addwatergoal.dart';
import 'package:water_tracking_app/Screens/all_pages.dart';
import 'package:water_tracking_app/Screens/homepage/functions/bmifunctions.dart';
import 'package:water_tracking_app/Screens/homepage/widgets/appdrawer.dart';
import 'package:water_tracking_app/Screens/homepage/widgets/glassaddbutton.dart';
import 'package:water_tracking_app/db/functions/db_functions.dart';
import 'package:water_tracking_app/main.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ValueNotifier<String?> _selectedItemNotifier =
      ValueNotifier<String?>('1');

  double percentage = 0;

  String? get selecteditem => _selectedItemNotifier.value;

  incrementPercentage() {
    setState(() {
      percentage += 0.1;
      if (percentage >= 1.0) {
        percentage = 1.0;
       if (percentage == 1.0) {
          archivePopup(context);
        }
      }
    });
  }

  decrementPercentage() {
    setState(() {
      percentage -= 0.1;
      if (percentage < 0.0) {
        percentage = 0.0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    getUserImg();
    TimeOfDay time = TimeOfDay.now();
    String amPm = time.hour >= 12 ? 'PM' : 'AM'; // check if it's AM or PM
    ValueNotifier<String> formattedTime =
        ValueNotifier('${time.hourOfPeriod} : ${time.minute} $amPm');
    Timer.periodic(const Duration(seconds: 1), (timer) {
      time = TimeOfDay.now();
      formattedTime.value = '${time.hourOfPeriod} : ${time.minute} $amPm';
    });
    // double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent.shade100,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
            // top: Radius.circular(40),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              bmipopup(context);
            },
            icon: const Icon(Icons.medical_information),
          ),
        ],
        title: Center(
          child: Text(
            'STAY HYDRATED',
            style: GoogleFonts.yellowtail(
              textStyle: TextStyle(color: Colors.white, letterSpacing: 0.5),
            ),
          ),
        ),
      ),
      drawer: AppDrawer(
        userName: userName,
        userEmail: userEmail,
        imgPath: imgPath,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [],
              ),
            ),
            const SizedBox(height: 40),
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              child: Container(
                height: 200,
                width: 320,
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: const DecorationImage(
                    image: AssetImage(
                        'assets/images/eb8a48bad52ef6cb78500277d8b9b4ff.gif'),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 10,
                      left: 10,
                      child: ValueListenableBuilder(
                          valueListenable: formattedTime,
                          builder:
                              (BuildContext context, String value, Widget) {
                            return Text(
                              value,
                              style: const TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            );
                          }),
                    ),
                    const Positioned(
                      top: 45,
                      left: 10,
                      child: Text(
                        '200ml water(1 Glass)',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      left: 10,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            backgroundColor: Colors.white,
                          ),
                          onPressed: () {
                            // Navigate to Addgoal page and pass the ValueNotifier
                            Get.to(Addgoal(
                                selectedItemNotifier: _selectedItemNotifier));
                          },
                          child: const Text(
                            'add your goal',
                            style: TextStyle(color: Colors.black),
                          )),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: CircularPercentIndicator(
                    radius: 80,
                    lineWidth: 18.0,
                    percent: percentage,
                    circularStrokeCap: CircularStrokeCap.round,
                    center: Text(
                      '${(percentage * 100).toStringAsFixed(0)}%',
                      style: const TextStyle(fontSize: 20.0),
                    ),
                    progressColor: Colors.lightBlueAccent.shade100,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 40),
                  child: Container(
                    height: 120, // set the desired height
                    width: 120, // set the desired width
                    child: Card(
                      elevation: 3,
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.all(15),
                        child: Row(
                          children: [
                            Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Target',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                  Text(
                                    '${(int.parse(selecteditem!) * 200)}ml',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 60),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              AddGlassButton(
                  decrementPercentage: decrementPercentage,
                  incrementPercentage: incrementPercentage),
            ]),
            const SizedBox(height: 30),
            Text(
              'You got ${(percentage * 100).toStringAsFixed(0)}% of today’s goal, keep',
              style: TextStyle(color: Colors.grey),
            ),
            const Text('focus on your health!',
                style: TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
