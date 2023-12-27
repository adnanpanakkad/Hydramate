
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:water_tracking_app/Screens/homepage/functions/bmifunctions.dart';

class HomeAppbar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.lightBlueAccent.shade100,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30),
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            bmipopup(context);
          },
          icon: const Icon(Icons.calculate),
        ),
      ],
      title: Center(
        child: Text(
          'STAY HYDRATED',
          style: GoogleFonts.yellowtail(
            textStyle: const TextStyle(color: Colors.white, letterSpacing: 0.5),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}


