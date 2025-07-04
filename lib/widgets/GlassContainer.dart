import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Certificate {
  final String title;
  final String org;
  final String date;
  final String skills;

  Certificate({
    required this.title,
    required this.org,
    required this.date,
    required this.skills,
  });
}

class CertificateSlider extends StatefulWidget {
  const CertificateSlider({Key? key}) : super(key: key);

  @override
  State<CertificateSlider> createState() => _CertificateSliderState();
}

class _CertificateSliderState extends State<CertificateSlider> {
  final ScrollController _scrollController = ScrollController();

  final List<Certificate> certificates = [
    Certificate(
      title: "Getting started with Flutter",
      org: "Infosys",
      date: "AUG 2023",
      skills: "Flutter, Dart",
    ),
    Certificate(
      title: "Cloud Fundamentals",
      org: "Microsoft",
      date: "SEP 2023",
      skills: "Azure, DevOps",
    ),
    Certificate(
      title: "AI for Everyone",
      org: "Coursera",
      date: "OCT 2023",
      skills: "AI Basics, Neural Nets",
    ),
    Certificate(
      title: "Java Fullstack",
      org: "Internshala",
      date: "DEC 2023",
      skills: "Java, Spring, MySQL",
    ),
    Certificate(
      title: "Getting started with Flutter",
      org: "Infosys",
      date: "AUG 2023",
      skills: "Flutter, Dart",
    ),
    Certificate(
      title: "Cloud Fundamentals",
      org: "Microsoft",
      date: "SEP 2023",
      skills: "Azure, DevOps",
    ),
    Certificate(
      title: "AI for Everyone",
      org: "Coursera",
      date: "OCT 2023",
      skills: "AI Basics, Neural Nets",
    ),
    Certificate(
      title: "Java Fullstack",
      org: "Internshala",
      date: "DEC 2023",
      skills: "Java, Spring, MySQL",
    ),
  ];

  void _scrollLeft() {
    _scrollController.animateTo(
      _scrollController.offset - 300,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
  }

  void _scrollRight() {
    _scrollController.animateTo(
      _scrollController.offset + 300,
      duration: const Duration(milliseconds: 100),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      bool isDesktop = constraints.maxWidth > 600;
      double cardWidth =
          isDesktop ? 400 : MediaQuery.of(context).size.width * 0.6;

      return SizedBox(
        height: 320,
        child: Stack(
          children: [
            ListView.builder(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: certificates.length,
              itemBuilder: (context, index) {
                return Container(
                    width: cardWidth,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 20),
                    child: certificateCard(certificates[index]));
              },
            ),
            Positioned(
              left: 0,
              top: 120,
              child: IconButton(
                onPressed: _scrollLeft,
                icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
              ),
            ),
            Positioned(
              right: 0,
              top: 120,
              child: IconButton(
                onPressed: _scrollRight,
                icon: const Icon(Icons.arrow_forward_ios, color: Colors.black),
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget certificateCard(Certificate cert) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.white.withOpacity(0.25),
            Colors.blue.withOpacity(0.05),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.2), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 7,
            spreadRadius: 4,
          ),
          BoxShadow(
            color: Colors.white.withOpacity(0.3),
            offset: Offset(-2, -2),
            blurRadius: 5,
            spreadRadius: 1,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                cert.title,
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    cert.org,
                    style: const TextStyle(color: Colors.blue, fontSize: 16),
                  ),
                  Text(
                    cert.date,
                    style: const TextStyle(color: Colors.blue, fontSize: 14),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                "Skills: ${cert.skills}",
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.withOpacity(0.7),
                ),
                child: Text(
                  "View Certificate",
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.white.withOpacity(0.7),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
