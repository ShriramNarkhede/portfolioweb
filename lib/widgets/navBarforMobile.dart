import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Navbarformobile extends StatelessWidget {
  const Navbarformobile(
      {super.key,
      required this.title,
      required this.onTap,
      required this.icon});

  final String title;
  final VoidCallback onTap;
  final FaIcon icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white24,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(color: Colors.white,onPressed: () {}, icon: icon,iconSize: 24,),
          SizedBox(
            width: 6,
          ),
          InkWell(
            onTap: onTap,
            child: Text(
              title,
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
