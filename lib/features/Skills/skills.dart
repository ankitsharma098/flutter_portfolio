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
                ["Flutter", "Dart",  "Android"],
                Icons.mobile_friendly,
                theme.colorScheme.primary,
              ),
              _buildSkillCategory(
                context,
                "Backend Development",
                ["Node.js", "Express.js", "REST APIs", ],
                Icons.storage,
                theme.colorScheme.secondary,
              ),
              _buildSkillCategory(
                context,
                "Databases",
                ["MongoDB", "Firebase", "SQLite"],
                Icons.storage_rounded,
                theme.colorScheme.tertiary,
              ),
              _buildSkillCategory(
                context,
                "Tools & Others",
                ["Git", "GitHub", "VS Code","Android Studio", "AWS EC2"],
                Icons.build_circle,
                Colors.teal,
              ),
            ],
          ),

          // // Languages section
          // Text(
          //   "Programming Languages",
          //   style: TextStyle(
          //     fontSize: 20,
          //     fontWeight: FontWeight.bold,
          //   ),
          // ),
          // SizedBox(height: 20),
          // Wrap(
          //   spacing: 15,
          //   runSpacing: 15,
          //   children: [
          //     "Dart",
          //     "JavaScript",
          //     "TypeScript",
          //     "Python",
          //     "Java",
          //     "C++",
          //     "HTML/CSS",
          //   ].map((language) => _buildSkillChip(context, language)).toList(),
          // ),
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
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
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
                Text(
                  skill,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          )),
        ],
      ),
    ).animate().fadeIn(duration: 600.ms);
  }

  Widget _buildSkillChip(BuildContext context, String skill) {
    return Chip(
      label: Text(skill),
      backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
      labelStyle: TextStyle(
        color: Theme.of(context).colorScheme.primary,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}