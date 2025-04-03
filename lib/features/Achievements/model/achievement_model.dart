class Achievement {
  final String title;
  final String description;
  final List<String> details;
  final String? imageUrl;

  Achievement({
    required this.title,
    required this.description,
    required this.details,
    this.imageUrl,
  });

  static List<Achievement> get achievements => [
    Achievement(
      title: "Finalist, Smart India Hackathon 2023",
      description: "National AICTE Competition",
      details: [
        "Developed a faculty performance assessment mobile application using Flutter with an intuitive UI/UX for data visualization",
        "Collaborated with a team of 6, combining skills in software development, UI/UX design, and data analytics",
        "Delivered a fully functional prototype within 48 hours, showcasing an innovative approach to performance evaluation"
      ],
    ),
  ];
}