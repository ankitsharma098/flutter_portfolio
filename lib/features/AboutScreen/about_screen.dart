import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../Widgets/section_tile.dart';


class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionTitle(title: "About Me"),
          SizedBox(height: 40),
          LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 800) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 3,
                      child: _buildAboutContent(context),
                    ),
                    SizedBox(width: 40),
                    Expanded(
                      flex: 2,
                      child: _buildEducation(context),
                    ),
                  ],
                );
              } else {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildAboutContent(context),
                    SizedBox(height: 40),
                    _buildEducation(context),
                  ],
                );
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildAboutContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "I am Ankit Sharma, a passionate Computer Science Graduate from IIMT Engineering College, Meerut, with expertise in Flutter, Dart, Node.js, and MongoDB.",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ).animate().fadeIn(duration: 600.ms).moveX(begin: -30, end: 0),
        SizedBox(height: 20),
        Text(
        "With a strong foundation in cross-platform development, backend architecture, and API integration, I specialize in building scalable and impactful applications that solve real-world challenges. I thrive on creating innovative solutions that enhance user experiences and bring efficiency to digital platforms.",
          style: TextStyle(
            fontSize: 16,
          ),
        ).animate().fadeIn(duration: 600.ms, delay: 200.ms).moveX(begin: -30, end: 0),
        SizedBox(height: 20),
        Text(
          "My technical journey has equipped me with hands-on experience in Flutter, Dart, Node.js, Express.js, MongoDB, and Firebase. I'm constantly exploring new technologies and methodologies to stay at the cutting edge of development practices.",
          style: TextStyle(
            fontSize: 16,
          ),
        ).animate().fadeIn(duration: 600.ms, delay: 400.ms).moveX(begin: -30, end: 0),
        SizedBox(height: 20),
        Text(
          "As a tech enthusiast and problem solver, I approach each project with creativity and attention to detail, ensuring robust and user-friendly applications. I'm always eager to take on new challenges and contribute to meaningful projects that make a difference.",
          style: TextStyle(
            fontSize: 16,
          ),
        ).animate().fadeIn(duration: 600.ms, delay: 400.ms).moveX(begin: -30, end: 0),
      ],
    );
  }

  Widget _buildEducation(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
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
              Icon(
                Icons.school,
                color: Theme.of(context).colorScheme.primary,
              ),
              SizedBox(width: 10),
              Text(
                "Education",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Text(
            "Bachelor of Technology in Computer Science",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5),
          Text(
            "IIMT Engineering College, Meerut",
            style: TextStyle(
              fontSize: 14,
            ),
          ),
          SizedBox(height: 5),
          Text(
            "2020 - 2024",
            style: TextStyle(
              fontSize: 14,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ],
      ),
    ).animate().fadeIn(duration: 600.ms).moveY(begin: 30, end: 0);
  }
}