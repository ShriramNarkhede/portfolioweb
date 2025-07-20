import 'package:flutter/material.dart';

class BuildImageCard extends StatelessWidget {
  const BuildImageCard({
    super.key,
    required this.url,
  });

  final String url;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15), // Ensures rounded corners
      child: Container(
        width: double.infinity, // Ensures the container takes full width
        height: 330, // Set a fixed height for the image card 
        // Ensures the container takes full width
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(url),
            fit: BoxFit.cover, // Ensures the image covers the container
          ),
        ),
      ),
    );
  }
}
