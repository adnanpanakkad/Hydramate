import 'package:flutter/material.dart';

class AnalysisPageCardes extends StatefulWidget {
  const AnalysisPageCardes({super.key});

  @override
  State<AnalysisPageCardes> createState() => _AnalysisPageCardesState();
}

class _AnalysisPageCardesState extends State<AnalysisPageCardes> {
  @override
  Widget build(BuildContext context) {
    return Card(
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
    );
  }
}

class Analysiscard extends StatelessWidget {
  final String title;
  final String image;

  const Analysiscard({
    Key? key,
    required this.title,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Container(
        height: 250,
        width: 160,
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(image),
          ),
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Colors.white,
        ),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}