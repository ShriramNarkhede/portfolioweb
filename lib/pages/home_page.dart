import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:portfolio_web/widgets/CertificateSlider.dart';

import 'package:portfolio_web/widgets/navitem.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/CustomFooter.dart';
import '../widgets/buildDesktopLayout.dart';
import '../widgets/buildHeroImage.dart';
import '../widgets/buildHeroText.dart';
import '../widgets/buildMobileLayout.dart';
import '../widgets/buildSlidingImages.dart';
import '../widgets/buildtextSlide.dart';
import '../widgets/navBarforMobile.dart';
import '../widgets/projects_Grid.dart';
import '../widgets/skillsBar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shriram Portfolio',
      debugShowCheckedModeBanner: false,
      home: PortfolioPage(),
    );
  }
}

class PortfolioPage extends StatelessWidget {
  final ValueNotifier<bool> isScrolled = ValueNotifier(false);

  PortfolioPage({super.key});

  final homeKey = GlobalKey();
  final skillskey = GlobalKey();
  final projectsKey = GlobalKey();
  final certificateKey = GlobalKey();
  final contactKey = GlobalKey();

  void scrollToSection(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
    );
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  void _openEndDrawer() {
    _scaffoldKey.currentState!.openEndDrawer();
  }

  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();

    scrollController.addListener(() {
      if (scrollController.offset > 50 && !isScrolled.value) {
        isScrolled.value = true;
      } else if (scrollController.offset <= 50 && isScrolled.value) {
        isScrolled.value = false;
      }
    });

    void closeEndDrawer() {
      Navigator.of(context).pop();
    }

    return Scaffold(
        key: _scaffoldKey,
        endDrawer: Drawer(
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue.shade300, Colors.blueGrey.shade100],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: SafeArea(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                          icon: const Icon(
                            Icons.close,
                            size: 28,
                            color: Colors.white,
                          ),
                          onPressed: closeEndDrawer,
                        ),
                      ),
                      Lottie.asset(
                        'assets/lottie.json',
                        width: 240,
                        height: 250,
                        repeat: true,
                        reverse: false,
                        animate: true,
                      ),
                      const SizedBox(height: 15),
                      Center(
                        child: Text(
                          "Growing daily — one skill, one challenge, one line of code at a time.",
                          style: GoogleFonts.poppins(color: Colors.white),
                        ),
                      ),
                      
                      const Spacer(),
                      Navbarformobile(
                        title: "Home",
                        onTap: () {
                          scrollToSection(homeKey);
                          closeEndDrawer();
                        },
                        icon: FaIcon(FontAwesomeIcons.home),
                      ),
                      const SizedBox(height: 15),
                      Navbarformobile(
                        title: "Skills",
                        onTap: () {
                          scrollToSection(skillskey);
                          closeEndDrawer();
                        },
                        icon: FaIcon(FontAwesomeIcons.tools),
                      ),
                      const SizedBox(height: 15),
                      Navbarformobile(
                        title: "Certifications",
                        onTap: () {
                          scrollToSection(certificateKey);
                          closeEndDrawer();
                        },
                        icon: FaIcon(FontAwesomeIcons.certificate),
                      ),
                      const SizedBox(height: 15),
                      Navbarformobile(
                        title: "Projects",
                        onTap: () {
                          scrollToSection(projectsKey);
                          closeEndDrawer();
                        },
                        icon: FaIcon(FontAwesomeIcons.diagramProject),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      ElevatedButton.icon(
                        icon: const Icon(Icons.mail_outline),
                        label: const Text("Contact Me"),
                        onPressed: () {
                          scrollToSection(contactKey);
                          closeEndDrawer();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),

        // Disable opening the end drawer with a swipe gesture.
        endDrawerEnableOpenDragGesture: false,
        backgroundColor: Colors.white,
        body: LayoutBuilder(builder: (context, constraints) {
          bool isMobile = constraints.maxWidth < 600;
          return Column(
            children: [
              Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1), // subtle shadow
                        spreadRadius: 2,
                        blurRadius: 6,
                        offset:
                            const Offset(0, 3), // horizontal, vertical offset
                      ),
                    ],
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                  child: isMobile ? _buildMobileNavbar() : _buildNavbar()),
              const SizedBox(height: 10),
              Expanded(
                child: SingleChildScrollView(
                    child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      KeyedSubtree(
                        key: homeKey,
                        child: isMobile
                            ? Column(
                                children: [
                                  buildHeroText(),
                                  const SizedBox(height: 20),
                                  buildHeroImage(),
                                  SizedBox(height: 10),
                                  buildtextSlide(),
                                ],
                              )
                            : Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(80, 50, 0, 0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(flex: 5, child: buildHeroText()),
                                    Expanded(
                                        flex: 4,
                                        child: Column(
                                          children: const [
                                            buildHeroImage(),
                                            SizedBox(height: 20),
                                            buildtextSlide(),
                                          ],
                                        )),
                                  ],
                                ),
                              ),
                      ),
                      const SizedBox(height: 100),
                      KeyedSubtree(
                        key: skillskey,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(80, 0, 0, 0),
                          child: Text(
                            "Skills & Services",
                            style: GoogleFonts.poppins(
                              color: Colors.lightBlueAccent,
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 00),
                        child: buildSlidingImages(),
                      ),
                      SizedBox(height: 20),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Coding Skills Column
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                sectionTitle("Coding Skills"),
                                const SizedBox(height: 20),
                                skillsBar(
                                    label: "Java",
                                    iconPath: "assets/java.png",
                                    progress: 1.5,
                                    context: context),
                                skillsBar(
                                    label: "Javascript",
                                    iconPath: "assets/js.png",
                                    progress: 0.7,
                                    context: context),
                                skillsBar(
                                    label: "Flutter",
                                    iconPath: "assets/flutter.png",
                                    progress: 0.5,
                                    context: context),
                                skillsBar(
                                    label: "Python",
                                    iconPath: "assets/python.png",
                                    progress: 0.6,
                                    context: context),
                              ],
                            ),
                          ),
                          const SizedBox(width: 40),

