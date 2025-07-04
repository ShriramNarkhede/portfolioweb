import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marqueer/marqueer.dart';
import 'package:portfolio_web/widgets/GlassContainer.dart';
import 'package:portfolio_web/widgets/footer.dart';
import 'package:portfolio_web/widgets/slider_image.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shriram Portfolio',
      debugShowCheckedModeBanner: false,
      home: const PortfolioPage(),
    );
  }
}

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({super.key});

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
    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isMobile = constraints.maxWidth < 600;

          return SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  isMobile ? _buildMobileNavbar() : _buildNavbar(),
                  const SizedBox(height: 40),
                  isMobile
                      ? Column(
                          children: [
                            _buildHeroText(),
                            const SizedBox(height: 20),
                            _buildHeroImage(),
                          ],
                        )
                      : Padding(
                          padding: const EdgeInsets.fromLTRB(80, 50, 0, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(flex: 5, child: _buildHeroText()),
                              Expanded(
                                  flex: 4,
                                  child: Column(
                                    children: [
                                      _buildHeroImage(),
                                      SizedBox(height: 20),
                                      _buildtextSlide(),
                                    ],
                                  )),
                            ],
                          ),
                        ),
                  const SizedBox(height: 100),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(80, 0, 0, 0),
                    child: Text(
                      "Skills & Services",
                      style: GoogleFonts.poppins(
                        color: Colors.lightBlueAccent,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 00),
                    child: _buildSlidingImages(),
                  ),
                  SizedBox(height: 20),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Coding Skills Column
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            sectionTitle("Coding Skills"),
                            const SizedBox(height: 20),
                            skillBar("Java", "assets/java.png", 0.8),
                            skillBar("Javascript", "assets/js.png", 0.25),
                            skillBar("Flutter", "assets/flutter.png", 0.85),
                            skillBar("Python", "assets/python.png", 0.3),
                          ],
                        ),
                      ),
                      const SizedBox(width: 40),

                      // Professional Skills Column
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            sectionTitle("Professional Skills"),
                            const SizedBox(height: 20),
                            skillBar("Android Development", "andoid.png", 0.8),
                            skillBar(
                                "Wordpress", "wordpress.png", 0.2),
                            skillBar("AI ML", "ai.png", 0.4),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),
                  // Certifications Column
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Text(
                      "Certifications",
                      style: GoogleFonts.poppins(
                        color: Colors.lightBlueAccent,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  CertificateSlider(),
                  const SizedBox(height: 40),
                  // Projects Column
                  Text(
                    'MY PROJECTS',
                    style: GoogleFonts.poppins(
                      color: Colors.lightBlueAccent,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 30),
                  isMobile ? _buildMobileLayout() : _buildDesktopLayout(),

                  //footer section
                  const SizedBox(height: 40),
                  CustomFooter(),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

//projects section
  Widget _buildMobileLayout() {
    String desc1 = "A real-time emergency alert system developed using Kotlin for Android, aimed at enhancing women's safety through smart, responsive features. The app integrates shake detection to trigger alerts, captures the user’s live location, and automatically records an image and voice note during emergencies. It also supports Wear OS integration, enabling smartwatch-triggered alerts for faster response. The system ensures swift and silent communication with pre-defined contacts, offering a reliable layer of personal security.";
    String desc2 = "Turisto is a trip planning Android application built using Java and XML, designed to help users plan their trips, generate itineraries, and get budget-friendly travel suggestions. The app provides a user-centric interface to explore locations, manage travel plans, and get personalized recommendations based on preferences and budget.";
    return Column(
      children: [
        _buildTextCard("Protect Me App","$desc1","1-6-2024 to 15-6-2024"),
        const SizedBox(height: 20),
        _buildImageCard("banner.png"),
        const SizedBox(height: 20),
        _buildTextCard("Touristo App ","$desc2","1-6-2024 to 15-6-2024"),
        const SizedBox(height: 20),
        _buildImageCard("touristobanner.png")
      ],
    );
  }

  Widget _buildDesktopLayout() {
    String desc1 = "A real-time emergency alert system developed using Kotlin for Android, aimed at enhancing women's safety through smart, responsive features. The app integrates shake detection to trigger alerts, captures the user’s live location, and automatically records an image and voice note during emergencies. It also supports Wear OS integration, enabling smartwatch-triggered alerts for faster response. The system ensures swift and silent communication with pre-defined contacts, offering a reliable layer of personal security.";
    String desc2 = "Turisto is a trip planning Android application built using Java and XML, designed to help users plan their trips, generate itineraries, and get budget-friendly travel suggestions. The app provides a user-centric interface to explore locations, manage travel plans, and get personalized recommendations based on preferences and budget.";
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _buildTextCard("Protect Me App","$desc1","1-6-2024 to 15-6-2024"),),
            const SizedBox(width: 20),
            Expanded(child: _buildImageCard("banner.png")),
          ],
        ),
        const SizedBox(height: 30),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _buildImageCard("touristobanner.png")),
            const SizedBox(width: 20),
            Expanded(child: _buildTextCard("Touristo App ","$desc2","1-6-2024 to 15-6-2024"),),
          ],
        ),
      ],
    );
  }

  Widget _buildTextCard(String title, String desc, String time) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$title',
          style: GoogleFonts.poppins(
            fontSize: 20,
            color: Colors.lightBlueAccent,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          '$desc',
          style: GoogleFonts.poppins(
            color: Colors.grey[600],
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            const Icon(Icons.refresh, color: Colors.lightBlueAccent),
            const SizedBox(width: 5),
            Text(
              '$time',
              style: GoogleFonts.poppins(color: Colors.lightBlueAccent),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildImageCard(String url) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: AssetImage(url),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  //sliding images

  Widget _buildSlidingImages() {
    return SizedBox(
      height: 100,
      child: Marqueer(
        interaction: false,
        pps: 32,
        direction: MarqueerDirection.ltr,
        restartAfterInteractionDuration: const Duration(seconds: 3),
        child: Row(
          children: sliderItems.map((item) {
            return Card(
              elevation: 3,
              shadowColor: const Color.fromARGB(255, 100, 99, 99),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              color: const Color.fromARGB(255, 0, 0, 0),
              child: Row(
                children: [
                  SizedBox(
                    width: 100,
                    height: 75,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Image.asset(item.imagePath),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(4, 8, 16, 8),
                    child: Text(
                      item.title,
                      style: GoogleFonts.openSans(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }


  // sliding text animation
  Widget _buildtextSlide() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 33,
          ),
          Text(
            "I can ",
            style: GoogleFonts.abel(
              textStyle: TextStyle(
                color: Colors.blueAccent,
                fontSize: 24,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
                letterSpacing: 0.0,
              ),
            ),
          ),
          AnimatedTextKit(
            displayFullTextOnTap: true,
            repeatForever: true,
            animatedTexts: [
              TypewriterAnimatedText(
                'build your first app',
                textStyle: GoogleFonts.abel(
                  textStyle: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    letterSpacing: 0.0,
                  ),
                ),
              ),
              TypewriterAnimatedText(
                'edit your video',
                textStyle: GoogleFonts.abel(
                  textStyle: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    letterSpacing: 0.0,
                  ),
                ),
              ),
              TypewriterAnimatedText(
                'make you a logo',
                textStyle: GoogleFonts.abel(
                  textStyle: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    letterSpacing: 0.0,
                  ),
                ),
              ),
              TypewriterAnimatedText(
                'build you a website',
                textStyle: GoogleFonts.abel(
                  textStyle: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    letterSpacing: 0.0,
                  ),
                ),
              ),
              TypewriterAnimatedText(
                'make you a poster',
                textStyle: GoogleFonts.abel(
                  textStyle: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    letterSpacing: 0.0,
                  ),
                ),
              ),
              TypewriterAnimatedText(
                'make you a flyer',
                textStyle: GoogleFonts.abel(
                  textStyle: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    letterSpacing: 0.0,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHeroText() {
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
              onPressed: () {},
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
            const SizedBox(width: 10),
            OutlinedButton(
              onPressed: () {
                _launchURL("https://wa.me/1234567890");
              },
              child: const Text(
                "Whatsapp",
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget _buildHeroImage() {
    return SizedBox(
      height: 400,
      width: 400,
      child: Center(
          child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(300)),
        child: Image.asset("profile.png"),
      )),
    );
  }

  Widget _buildNavbar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const FlutterLogo(size: 30),
        Row(
          children: [
            _navItem("Home"),
            _navItem("Skills"),
            _navItem("Certifications"),
            _navItem("Projects"),
            const SizedBox(width: 10),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
              ),
              child: const Text("Contact me",
                  style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildMobileNavbar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const FlutterLogo(size: 30),
        IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            // You can implement a Drawer or Bottom Sheet here
          },
        )
      ],
    );
  }

//skills
  Widget sectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: Color(0xFF9CD6F3),
      ),
    );
  }

  Widget skillBar(String label, String iconPath, double progress) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Image.asset(iconPath, width: 30, height: 30),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    color: Color(0xFF9CD6F3),
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  height: 16,
                  decoration: BoxDecoration(
                    color: Color(0xFFBAC5C7), // light gray
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: FractionallySizedBox(
                    alignment: Alignment.centerLeft,
                    widthFactor: progress,
                    child: Container(
                      decoration: BoxDecoration(
                        color: progress >= 7.0
                            ? Color(0xFF85D2F9) // Dart full bar light blue
                            : Color(0xFF033F4C), // dark blue for others
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _navItem(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Text(title, style: GoogleFonts.poppins(fontSize: 16)),
    );
  }
}
