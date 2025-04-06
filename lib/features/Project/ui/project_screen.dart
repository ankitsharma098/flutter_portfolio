import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart' as carousel_slider;
import 'package:flutter_animate/flutter_animate.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Widgets/section_tile.dart';
import '../model/project_model.dart';

class ProjectsScreen extends StatefulWidget {
  const ProjectsScreen({Key? key}) : super(key: key);

  @override
  State<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  Map<int, bool> _expandedFeatures = {};
  @override
  Widget build(BuildContext context) {
    final projects = Project.projects;
    final theme = Theme.of(context);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionTitle(title: "Projects"),
          SizedBox(height: 40),
          LayoutBuilder(
            builder: (context, constraints) {
              return constraints.maxWidth > 800
                  ? _buildProjectShowcase(context, projects)
                  : _buildProjectsMobileView(context, projects);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildProjectShowcase(BuildContext context, List<Project> projects) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: projects.length,
      itemBuilder: (context, index) {
        final project = projects[index];
        // Alternate between left and right image placement
        final bool imageOnLeft = index % 2 == 0;

        return Padding(
          padding: EdgeInsets.only(bottom: 80),
          child: _buildProjectMockupRow(context, project, imageOnLeft, index),
        );
      },
    );
  }

  Widget _buildProjectMockupRow(
      BuildContext context, Project project, bool imageOnLeft, int index) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (imageOnLeft) ...[
          _buildMockupImage(context, project, index),
          SizedBox(width: 50),
          Expanded(child: _buildProjectInfo(context, project, index)),
        ] else ...[
          Expanded(child: _buildProjectInfo(context, project, index)),
          SizedBox(width: 50),
          _buildMockupImage(context, project, index),
        ]
      ],
    ).animate().fadeIn(duration: 800.ms, delay: (index * 200).ms);
  }

  Widget _buildMockupImage(BuildContext context, Project project, int index) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;

    // Mock device frame to showcase the app screenshots
    return Container(
      width: size.width * 0.4,
      height: 500,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Gradient background for visual appeal
          Container(
            width: size.width * 0.35,
            height: 450,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  theme.colorScheme.primary.withOpacity(0.2),
                  theme.colorScheme.tertiary.withOpacity(0.2),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(30),
            ),
          ),

          // Phone mockup frame
          Container(
            width: size.width * 0.22,
            height: 430,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 30,
                  offset: Offset(0, 10),
                ),
              ],
            ),
            padding: EdgeInsets.all(10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: project.mockupImages != null &&
                      project.mockupImages!.isNotEmpty
                  ? carousel_slider.CarouselSlider(
                      options: carousel_slider.CarouselOptions(
                        height: 410,
                        autoPlay: true,
                        viewportFraction: 1.0,
                        enlargeCenterPage: false,
                        autoPlayInterval: Duration(seconds: 3),
                        pauseAutoPlayOnTouch: true,
                        pauseAutoPlayOnManualNavigate: true,
                        pauseAutoPlayInFiniteScroll: true,
                      ),
                      items: project.mockupImages!.map((imageUrl) {
                        return Image.network(
                          imageUrl,
                          fit: BoxFit.cover,
                          headers: {
                            'Access-Control-Allow-Origin': '*',
                          },
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Center(
                              child: CircularProgressIndicator(
                                color: theme.colorScheme.primary,
                                value: loadingProgress.expectedTotalBytes !=
                                        null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!
                                    : null,
                              ),
                            );
                          },
                          errorBuilder: (context, url, error) => Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.image_not_supported,
                                    color: theme.colorScheme.primary, size: 40),
                                SizedBox(height: 10),
                                Text(
                                  "App UI\nMockup",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: theme.colorScheme.primary,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    )
                  : Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.phone_android,
                              color: Colors.white, size: 50),
                          SizedBox(height: 20),
                          Text(
                            project.title,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Divider(
                            color: Colors.white30,
                            indent: 40,
                            endIndent: 40,
                            height: 40,
                          ),
                          Text(
                            "UI Mockup",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
            ),
          ),

          // Decorative elements
          Positioned(
            top: 100,
            left: 20,
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: theme.colorScheme.primary.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          Positioned(
            bottom: 120,
            right: 40,
            child: Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                color: theme.colorScheme.tertiary.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProjectInfo(BuildContext context, Project project, int index) {
    final theme = Theme.of(context);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  "0${index + 1}",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.primary,
                  ),
                ),
              ),
              SizedBox(width: 10),
              AutoSizeText(
                project.title,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.primary,
                ),
              ),
            ],
          ),

          SizedBox(height: 20),

          Text(
            project.description,
            style: TextStyle(
              fontSize: 16,
              height: 1.6,
              color: theme.textTheme.bodyLarge?.color?.withOpacity(0.8),
            ),
          ),

          SizedBox(height: 30),

          Text(
            "Key Features",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.tertiary,
            ),
          ),

          SizedBox(height: 15),

          // Features with icons
          ...project.features.map((feature) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      Icons.check,
                      color: theme.colorScheme.primary,
                      size: 16,
                    ),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: Text(
                      feature,
                      style: TextStyle(
                        fontSize: 15,
                        height: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),

          SizedBox(height: 30),

          Text(
            "Technologies Used",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.tertiary,
            ),
          ),

          SizedBox(height: 15),

          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: project.technologies.map((tech) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                decoration: BoxDecoration(
                  color: _getTechColor(tech, theme).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: _getTechColor(tech, theme).withOpacity(0.3),
                    width: 1,
                  ),
                ),
                child: Text(
                  tech,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: _getTechColor(tech, theme),
                  ),
                ),
              );
            }).toList(),
          ),

          SizedBox(height: 30),

          Row(
            children: [
              if (project.githubUrl != null)
                OutlinedButton.icon(
                  onPressed: () {
                    _launchUrl(project.githubUrl);
                  },
                  icon: Icon(Icons.code),
                  label: Text("View Code"),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: theme.colorScheme.primary,
                    side: BorderSide(color: theme.colorScheme.primary),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  ),
                ),
              SizedBox(width: 15),
              if (project.liveUrl != null && project.liveUrl!.isNotEmpty)
                ElevatedButton.icon(
                  onPressed: () {
                    _launchUrl(project.liveUrl ?? "");
                  },
                  icon: Icon(Icons.language),
                  label: Text("Live Demo"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.colorScheme.primary,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProjectsMobileView(
      BuildContext context, List<Project> projects) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: projects.length,
      itemBuilder: (context, index) {
        final project = projects[index];
        return Padding(
          padding: EdgeInsets.only(bottom: 40),
          child: _buildMobileProjectCard(context, project, index),
        );
      },
    );
  }

  Widget _buildMobileProjectCard(
      BuildContext context, Project project, int index) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 15,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Mock device frame
          Container(
            height: 250,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  theme.colorScheme.primary,
                  theme.colorScheme.tertiary,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Center(
              child: Container(
                width: 140,
                height: 220,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 15,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                padding: EdgeInsets.all(8),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: project.mockupImages != null &&
                          project.mockupImages!.isNotEmpty
                      ? carousel_slider.CarouselSlider(
                          options: carousel_slider.CarouselOptions(
                            height: 204, // Adjusted for mobile size
                            autoPlay: true,
                            viewportFraction: 1.0,
                            enlargeCenterPage: false,
                            autoPlayInterval: Duration(seconds: 3),
                            pauseAutoPlayOnTouch: true,
                            pauseAutoPlayOnManualNavigate: true,
                            pauseAutoPlayInFiniteScroll: true,
                          ),
                          items: project.mockupImages!.map((imageUrl) {
                            return Image.network(
                              imageUrl,
                              fit: BoxFit.cover,
                              headers: {
                                'Access-Control-Allow-Origin': '*',
                              },
                              loadingBuilder:
                                  (context, child, loadingProgress) {
                                if (loadingProgress == null) return child;
                                return Center(
                                  child: CircularProgressIndicator(
                                    color: theme.colorScheme.primary,
                                    value: loadingProgress.expectedTotalBytes !=
                                            null
                                        ? loadingProgress
                                                .cumulativeBytesLoaded /
                                            loadingProgress.expectedTotalBytes!
                                        : null,
                                  ),
                                );
                              },
                              errorBuilder: (context, url, error) => Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.image_not_supported,
                                        color: theme.colorScheme.primary,
                                        size: 40),
                                    SizedBox(height: 10),
                                    Text(
                                      "App UI\nMockup",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: theme.colorScheme.primary,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }).toList(),
                        )
                      : Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.phone_android,
                                  color: Colors.white, size: 30),
                              SizedBox(height: 10),
                              Text(
                                project.title,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text(
                        "0${index + 1}",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: theme.colorScheme.primary,
                        ),
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        project.title,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 15),

                Text(
                  project.description,
                  style: TextStyle(
                    fontSize: 14,
                    height: 1.5,
                    color: theme.textTheme.bodyLarge?.color?.withOpacity(0.8),
                  ),
                ),

                SizedBox(height: 20),

                // Features
                ...project.features.take(2).map((feature) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.check_circle,
                          color: theme.colorScheme.primary,
                          size: 18,
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            feature,
                            style: TextStyle(
                              fontSize: 14,
                              height: 1.4,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),

                if (project.features.length > 2)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (_expandedFeatures[index] == true)
                        ...project.features.skip(2).map((feature) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.check_circle,
                                  color: theme.colorScheme.primary,
                                  size: 18,
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                  child: Text(
                                    feature,
                                    style: TextStyle(
                                      fontSize: 14,
                                      height: 1.4,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            _expandedFeatures[index] =
                                !(_expandedFeatures[index] ?? false);
                          });
                        },
                        child: Text((_expandedFeatures[index] == true)
                            ? "Show less"
                            : "+ ${project.features.length - 2} more features"),
                      ),
                    ],
                  ),

                SizedBox(height: 15),

                // Tech stack
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: project.technologies.map((tech) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: _getTechColor(tech, theme).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Text(
                            tech,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: _getTechColor(tech, theme),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),

                SizedBox(height: 20),

                // Replace the current Row with buttons in _buildMobileProjectCard with this:
                Row(
                  children: [
                    if (project.githubUrl != null)
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () {
                            _launchUrl(project.githubUrl!);
                          },
                          icon: Icon(Icons.code, size: 16),
                          label:
                              Text("View Code", style: TextStyle(fontSize: 13)),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: theme.colorScheme.primary,
                            side: BorderSide(color: theme.colorScheme.primary),
                            padding: EdgeInsets.symmetric(vertical: 10),
                          ),
                        ),
                      ),
                    SizedBox(width: 10),
                    if (project.liveUrl != null && project.liveUrl!.isNotEmpty)
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            _launchUrl(project.liveUrl!);
                          },
                          icon: Icon(Icons.language, size: 16),
                          label:
                              Text("Live Demo", style: TextStyle(fontSize: 13)),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: theme.colorScheme.primary,
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(vertical: 10),
                          ),
                        ),
                      ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    )
        .animate()
        .fadeIn(duration: 800.ms, delay: (index * 200).ms)
        .moveY(begin: 30, end: 0);
  }

  Color _getTechColor(String tech, ThemeData theme) {
    if (tech.contains("Flutter") || tech.contains("Dart")) {
      return theme.colorScheme.primary;
    } else if (tech.contains("Node") || tech.contains("Express")) {
      return theme.colorScheme.tertiary;
    } else if (tech.contains("Firebase")) {
      return Color(0xFFFFA000);
    } else if (tech.contains("Mongo")) {
      return Color(0xFF4CAF50);
    } else {
      return theme.colorScheme.secondary;
    }
  }
}
