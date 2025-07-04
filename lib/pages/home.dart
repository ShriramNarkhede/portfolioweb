import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image(
                    height: 32,
                    width: 32,
                    image: AssetImage('assets/flutter.png')),
                _buildNavbar(),
              ],
            ),
          ),
          const SizedBox(height: 50),
          Container(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 60),
                      Text("Hello !",
                          style: GoogleFonts.poppins(
                              fontSize: 20, fontWeight: FontWeight.w500)),
                      const SizedBox(height: 10),
                      RichText(
                        text: TextSpan(
                          style: GoogleFonts.poppins(
                              fontSize: 32, color: Colors.black),
                          children: const [
                            TextSpan(text: "I’m "),
                            TextSpan(
                                text: "Shriram Narkhede",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold)),
                            TextSpan(
                                text:
                                    ",\nMobile App Developer & Data Science\nEnthusiast"),
                          ],
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "Innovative Digital Marketer with Expertise in Driving Online\nGrowth Through Strategic Campaigns.",
                        style: GoogleFonts.poppins(
                            fontSize: 14, color: Colors.grey[600]),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 12),
                            ),
                            child: const Text("Hire Me"),
                          ),
                          const SizedBox(width: 10),
                          OutlinedButton(
                            onPressed: () {},
                            child: const Text("Whatsapp"),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        right: 40,
                        child: CircleAvatar(
                          radius: 150,
                          backgroundImage: AssetImage(
                              'assets/background.jpg'), // add this image to your assets folder
                        ),
                      ),
                      Positioned(
                        right: 160,
                        top: 150,
                        child: _tag("WEB Designer"),
                      ),
                      Positioned(
                        right: 80,
                        bottom: 120,
                        child: _tag("UIUX Designer"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavbar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            _navItem("Home"),
            _navItem("Services"),
            _navItem("About me"),
            _navItem("Projects"),
            const SizedBox(width: 10),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
              ),
              child: const Text("Contact me"),
            ),
          ],
        ),
      ],
    );
  }

  Widget _navItem(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Text(title, style: GoogleFonts.poppins(fontSize: 16)),
    );
  }

  Widget _tag(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.blue.shade200,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(label, style: const TextStyle(color: Colors.white)),
    );
  }
}
