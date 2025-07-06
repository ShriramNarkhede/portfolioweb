


import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marqueer/marqueer.dart';
import 'package:portfolio_web/widgets/SliderImage.dart';

class buildSlidingImages extends StatelessWidget {
  const buildSlidingImages({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
}
