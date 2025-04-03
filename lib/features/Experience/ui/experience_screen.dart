import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../Achievements/model/achievement_model.dart';
import '../../Widgets/section_tile.dart';
import '../model/experience_model.dart';


class ExperienceScreen extends StatelessWidget {
  const ExperienceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final experiences = Experience.experiences;
    final achievements = Achievement.achievements;

    return Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 60),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            SectionTitle(title: "Experience & Achievements"),
        SizedBox(height: 40),
        LayoutBuilder(
        builder: (context, constraints) {
      if (constraints.maxWidth > 800) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        Expanded(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Professional Experience",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            ...experiences.asMap().entries.map((entry) {
              return _buildExperienceCard(context, entry.value, entry.key);
            }).toList(),
          ],
        ),
    ),
    SizedBox(width: 40),
    Expanded(
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text(
      "Achievements",
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
      SizedBox(height: 20),
      ...achievements.asMap().entries.map((entry) {
        return _buildAchievementCard(context, entry.value, entry.key);
      }).toList(),
    ],
    ),
    ),
          ],
        );
      } else {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Professional Experience",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            ...experiences.asMap().entries.map((entry) {
              return _buildExperienceCard(context, entry.value, entry.key);
            }).toList(),
            SizedBox(height: 40),
            Text(
              "Achievements",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            ...achievements.asMap().entries.map((entry) {
              return _buildAchievementCard(context, entry.value, entry.key);
            }).toList(),
          ],
        );
      }
        },
        ),
            ],
        ),
    );
  }

  Widget _buildExperienceCard(BuildContext context, Experience experience, int index) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.all(20),
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
          Text(
            experience.position,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          SizedBox(height: 5),
          Text(
            "${experience.company} | ${experience.duration}",
            style: TextStyle(
              fontSize: 14,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          SizedBox(height: 15),
          ...experience.responsibilities.map((responsibility) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("• ", style: TextStyle(fontWeight: FontWeight.bold)),
                  Expanded(child: Text(responsibility)),
                ],
              ),
            );
          }).toList(),
        ],
      ),
    ).animate().fadeIn(duration: 600.ms, delay: (index * 100).ms).moveX(begin: -30, end: 0);
  }

  Widget _buildAchievementCard(BuildContext context, Achievement achievement, int index) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.all(20),
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
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              "🏆 ${achievement.title}",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            achievement.description,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 15),
          ...achievement.details.map((detail) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("• ", style: TextStyle(fontWeight: FontWeight.bold)),
                  Expanded(child: Text(detail)),
                ],
              ),
            );
          }).toList(),
        ],
      ),
    ).animate().fadeIn(duration: 600.ms, delay: (index * 100).ms).moveX(begin: 30, end: 0);
  }
}