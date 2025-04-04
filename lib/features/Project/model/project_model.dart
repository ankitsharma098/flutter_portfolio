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
        "https://res.cloudinary.com/dhsqd2ku1/image/upload/v1743762449/documents/resumes/fs2d7pqvmr0efdgwlfkq.png",
        "https://res.cloudinary.com/dhsqd2ku1/image/upload/v1743762472/documents/resumes/esgvazq3hkhea0n1jcvx.png",
        "https://res.cloudinary.com/dhsqd2ku1/image/upload/v1743762497/documents/resumes/vlfc1dii6kokp3iqjx9o.png",
        "https://res.cloudinary.com/dhsqd2ku1/image/upload/v1743762517/documents/resumes/rgjswl2by46sllv3yj9e.png",
      ],
      githubUrl: "https://github.com/ankitsharma098",
      //liveUrl: "https://career-bridge-demo.com",
    ),

    Project(
      title: "Inventory Management System",
      description: "A comprehensive inventory management solution with an intuitive UI for seamless stock management.",
      features: [
        "Add, edit, delete, search, and sort inventory items effortlessly"
      ],
      mockupImages: [
        "https://res.cloudinary.com/dhsqd2ku1/image/upload/v1743762547/documents/resumes/o5d0feqgrzk2vxijbudp.png",
       "https://res.cloudinary.com/dhsqd2ku1/image/upload/v1743762573/documents/resumes/mhmivdfisyvyfaltascu.png",
        "https://res.cloudinary.com/dhsqd2ku1/image/upload/v1743762594/documents/resumes/nkavbh939lyqgqwhl45b.png",
        "https://res.cloudinary.com/dhsqd2ku1/image/upload/v1743762623/documents/resumes/efoayyyp6otgzhmyufsp.png"


      ],
      technologies: ["Flutter", "Dart", "SQLite"],
      githubUrl: "https://github.com/ankitsharma098/Inventory-Management",
      liveUrl: "https://github.com/ankitsharma098/Inventory-Management/releases/tag/v1.0.0",
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
        "https://res.cloudinary.com/dhsqd2ku1/image/upload/v1743762210/documents/resumes/cdro2pczbglimap3ay0v.png",
        "https://res.cloudinary.com/dhsqd2ku1/image/upload/v1743762323/documents/resumes/balplfxwene3cx6raryu.png",
        "https://res.cloudinary.com/dhsqd2ku1/image/upload/v1743762350/documents/resumes/zx4puitwlqei5sxft9zs.png",
        "https://res.cloudinary.com/dhsqd2ku1/image/upload/v1743762375/documents/resumes/twbtyake26p2jpysxwux.png",
        "https://res.cloudinary.com/dhsqd2ku1/image/upload/v1743762413/documents/resumes/cmenkbciq3nvtcggz9bc.png",
      ],
      technologies: ["Flutter", "Dart", "Node.js", "AI APIs"],
      githubUrl: "https://github.com/ankitsharma098/ChatBot",
      liveUrl: "https://github.com/ankitsharma098/ChatBot/releases/tag/v1.0.0",
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
        "https://res.cloudinary.com/dhsqd2ku1/image/upload/v1743762668/documents/resumes/oztzh5xb4xndvka3rcmx.png",
        "https://res.cloudinary.com/dhsqd2ku1/image/upload/v1743762698/documents/resumes/rmqfgquo3gl1acbgiopc.png",
        "https://res.cloudinary.com/dhsqd2ku1/image/upload/v1743762719/documents/resumes/nndybdzzbu7wxkylwpd6.png"

      ],
      technologies: ["Flutter", "Dart", "Local Storage"],
      githubUrl: "https://github.com/ankitsharma098/Screen-Timer",
    ),
  ];
}