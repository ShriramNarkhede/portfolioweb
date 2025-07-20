import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class buildTextCard extends StatelessWidget {
  const buildTextCard({
    super.key,
    required this.title,
    required this.desc,
    required this.time,
    required this.link,
  });

  final String title;
  final String desc;
  final String time;
  final String link;

  @override
  Widget build(BuildContext context) {
    final url = Uri.parse(link);
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
          const Icon(Icons.timeline, color: Colors.lightBlueAccent),
          const SizedBox(width: 5),
          Text(
            '$time',
            style: GoogleFonts.poppins(color: Colors.lightBlueAccent),
          ),
        ],
      ),
      SizedBox(
        height: 20,
      ),
      GestureDetector(
        onTap: () async {
          if (await canLaunchUrl(url)) {
            await launchUrl(url, mode: LaunchMode.externalApplication);
          } else {
            throw 'Could not launch $url';
          }
        },
        child: Row(
          children: [
            Icon(
              FontAwesomeIcons.github,
              color: Colors.black,
              size: 18,
            ),
            const SizedBox(width: 6),
            Text(
              "View on GitHub",
              style: GoogleFonts.poppins(
                fontSize:13,
                color: Colors.black,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      )
    ]);
  }
}
