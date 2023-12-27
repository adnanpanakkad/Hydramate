import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:water_tracking_app/Screens/goalpage/addwatergoal.dart';

class MainCard extends StatelessWidget {
  final ValueListenable<String> formattedTime;
  final ValueNotifier<String?> selectedItemNotifier;

  const  MainCard({super.key, 
    required this.formattedTime,
    required this.selectedItemNotifier,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
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
            image: AssetImage('assets/images/eb8a48bad52ef6cb78500277d8b9b4ff.gif'),
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
                builder: (BuildContext context, String value, selectedItemInContainer) {
                  return Text(
                    value,
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  );
                },
              ),
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
                    borderRadius: BorderRadius.circular(30),
                  ),
                  backgroundColor: Colors.white,
                ),
                onPressed: () {
                  // Navigate to Addgoal page and pass the ValueNotifier
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Addgoal(selecteditem: selectedItemNotifier.toString()),
                    ),
                  );
                },
                child: const Text(
                  'add your goal',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
