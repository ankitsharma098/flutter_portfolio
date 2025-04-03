class Experience {
  final String position;
  final String company;
  final String duration;
  final List<String> responsibilities;
  final String? logo;

  Experience({
    required this.position,
    required this.company,
    required this.duration,
    required this.responsibilities,
    this.logo,
  });

  static List<Experience> get experiences => [
    Experience(
      position: "Flutter Developer Intern",
      company: "Metaphile Pvt. Ltd.",
      duration: "June 2024 – Aug 2024",
      responsibilities: [
        "Engineered a full-scale ERP-based Flutter app for both students and teachers",
        "Integrated Snowboy for hands-free voice command navigation functionalities",
        "Developed seamless RESTful API integration using the Dio package",
        "Implemented background services for real-time push notifications and data syncing using workmanager"
      ],
    ),
  ];
}