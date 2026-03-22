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
          "I am Ankit Sharma, a Flutter Developer and Software Engineer with a B.Tech in Computer Science from IIMT Engineering College, Meerut. I specialize in building production-grade mobile applications using Flutter, Dart, and Firebase.",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ).animate().fadeIn(duration: 600.ms).moveX(begin: -30, end: 0),
        SizedBox(height: 20),
        Text(
          "Currently working at EVeez, I lead development of a live Flutter application serving 400+ daily active users on an e-bike rental platform. Previously at 3FI Tech Communications, I shipped 3+ production apps across crypto, fintech, and e-commerce domains — including a cryptocurrency trading platform with 10,000+ active users.",
          style: TextStyle(
            fontSize: 16,
          ),
        )
            .animate()
            .fadeIn(duration: 600.ms, delay: 200.ms)
            .moveX(begin: -30, end: 0),
        SizedBox(height: 20),
        Text(
          "My technical stack spans Flutter/Dart for mobile, Node.js and Express.js for backend, MongoDB and Firebase for data, and AWS/Google Cloud for deployment. I have hands-on experience with BLoC state management, clean architecture, CI/CD pipelines, and RESTful API design.",
          style: TextStyle(
            fontSize: 16,
          ),
        )
            .animate()
            .fadeIn(duration: 600.ms, delay: 400.ms)
            .moveX(begin: -30, end: 0),
        SizedBox(height: 20),
        Text(
          "As a problem solver and tech enthusiast, I approach every project with a focus on performance, scalability, and user experience — always eager to take on new challenges and deliver applications that make a real difference.",
          style: TextStyle(
            fontSize: 16,
          ),
        )
            .animate()
            .fadeIn(duration: 600.ms, delay: 600.ms)
            .moveX(begin: -30, end: 0),
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
            "Bachelor of Technology in Computer Science & Engineering",
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
            "Aug 2021 – Jul 2025",
            style: TextStyle(
              fontSize: 14,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          SizedBox(height: 5),
          Text(
            "CGPA: 8.0 / 10",
            style: TextStyle(
              fontSize: 14,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          SizedBox(height: 20),
          Divider(),
          SizedBox(height: 15),
          Row(
            children: [
              Icon(
                Icons.school_outlined,
                color: Theme.of(context).colorScheme.primary,
                size: 20,
              ),
              SizedBox(width: 10),
              Text(
                "Higher Secondary",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            "Indus Global School, Hapur",
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(height: 5),
          Text(
            "Mar 2020 – Apr 2021  |  94%",
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
