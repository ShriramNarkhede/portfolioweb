import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProjectScreen extends StatelessWidget {
  const ProjectScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      backgroundColor: const Color(0xFF0F1114),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
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
          ],
        ),
      ),
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      children: [
        _buildTextCard(),
        const SizedBox(height: 20),
        _buildImageCard(),
      ],
    );
  }

  Widget _buildDesktopLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: _buildTextCard()),
        const SizedBox(width: 20),
        Expanded(child: _buildImageCard()),
      ],
    );
  }

  Widget _buildTextCard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'eCommerce UI Kit Design Template',
          style: GoogleFonts.poppins(
            fontSize: 20,
            color: Colors.lightBlueAccent,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          '   This eCommerce software UI template has the following features: With our Mobile App Templates you will the following essential features: Unlimited Downloads: There is no limitation on the number of download of source code file with the same credentials. Assets Unlimited: You will get the assets file with this that you can use in your Mobile App Templates. Nice Signup and Sign In Screen: Y…',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            const Icon(Icons.refresh, color: Colors.lightBlueAccent),
            const SizedBox(width: 5),
            Text(
              '1-6-2024 to 15-6-2024',
              style: GoogleFonts.poppins(color: Colors.lightBlueAccent),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildImageCard() {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: const DecorationImage(
          image: AssetImage('assets/images/ecommerce_ui_preview.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

// Don't forget to add the image to your assets folder and declare it in pubspec.yaml
// assets:
//   - assets/images/ecommerce_ui_preview.png
