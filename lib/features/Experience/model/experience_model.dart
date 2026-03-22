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
          company: "EVeez",
          duration: "Nov 2025 – Present",
          responsibilities: [
            "Leading development and maintenance of a production Flutter application with 400+ daily active users, ensuring scalable architecture and reliable releases",
            "Managing production environments, build flavors, and CI/CD release pipelines for stable Google Play Store deployments",
            "Developed core features for an e-bike rental platform: vehicle booking, ride tracking, and weekly payment cycle management",
            "Monitoring and optimizing app performance, stability, and production releases to support growing user traffic",
          ],
        ),
        Experience(
          position: "Flutter Developer",
          company: "3FI Tech Communications Pvt. Ltd.",
          duration: "Jan 2025 – Nov 2025",
          responsibilities: [
            "Developed 3+ production-ready mobile applications across cryptocurrency, e-commerce, and fintech domains using Flutter",
            "Built a secure cryptocurrency trading platform with real-time market data integration serving 10,000+ active users",
            "Integrated multiple payment methods including UPI, digital wallets, and credit/debit card transactions",
            "Implemented scalable solutions for transaction handling, user flows, and real-time updates",
          ],
        ),
        Experience(
          position: "Flutter Developer",
          company: "Metaphile Pvt. Ltd.",
          duration: "Jun 2024 – Nov 2024",
          responsibilities: [
            "Engineered a full-scale ERP-based Flutter app, improving educational institution workflows by 30% and reducing manual data entry errors by 50%",
            "Integrated Snowboy for voice command navigation, enhancing UX with hands-free NLP capabilities and increasing user engagement by 40%",
            "Established RESTful API connectivity through Dio package, facilitating seamless data flow between Flutter frontend and Node.js/MongoDB backend",
            "Implemented background services for push notifications and real-time data synchronization using WorkManager",
          ],
        ),
      ];
}
