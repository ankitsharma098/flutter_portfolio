class Project {
  final String title;
  final String description;
  final List<String> features;
  final List<String> technologies;
  final List<String>? mockupImages;
  final String githubUrl;
  final String? liveUrl;

  Project({
    required this.title,
    required this.description,
    required this.features,
    required this.technologies,
    this.mockupImages,
    required this.githubUrl,
    this.liveUrl,
  });

  static List<Project> get projects => [
    Project(
      title: "Career Bridge",
      description: "A job platform designed to bridge the gap between disabled skilled candidates and potential employers, creating an inclusive ecosystem for career growth.",
      features: [
        "Personalized job matching for candidates with disabilities",
        "Accessible employer-candidate communication channels",
        "Motivational blog featuring success stories and career advice",
        "Resume builder with accessibility features"
      ],
      technologies: ["Flutter", "Dart", "Node.js", "MongoDB", "Express.js","REST APIs"],
      mockupImages: [
        "assets/carer_bridge/home.png",
        "assets/carer_bridge/job stats.png",
        "assets/carer_bridge/jobs.png",
        "assets/carer_bridge/stats.png",
      ],
      githubUrl: "https://github.com/ankitsharma098",
      liveUrl: "https://career-bridge-demo.com",
    ),

    Project(
      title: "Inventory Management System",
      description: "A comprehensive inventory management solution with an intuitive UI for seamless stock management.",
      features: [
        "Add, edit, delete, search, and sort inventory items effortlessly"
      ],
      mockupImages: [
        "assets/inventory/home.png",
       "assets/inventory/add.png",
        "assets/inventory/edit.png",
        "assets/inventory/search.png"


      ],
      technologies: ["Flutter", "Dart", "SQLite"],
      githubUrl: "https://github.com/ankitsharma098/Inventory-Management",
    ),
    Project(
      title: "AI-Powered Chatbot",
      description: "An intelligent chatbot capable of processing both text-based and image-based queries.",
      features: [
        "Integrated text-to-voice conversion",
        "Chat-to-voice functionality",
        "Local storage for saving generated voice responses"
      ],
      mockupImages: [
        "assets/ai/home.png",
        "assets/ai/ai assistant.png",
        "assets/ai/search image.png",
        "assets/ai/text to speech.png",
        "assets/ai/text to speech 1.png",
      ],
      technologies: ["Flutter", "Dart", "Node.js", "AI APIs"],
      githubUrl: "https://github.com/ankitsharma098/ChatBot",
    ),
    Project(
      title: "Screen Sense",
      description: "A productivity tracking application that records the time spent on installed apps.",
      features: [
        "7-day usage history",
        "App usage limits",
        "Detailed analytics"
      ],
      mockupImages: [
        "assets/screen_sence/home.png",
        "assets/screen_sence/app limit.png",
        "assets/screen_sence/limit.png"

      ],
      technologies: ["Flutter", "Dart", "Local Storage"],
      githubUrl: "https://github.com/ankitsharma098/Screen-Timer",
    ),
  ];
}