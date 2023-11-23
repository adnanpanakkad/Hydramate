import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:water_tracking_app/Screens/History_page.dart';
import 'package:water_tracking_app/Screens/step_tracker.dart';

class Analysispage extends StatefulWidget {
  const Analysispage({Key? key}) : super(key: key);

  @override
  State<Analysispage> createState() => _AnalysispageState();
}

class _AnalysispageState extends State<Analysispage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(height: 40),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 25),
                  child: Text(
                    'For Today',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                      fontSize: 19,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Container(
                      height: 250,
                      width: 160,
                      padding: const EdgeInsets.all(16.0),
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/waterlevel.jpg'),
                          fit: BoxFit.fill,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            top: 0,
                            left: 0,
                            child: Image.asset(
                              'assets/images/waterlevelgraph.jpg',
                              height: 120, // Adjust the height as needed
                              width: 120, // Adjust the width as needed
                            ),
                          ),
                          const Positioned(
                            top: 0,
                            left: 10,
                            child: Text(
                              "Water",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          const Positioned(
                            top: 180,
                            left: 30,
                            child: Text(
                              '2.1ltr',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (ctx) => StepTracker(),
                        ),
                      );
                    },
                    child: Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Container(
                        height: 250,
                        width: 160,
                        padding: const EdgeInsets.all(16.0),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/stepcounter.jpg'),
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Colors.white,
                        ),
                        child: const Text(
                          "Walk",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Container(
                      height: 250,
                      width: 160,
                      padding: const EdgeInsets.all(16.0),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.white,
                        // Set the background color to white
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Calories",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 50),
                          Text(
                            '510.43',
                            style: TextStyle(
                              color: Colors.lightBlueAccent.shade100,
                              fontSize: 30.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 50),
                          const Text(
                            "Kcal",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const NumericDefault());
                    },
                    child: Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        
                      ),
                      child: Container(
                        height: 250,
                        width: 160,
                        padding: const EdgeInsets.all(16.0),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/water-graph.jpg'),
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color:Colors.white,
                        ),
                        child: const Text(
                          "History",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
