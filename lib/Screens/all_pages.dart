import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:water_tracking_app/Screens/Analysis.dart';
import 'package:water_tracking_app/Screens/Profile.dart';
import 'package:water_tracking_app/Screens/home_page.dart';
import 'package:water_tracking_app/db/functions/db_functions.dart';
import 'package:water_tracking_app/main.dart';
import 'package:water_tracking_app/model/data_model.dart';
import 'package:flutter/services.dart';

String userName = 'name';
String userAge = 'age';
String userEmail = 'email';
String userPass = 'password';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  int _currentSelectedIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const Analysispage(),
    const Profilepage(),
  ];

  
  @override
  void initState() {
    getUserDatas();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getUserDatas();
    double displayWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBody: true,
      body: IndexedStack(
        index: _currentSelectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: Container(
        // padding: EdgeInsets.all(displayWidth * .02),
        margin: EdgeInsets.all(displayWidth * .05),
        height: displayWidth * .160,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.1),
              blurRadius: 30,
              offset: const Offset(0, 10),
            ),
          ],
          borderRadius: BorderRadius.circular(50),
        ),
        child: ListView.builder(
          itemCount: 3,
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: displayWidth * .10),
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              setState(() {
                _currentSelectedIndex = index;
                HapticFeedback.lightImpact();
              });
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Stack(
              children: [
                AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  curve: Curves.fastLinearToSlowEaseIn,
                  width: index == _currentSelectedIndex
                      ? displayWidth * .32
                      : displayWidth * .18,
                  alignment: Alignment.center,
                  child: AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    curve: Curves.fastLinearToSlowEaseIn,
                    height:
                        index == _currentSelectedIndex ? displayWidth * .12 : 0,
                    width:
                        index == _currentSelectedIndex ? displayWidth * .32 : 0,
                    decoration: BoxDecoration(
                      color: index == _currentSelectedIndex
                          ? Colors.blueAccent.withOpacity(.2)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  curve: Curves.fastLinearToSlowEaseIn,
                  width: index == _currentSelectedIndex
                      ? displayWidth * .30
                      : displayWidth * .18,
                  alignment: Alignment.center,
                  child: Stack(
                    children: [
                      Row(
                        children: [
                          AnimatedContainer(
                            duration: const Duration(seconds: 1),
                            curve: Curves.fastLinearToSlowEaseIn,
                            width: index == _currentSelectedIndex
                                ? displayWidth * .15
                                : 0,
                          ),
                          AnimatedOpacity(
                            opacity: index == _currentSelectedIndex ? 1 : 0,
                            duration: const Duration(seconds: 1),
                            curve: Curves.fastLinearToSlowEaseIn,
                            child: Text(
                              index == _currentSelectedIndex
                                  ? '${listOfStrings[index]}'
                                  : '',
                              style: const TextStyle(
                                color: Colors.blueAccent,
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          AnimatedContainer(
                            duration: const Duration(seconds: 1),
                            curve: Curves.fastLinearToSlowEaseIn,
                            width: index == _currentSelectedIndex
                                ? displayWidth * .03
                                : 20,
                          ),
                          Icon(
                            listOfIcons[index],
                            size: displayWidth * .076,
                            color: index == _currentSelectedIndex
                                ? Colors.blueAccent
                                : Colors.black26,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<IconData> listOfIcons = [
    Icons.home_rounded,
    Icons.favorite_rounded,
    Icons.person_rounded,
  ];

  List<String> listOfStrings = [
    'Home',
    'Analysis',
    'Profile',
  ];
}


getUserDatas() async {
    HiveDb db = HiveDb();
    Box userBox = await Hive.openBox(db.userBoxKey);

    final sharedPrefs = await SharedPreferences.getInstance();
    String email = sharedPrefs.getString(email_key_Name)!;

    UserdataModal user = await userBox.get(email);
    userName = user.name;
    userAge = user.age;
    userPass = user.password;
    userEmail = user.email;
    print('$userName');
    print('$userAge');
    print('$userPass');
    print('$userEmail');
  }
