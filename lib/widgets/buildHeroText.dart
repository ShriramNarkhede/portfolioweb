import 'dart:ui';
import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:url_launcher/url_launcher.dart';

class buildHeroText extends StatelessWidget {
  buildHeroText({
    super.key,
  });

  void _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Hello !",
            style:
                GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.w500)),
        const SizedBox(height: 10),
        RichText(
          text: TextSpan(
            style: GoogleFonts.poppins(fontSize: 38, color: Colors.black),
            children: const [
              TextSpan(text: "I’m "),
              TextSpan(
                  text: "Shriram Narkhede",
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold)),
              TextSpan(
                  text: ",\nMobile App Developer & Data Science Enthusiast"),
            ],
          ),
        ),
        const SizedBox(height: 15),
        Text(
          "Innovative Flutter Developer with Expertise in Building Scalable Cross-Platform \nApps and Driving Seamless User Experiences",
          style: GoogleFonts.poppins(fontSize: 16, color: Colors.grey[600]),
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            ElevatedButton(
              onPressed: () {
                html.window.open(
                    "https://drive.google.com/file/d/1HGVs2JST41Lsg1XowpmJ8nr71KoBqloB/view?usp=sharing",
                    "_blank"); // Opens PDF in new tab
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
              ),
              child: Text(
                "Resume",
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            ElevatedButton(
              onPressed: () => {
                _launchURL(
                    "https://wa.me/919921908795?text=Hi%20Shriram%2C%20I%20saw%20your%20portfolio%20and%20would%20like%20to%20discuss%20a%20project%20with%20you.")
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              ),
              child: const Text(
                "Hire Me",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
