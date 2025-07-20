import 'package:flutter/material.dart';
import 'package:portfolio_web/widgets/buildTextCard.dart';
import 'package:portfolio_web/widgets/buildImageCard.dart';

class buildDesktopLayout extends StatelessWidget {
  const buildDesktopLayout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String desc1 =
        "A real-time emergency alert system developed using Kotlin for Android, aimed at enhancing women's safety through smart, responsive features. The app integrates shake detection to trigger alerts, captures the user’s live location, and automatically records an image and voice note during emergencies. It also supports Wear OS integration, enabling smartwatch-triggered alerts for faster response. The system ensures swift and silent communication with pre-defined contacts, offering a reliable layer of personal security.";
    String desc2 =
        "Notes Sharing Platform is a web-based application built using PHP and MySQL, designed to help students upload, manage, and access academic notes efficiently. The platform offers a clean and user-friendly interface where users can sign up, log in, and browse notes organized semester-wise. It enables seamless sharing and downloading of study material, promoting academic collaboration and easy access to resources.";
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: buildTextCard(title: "Protect Me App", desc: "$desc1", time: "1-6-2024 to 15-6-2024", link: "https://github.com/ShriramNarkhede/womenSafetyApp"),
            ),
            const SizedBox(width: 20),
            Expanded(child: BuildImageCard(url: "assets/banner.png")),
          ],
        ),
        const SizedBox(height: 30),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: BuildImageCard(url: "assets/banners/Notes_banner.png")),
            const SizedBox(width: 20),
            Expanded(
              child: buildTextCard(title: "Notes Sharing Website", desc: "$desc2", time: "1-6-2024 to 15-6-2024", link: "https://github.com/ShriramNarkhede/Notes-platform-php.git"),
            ),
          ],
        ),
      ],
    );
  }
}
