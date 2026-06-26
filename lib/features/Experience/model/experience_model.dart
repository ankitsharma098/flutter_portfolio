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
          position: "Full Stack Mobile Developer",
          company: "EVeez",
          duration: "Nov 2025 – Present",
          responsibilities: [
            "Leading end-to-end development of a production e-bike rental platform (400+ DAU) — both the Flutter mobile app and the Node.js/Express backend",
            "Own the full stack: Flutter client architecture + Node.js/Express REST APIs for vehicle booking, ride tracking, and weekly payment cycle management",
            "Managing CI/CD pipelines, build flavors, and production deployments across mobile and backend services",
            "Monitoring and optimizing performance across the Flutter frontend and Node.js backend to support growing user traffic",
          ],
        ),
        Experience(
          position: "Mobile Developer",
          company: "3FI Tech Communications Pvt. Ltd.",
          duration: "Jan 2025 – Nov 2025",
          responsibilities: [
            "Developed 3+ production-ready mobile applications across cryptocurrency, e-commerce, and fintech, working with Flutter and Node.js backend services",
            "Built a secure cryptocurrency trading platform with real-time market data integration serving 10,000+ active users",
            "Integrated multiple payment methods including UPI, digital wallets, and credit/debit cards",
            "Collaborated on API design and backend integration for real-time trading data and payment processing",
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
