import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:water_tracking_app/Screens/goalpage/widgets/goalitemcontainer.dart';
import 'package:water_tracking_app/db/functions/db_functions.dart';
import 'package:water_tracking_app/model/stepcount_model.dart';

class Addgoal extends StatefulWidget {
  const Addgoal({Key? key, required this.selectedItemNotifier})
      : super(key: key);

  final ValueNotifier<String?> selectedItemNotifier;

  @override
  AddgoalState createState() => AddgoalState();
}

class AddgoalState extends State<Addgoal> {
  List<String> numofglass = ['1', '2', '3', '4', '5', '10', '15', '20'];
  String? selecteditem = '1';
  late String? selectedItemInContainer = selecteditem;
  @override
  void initState() {
    super.initState();
    loadglasscountHive();
    selecteditem = '1'; // Initialize selecteditem inside initState
    widget.selectedItemNotifier.value = selecteditem;

    // Initialize the notifier
  }

  loadglasscountHive() async {
    HiveDb db = HiveDb();
    Box<UserstepdataModel> glassCountBox =
        await Hive.openBox<UserstepdataModel>(db.stepCountBoxKey);
    UserstepdataModel? model = glassCountBox.get('UserDetailsTracking');
    if (model != null) {
      setState(() {
        selecteditem = model.waterglass; // Parse as a string
      });
    }
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
            padding: const EdgeInsets.only(left: 130, top: 130),
            child: Container(
                height: 90,
                width: 120,
                color: Colors.lightBlueAccent.shade100,
                child: Center(
                    child: Text(
                  selecteditem!,
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
                                widget.selectedItemNotifier.value = item;
                                // Update the selected glass count in Hive
                                HiveDb().updateWaterGlassCount(
                                    int.parse(selecteditem!));
                              });
                            },
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )),
          const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MainContainer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}