import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:water_tracking_app/Screens/goalpage/widgets/goalitemcontainer.dart';
import 'package:water_tracking_app/Screens/homepage/home_page.dart';
import 'package:water_tracking_app/db/functions/db_functions.dart';
import 'package:water_tracking_app/model/stepcount_model.dart';

class Addgoal extends StatefulWidget {
 Addgoal({Key? key, required this.selecteditem}) : super(key: key);

 String selecteditem = '1';

 @override
 AddgoalState createState() => AddgoalState();
}

class AddgoalState extends State<Addgoal> {
 String selecteditem = '1';
 List<String> numofglass = ['1', '2', '3', '4', '5', '10', '15', '20'];
 late String selectedItemInContainer = selecteditem;

 @override
 void initState() {
   super.initState();
   loadglasscountHive();
   numofglass = numofglass.toSet().toList();
   setState(() {
     selectedItemInContainer = selecteditem;
   });
 }

 loadglasscountHive() async {
   HiveDb db = HiveDb();
   Box<UserstepdataModel> glassCountBox =
       await Hive.openBox<UserstepdataModel>(db.stepCountBoxKey);
   UserstepdataModel? model = glassCountBox.get('UserDetailsTracking');
   if (model != null && numofglass.contains(model.waterglass)) {
     selectedItemNotifier.value = model.waterglass;
     if (mounted) {
       setState(() {
         selecteditem = model.waterglass; // Parse as a string
       });
     }
   } else {
     selectedItemNotifier.value = numofglass[0]; // Default to the first item in numofglass
   }
 }

 @override
 Widget build(BuildContext context) {
   return Scaffold(
     extendBodyBehindAppBar: true,
     appBar: AppBar(
       centerTitle: true,
       title: const Text(
         'Set Your Goal',
         style: TextStyle(color: Colors.black),
       ),
       backgroundColor: Colors.transparent,
       elevation: 0,
       iconTheme: const IconThemeData(
         color: Colors.blue,
       ),
     ),
     body: Stack(
       children: <Widget>[
         Container(
           decoration: const BoxDecoration(
             image: DecorationImage(
               image: AssetImage('assets/images/23.jpg'),
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
                selectedItemNotifier.value,
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
                          value: selectedItemNotifier.value,
                          items: numofglass.map((item) {
                            return DropdownMenuItem<String>(
                              value: item,
                              child: Text(item,
                                 style: const TextStyle(fontSize: 18)),
                            );
                          }).toList(),
                          onChanged: (item) {
                            if (numofglass.contains(item!)) {
                              selectedItemNotifier.value = item;
                              if (mounted) {
                               setState(() {
                                 selectedItemNotifier.value = item;
                                 // Update the selected glass count in Hive
                                 HiveDb().updateWaterGlassCount(
                                     int.parse(selectedItemNotifier.value));
                               });
                              }
                            }
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
