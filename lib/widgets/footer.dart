import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomFooter extends StatelessWidget {
  const CustomFooter({super.key});

  void _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 400,
// Deep Blue background
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
          color: const Color(0xFF0A1F44),
          borderRadius: BorderRadius.circular(30)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Get in Touch',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Android innovation, Kotlin-driven development, agile iterations, lean \n'
            'product scaling, and disruptive mobile experiences.',
            style: TextStyle(
              fontSize: 14,
              color: Colors.white70,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          Wrap(
            spacing: 16,
            children: [
              IconButton(
                icon: const FaIcon(FontAwesomeIcons.instagram,
                    color: Colors.white),
                onPressed: () =>
                    _launchURL('https://www.instagram.com/shreeram_narkhede/?igsh=ZnNiODF4a2JtbWV6#'),
              ),
              IconButton(
                icon: const FaIcon(FontAwesomeIcons.linkedin,
                    color: Colors.white),
                onPressed: () =>
                    _launchURL('www.linkedin.com/in/shriram09'),
              ),
              IconButton(
                icon: const FaIcon(FontAwesomeIcons.github,
                    color: Colors.white),
                onPressed: () =>
                    _launchURL('https://github.com/shreeram2302'),
              ),
              IconButton(
                icon:
                    const FaIcon(FontAwesomeIcons.blog, color: Colors.white),
                onPressed: () => _launchURL('https://shriramsblog4.wordpress.com/'),
              ),
            ],
          ),
          const SizedBox(height: 32),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 40,
            runSpacing: 20,
            children: [
              _ContactCard(
                icon: FontAwesomeIcons.whatsapp,
                text: "What'sApp",
                url: 'https://wa.me/1234567890',
              ),
              _ContactCard(
                icon: FontAwesomeIcons.envelope,
                text: 'shreeramnarkhede@gmail.com',
                url: 'mailto:shreeramnarkhede@gmail.com',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ContactCard extends StatelessWidget {
  final IconData icon;
  final String text;
  final String url;

  const _ContactCard({
    required this.icon,
    required this.text,
    required this.url,
  });

  void _launchURL() async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _launchURL,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
        decoration: BoxDecoration(
          color: Colors.white10,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            FaIcon(icon, color: Colors.white),
            const SizedBox(width: 12),
            Text(
              text,
              style: const TextStyle(color: Colors.white, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
