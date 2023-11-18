import 'package:flutter/material.dart';

class Addgoal extends StatefulWidget {
  const Addgoal({Key? key}) : super(key: key);

  @override
  _AddgoalState createState() => _AddgoalState();
}

class _AddgoalState extends State<Addgoal> {
  List<String> numofglass = ['1', '2', '3', '4', '5', '10', '15', '20'];
  String? selecteditem = '1';
  late String? selectedItemInContainer = selecteditem;
  @override
  void initState() {
    super.initState();
    selecteditem = '1'; // Initialize selecteditem inside initState
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // Ensure the body is behind the app bar
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Set Your Goal',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors
            .transparent, // Set the app bar's background color to transparent
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.blue, // Set the color of the back button
        ),
      ),
      body: Stack(
        children: <Widget>[
          // Background Image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/images/23.jpg'), // Replace with your own image path
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 130, top: 150),
            child: Container(
                height: 80,
                width: 120,
                color: Colors.lightBlueAccent.shade100,
                child: Center(
                    child: Text(
                  selectedItemInContainer ?? '',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 70,
                      color: Colors.white),
                ))),
          ),
          Padding(
              padding: const EdgeInsets.only(left: 90, top: 250),
              child: Container(
                height: 70,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                    ),
                    Row(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text('Number of Glasses'),
                        SingleChildScrollView(
                          child: DropdownButton<String>(
                            value: selecteditem,
                            items: numofglass.map((item) {
                              return DropdownMenuItem<String>(
                                value: item,
                                child: Text(item,
                                    style: const TextStyle(fontSize: 18)),
                              );
                            }).toList(),
                            onChanged: (item) {
                              setState(() {
                                selecteditem = item!;
                              });
                            },
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 450,
                  width: 500,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(1),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Text('Water Goal',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold)),
                      ),
                      const SizedBox(height: 10),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'We prepared a lot of goals for you!',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                      const SizedBox(height: 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 100,
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'Summer time',
                                  style: TextStyle(color: Colors.grey),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      '10 Glass',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    Icon(Icons.forest, color: Colors.green),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: 100,
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'Sporty',
                                  style: TextStyle(color: Colors.grey),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      '7 Glass',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    Icon(
                                      Icons.sports_football,
                                      color: Colors.orange,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 100,
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'Snow day',
                                  style: TextStyle(color: Colors.grey),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      '5 Glass',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    Icon(
                                      Icons.ac_unit,
                                      color: Colors.blue,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: 100,
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'Child',
                                  style: TextStyle(color: Colors.grey),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      '4 Glass',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    Icon(
                                      Icons.child_care,
                                      color: Colors.pink,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}