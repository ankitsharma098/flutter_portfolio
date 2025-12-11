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
          position: "Flutter Developer",
          company: "3FiTech Communication Pvt. Ltd.",
          duration: "June 2025 – Nov 2025",
          responsibilities: [
            "Developed full-scale Flutter apps for cryptocurrency wallets, e-commerce (Zepto-like), and real-time chat platforms",
            "Built secure wallet features with live crypto price tracking and transaction handling",
            "Implemented real-time chat with Firebase, WebSockets, and media sharing",
            "Worked full-time in a fast-paced agile team, delivering production-ready features"
          ],
        ),
        Experience(
          position: "Flutter Developer",
          company: "Metaphile Pvt. Ltd.",
          duration: "June 2024 – May 2025",
          responsibilities: [
            "Engineered a full-scale ERP-based Flutter app for both students and teachers",
            "Integrated Snowboy for hands-free voice command navigation functionalities",
            "Developed seamless RESTful API integration using the Dio package",
            "Implemented background services for real-time push notifications and data syncing using workmanager"
          ],
        ),
      ];
}
