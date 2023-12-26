import 'package:flutter/material.dart';

class Emailfield extends StatelessWidget {
  final dynamic Controller;
  final String Hinttext;
  final String warning;
  const Emailfield({
    super.key,
    required this.Controller,
    required this.Hinttext,
    required this.warning,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SizedBox(
        height: 80,
        width: 500,
        child: Card(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(left: 5, top: 10),
            child: TextFormField(
              controller: Controller,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: Hinttext,
                prefixIcon: const Icon(Icons.mail_outlined, color: Colors.blue),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return warning;
                } else {
                  return null;
                }
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
            ),
          ),
        ),
      ),
    );
  }
}

class Passwordfield extends StatelessWidget {
  final dynamic Controller;
  final String Hinttext;
  final String warning;
  final dynamic obscureText;
  final dynamic passwordvisibility;
  const Passwordfield({
    super.key,
    required this.Controller,
    required this.Hinttext,
    required this.warning,
     required this.obscureText, 
     required this.passwordvisibility,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: ValueListenableBuilder<bool>(
        valueListenable: obscureText,
        builder: (context, value, child) {
          return SizedBox(
            height: 80,
            width: 500,
            child: Card(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(left: 5, top: 10),
                child: TextFormField(
                  obscureText: value,
                  controller: Controller,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: Hinttext,
                    prefixIcon: const Icon(Icons.lock, color: Colors.blue),
                    suffixIcon: IconButton(
                      icon: value
                          ? const Icon(Icons.visibility)
                          : const Icon(Icons.visibility_off),
                      onPressed: passwordvisibility,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return warning;
                    } else {
                      return null;
                    }
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