                          // Professional Skills Column
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                sectionTitle("Professional Skills"),
                                const SizedBox(height: 20),
                                skillsBar(
                                    label: "Android Development",
                                    iconPath: "assets/andoid.png",
                                    progress: 0.9,
                                    context: context),
                                skillsBar(
                                    label: "AI ML",
                                    iconPath: "assets/ai.png",
                                    progress: 0.3,
                                    context: context),
                                skillsBar(
                                    label: "Web Development",
                                    iconPath: "assets/webdev.png",
                                    progress: 0.7,
                                    context: context),
                                skillsBar(
                                    label: "WordPress",
                                    iconPath: "assets/wordpress.png",
                                    progress: 0.3,
                                    context: context),
                              ],
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),
                      // Certifications Column
                      KeyedSubtree(
                        key: certificateKey,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                          child: Text(
                            "Certifications",
                            style: GoogleFonts.poppins(
                              color: Colors.lightBlueAccent,
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      CertificateSlider(),
                      const SizedBox(height: 40),
                      // Projects Column
                      KeyedSubtree(
                        key: projectsKey,
                        child: Text(
                          'MY PROJECTS',
                          style: GoogleFonts.poppins(
                            color: Colors.lightBlueAccent,
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      isMobile ? buildMobileLayout() : buildDesktopLayout(),
                      SizedBox(
                        height: 20,
                      ),

                      //projects section
                      ProjectsGrid(),
                      const SizedBox(height: 20),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'For More Click me...',
                              style: GoogleFonts.poppins(
                                fontSize: 20,
                                color: Colors.lightBlueAccent,
                                fontWeight: FontWeight.bold,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () async {
                                  Uri url = Uri.parse(
                                      "https://github.com/ShriramNarkhede?tab=repositories");
                                  if (await canLaunchUrl(url)) {
                                    await launchUrl(url);
                                  }
                                },
                            ),
                          ],
                        ),
                      ),

                      //footer section
                      const SizedBox(height: 40),
                      KeyedSubtree(key: contactKey, child: CustomFooter()),
                      const SizedBox(height: 50),
                    ],
                  ),
                )),
              ),
            ],
          );
        }));
  }

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration:
            const Duration(milliseconds: 600), // Adjust duration for smoothness
        curve: Curves.easeInOut, // Smooth animation curve
      );
    }
  }

  Widget _buildNavbar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset("assets/logot.png",
              fit: BoxFit.cover, height: 40, width: 40),
          Row(
            children: [
              navItem(
                title: "Home",
                onTap: () => _scrollToSection(homeKey),
              ),
              navItem(
                title: "Skills",
                onTap: () => _scrollToSection(skillskey),
              ),
              navItem(
                title: "Certifications",
                onTap: () => _scrollToSection(certificateKey),
              ),
              navItem(
                title: "Projects",
                onTap: () => _scrollToSection(projectsKey),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: () => _scrollToSection(contactKey),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                ),
                child: const Text(
                  "Contact me",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMobileNavbar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset("assets/logot.png",
            fit: BoxFit.cover, height: 40, width: 40),
        IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            _openEndDrawer();
            // You can implement a Drawer or Bottom Sheet here
          },
        )
      ],
    );
  }

//skills
  Widget sectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: Color(0xFF9CD6F3),
      ),
    );
  }
}
