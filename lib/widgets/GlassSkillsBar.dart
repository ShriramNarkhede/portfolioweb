import 'package:flutter/material.dart';

class SkillProgressBar extends StatelessWidget {
  final String techName;
  final String iconPath; // Use local asset path or network URL
  final double progress; // Value from 0.0 to 1.0

  const SkillProgressBar({
    Key? key,
    required this.techName,
    required this.iconPath,
    required this.progress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
       // Dark background like in image
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Row(
        children: [
          // Tech icon
          Image.asset(
            iconPath,
            width: 30,
            height: 30,
          ),
          const SizedBox(width: 10),

          // Text and bar
          Expanded(

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  techName,
                  style: const TextStyle(
                    color: Color(0xFF9CD6F3), // Light blue text
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Container(
                  height: 16,
                  padding: const EdgeInsets.fromLTRB(0, 2, 0, 2),
                  decoration: BoxDecoration(
                    color: Colors.black, // Light grey background
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: FractionallySizedBox(
                    alignment: Alignment.centerLeft,
                    widthFactor: progress, // 0.0 to 1.0
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.red, // Dark blue progress
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
}
