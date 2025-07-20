
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class buildtextSlide extends StatelessWidget {
  const buildtextSlide({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 33,
          ),
          Text(
            "I can ",
            style: GoogleFonts.poppins(
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
                textStyle: GoogleFonts.poppins(
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
                textStyle: GoogleFonts.poppins(
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
                textStyle: GoogleFonts.poppins(
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
                textStyle: GoogleFonts.poppins(
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
                textStyle: GoogleFonts.poppins(
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
                textStyle: GoogleFonts.poppins(
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
}




