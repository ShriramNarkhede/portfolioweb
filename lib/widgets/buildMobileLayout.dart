import 'package:flutter/material.dart';

import '_buildTextCard.dart';
import 'buildImageCard.dart';

class buildMobileLayout extends StatelessWidget {
  const buildMobileLayout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String desc1 =
        "A real-time emergency alert system developed using Kotlin for Android, aimed at enhancing women's safety through smart, responsive features. The app integrates shake detection to trigger alerts, captures the user’s live location, and automatically records an image and voice note during emergencies. It also supports Wear OS integration, enabling smartwatch-triggered alerts for faster response. The system ensures swift and silent communication with pre-defined contacts, offering a reliable layer of personal security.";
    String desc2 =
        "Turisto is a trip planning Android application built using Java and XML, designed to help users plan their trips, generate itineraries, and get budget-friendly travel suggestions. The app provides a user-centric interface to explore locations, manage travel plans, and get personalized recommendations based on preferences and budget.";
    return Column(
      children: [
        buildTextCard(title: "Protect Me App", desc: "$desc1", time: "1-6-2024 to 15-6-2024", link: ""),
        const SizedBox(height: 20),
        buildImageCard(url: "banner.png"),
        const SizedBox(height: 20),
        buildTextCard(title: "Touristo App ", desc: "$desc2", time: "1-6-2024 to 15-6-2024", link: "https://github.com/shreeram2302/Touristo_App"),
        const SizedBox(height: 20),
        buildImageCard(url: "touristobanner.png")
      ],
    );
  }
}
