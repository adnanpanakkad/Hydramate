import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:water_tracking_app/Screens/all_pages.dart';
import 'package:water_tracking_app/Screens/loginpage/login.dart';
import 'package:water_tracking_app/Screens/signuppage/widget/textformfield.dart';
import 'package:water_tracking_app/db/functions/db_functions.dart';
import 'package:water_tracking_app/main.dart';
import 'package:water_tracking_app/model/data_model.dart';

class Singnup extends StatefulWidget {
  const Singnup({super.key});

  @override
  State<Singnup> createState() => _SingnupState();
}

class _SingnupState extends State<Singnup> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 100),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) => const Login()));
                        },
                        icon: const Icon(Icons.close_rounded)),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Text(
                      'Sign Up',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Textfield(
                  Controller: _nameController,
                  Hinttext: 'Enter your name',
                  warning: 'name is required'),
              const SizedBox(height: 40),
              Textfield(
                  Controller: _ageController,
                  Hinttext: 'Enter your age',
                  warning: 'age is required'),
              const SizedBox(height: 40),
              Textfield(
                  Controller: _emailController,
                  Hinttext: 'Enter your email',
                  warning: 'email is required'),
              const SizedBox(height: 40),
              Textfield(
                  Controller: _passwordController,
                  Hinttext: 'Enter your password',
                  warning: 'password is required'),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: .10, left: 20),
                    child: SizedBox(
                        width: 340.0,
                        height: 60.0,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.lightBlueAccent.shade100),
                          child: const Text('Sign Up'),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              signup();
                            }
                          },
                        )),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> signup() async {
    final username = _nameController.text;
    final password = _passwordController.text;
    final age = _ageController.text;
    final email = _emailController.text;
    HiveDb db = HiveDb();
    Box userBox = await Hive.openBox(db.userBoxKey);

    UserdataModal? user = await userBox.get(email);

    if (username.isNotEmpty &&
        password.isNotEmpty &&
        age.isNotEmpty &&
        email.isNotEmpty) {
      if (user != null) {
        Get.snackbar('user exists', '');
      } else {
        UserdataModal model = UserdataModal(
            name: username, age: age, email: email, password: password);
        await userBox.put(email, model);

        final sharedPrefs = await SharedPreferences.getInstance();
        await sharedPrefs.setString(email_key_Name, model.email);
        await sharedPrefs.setBool(Save_key_Name, true);

        Get.to(() => MainPage());
      }
    } else {
      Get.snackbar('fill the fields', '');
    }
  }
}
