import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsGrid extends StatelessWidget {
  final List<Project> projects = [
    Project(
      title: "Snake Game",
      description:
          "A classic Snake game built using Flutter, featuring smooth animations and responsive controls.",
      imageUrl: "assets/banners/snake_banner.png",
      link: "https://github.com/ShriramNarkhede/Snake-game-Flutter-code-.git",
    ),
    Project(
      title: "Touristo App",
      description:
          "A trip planning Android application built using XML,Java and Mysql .",
      imageUrl: "assets/touristobanner.png",
      link: "https://github.com/ShriramNarkhede/Touristo_App",
    ),
    Project(
      title: "Task Scheduler",
      description:
          "A task scheduling application that helps users manage their tasks efficiently.",
      imageUrl: "assets/banners/TaskSchedular_banner.png",
      link: "https://github.com/ShriramNarkhede/Task-Scheduler.git",
    ),
    Project(
      title: "Blog Website",
      description:
          "A personal blog website showcasing articles on various topics, built with Flutter.",
      imageUrl: "assets/banners/Blog_banner.png",
      link: "https://github.com/ShriramNarkhede/wordpress-blog.git",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        int crossAxisCount = constraints.maxWidth < 600 ? 1 : 2;

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 4 / 3,
            ),
            itemCount: projects.length,
            itemBuilder: (context, index) {
              return ProjectCard(project: projects[index]);
            },
          ),
        );
      },
    );
  }
}

class Project {
  final String title;
  final String description;
  final String imageUrl;
  final String link;

  Project(
      {required this.title,
      required this.description,
      required this.imageUrl,
      required this.link});
}

class ProjectCard extends StatefulWidget {
  final Project project;

  const ProjectCard({Key? key, required this.project}) : super(key: key);

  @override
  _ProjectCardState createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 12,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            children: [
              // Background image with dark overlay
              Container(
                width: double.infinity,
                margin: EdgeInsets.fromLTRB(0, 0, 0, 40),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(widget.project.imageUrl),
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),

              // Content over the image
              Positioned.fill(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.project.title,
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 2),
                      if (isHovered)
                        Text(
                          widget.project.description,
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      const SizedBox(height: 4),

                      // GitHub Row
                      GestureDetector(
                        onTap: () async {
                          if (await canLaunchUrl(
                              Uri.parse(widget.project.link))) {
                            final url = Uri.parse(widget.project.link);
                            await launchUrl(url,
                                mode: LaunchMode.externalApplication);
                          } else {
                            throw 'Could not launch ${widget.project.link}';
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
                                fontSize: 13,
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
