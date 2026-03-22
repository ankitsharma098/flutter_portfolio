import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../Widgets/section_tile.dart';

class SkillsScreen extends StatelessWidget {
  const SkillsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    final isSmallScreen = size.width < 800;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionTitle(title: "Skills & Technologies"),
          SizedBox(height: 40),

          // Categories
          Wrap(
            spacing: 25,
            runSpacing: 25,
            children: [
              _buildSkillCategory(
                context,
                "Mobile Development",
                ["Flutter", "Dart", "BLoC", "GetIt / Injectable", "Android"],
                Icons.mobile_friendly,
                theme.colorScheme.primary,
              ),
              _buildSkillCategory(
                context,
                "Backend Development",
                [
                  "Node.js",
                  "Express.js",
                  "REST API Design",
                  "Socket.IO",
                  "JWT / OAuth",
                  "Middleware"
                ],
                Icons.dns_rounded,
                theme.colorScheme.secondary,
              ),
              _buildSkillCategory(
                context,
                "Databases",
                [
                  "MongoDB",
                  "Firebase Firestore",
                  "Firebase Realtime DB",
                  "SQLite"
                ],
                Icons.storage_rounded,
                theme.colorScheme.tertiary,
              ),
              _buildSkillCategory(
                context,
                "Cloud & DevOps",
                [
                  "AWS",
                  "Google Cloud Console",
                  "Firebase Hosting",
                  "Google Play Store",
                  "App Store",
                  "CI/CD Pipelines"
                ],
                Icons.cloud_rounded,
                Colors.indigo,
              ),
              _buildSkillCategory(
                context,
                "Web Technologies",
                ["HTML", "CSS", "JavaScript", "React (Basic)"],
                Icons.web_rounded,
                Colors.orange,
              ),
              _buildSkillCategory(
                context,
                "Tools & Others",
                [
                  "Git",
                  "GitHub",
                  "Postman",
                  "Android Studio",
                  "VS Code",
                  "Firebase Crashlytics",
                  "Google Analytics"
                ],
                Icons.build_circle,
                Colors.teal,
              ),
              _buildSkillCategory(
                context,
                "Programming Languages",
                ["Dart", "JavaScript", "Python", "Java", "C"],
                Icons.code_rounded,
                Colors.deepPurple,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSkillCategory(
    BuildContext context,
    String title,
    List<String> skills,
    IconData icon,
    Color color,
  ) {
    return Container(
      width: 280,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
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
              Icon(icon, color: color),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 15),
          ...skills.map((skill) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  children: [
                    Icon(Icons.check_circle_outline, color: color, size: 16),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        skill,
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    ).animate().fadeIn(duration: 600.ms);
  }
}
