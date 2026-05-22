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
          title: "Bitesize Golf – Coaching & Learning Platform",
          description:
              "A full-stack cross-platform golf coaching app with a dual-role system for Coaches and Pupils, built with clean architecture, BLoC state management, and a multi-tier subscription model.",
          features: [
            "Dual-role system (Coach & Pupil) with clean architecture and BLoC state management using Injectable + GetIt",
            "Multi-tier subscription and payment system integrated with PayPal, with environment-aware sandbox/production toggling",
            "Structured curriculum system: coaches design multi-level lessons with quizzes, challenges, and radar-based scoring tasks (Chip & Putt)",
            "Visual performance report cards that track student skills progression over time",
          ],
          technologies: [
            "Flutter",
            "Dart",
            "Firebase",
            "Firestore",
            "Firebase Storage",
            "PayPal",
            "BLoC"
          ],
          mockupImages: [
            'https://res.cloudinary.com/dhsqd2ku1/image/upload/v1774165266/43d8fcd6-21c0-4157-9907-04dbe1d7ecc1.png',
            'https://res.cloudinary.com/dhsqd2ku1/image/upload/v1774165406/Screenshot_20260322_131104_acyrb0.png',
            'https://res.cloudinary.com/dhsqd2ku1/image/upload/v1774165471/Screenshot_20260322_131413_ufxfbi.png',
            'https://res.cloudinary.com/dhsqd2ku1/image/upload/v1774165460/Screenshot_20260322_131226_mjbh2s.png',
            'https://res.cloudinary.com/dhsqd2ku1/image/upload/v1774165434/Screenshot_20260322_131155_imaoqf.png',
            'https://res.cloudinary.com/dhsqd2ku1/image/upload/v1774165416/Screenshot_20260322_131250_xqvnoz.png'
          ],
          githubUrl: "https://github.com/ankitsharma098",
          liveUrl: "https://apps.apple.com/in/app/bitesize-golf/id6758264576",
          
        ),
        Project(
          title: "Career Bridge – Empowering Disabled Candidates",
          description:
              "An inclusive job platform connecting skilled candidates with disabilities to potential employers, with real-time messaging, accessible workflows, and a motivational blog.",
          features: [
            "Accessible job search and application workflows tailored specifically for disabled candidates",
            "Real-time direct messaging system between employers and candidates via Socket.IO",
            "Motivational blog featuring success stories of disabled professionals",
            "Secure, accessible UI/UX designed with accessibility-first principles",
          ],
          technologies: [
            "Flutter",
            "Dart",
            "Node.js",
            "Express.js",
            "MongoDB",
            "Firebase",
            "Socket.IO"
          ],
          mockupImages: [
            "https://res.cloudinary.com/dhsqd2ku1/image/upload/v1743762449/documents/resumes/fs2d7pqvmr0efdgwlfkq.png",
            "https://res.cloudinary.com/dhsqd2ku1/image/upload/v1743762472/documents/resumes/esgvazq3hkhea0n1jcvx.png",
            "https://res.cloudinary.com/dhsqd2ku1/image/upload/v1743762497/documents/resumes/vlfc1dii6kokp3iqjx9o.png",
            "https://res.cloudinary.com/dhsqd2ku1/image/upload/v1743762517/documents/resumes/rgjswl2by46sllv3yj9e.png",
          ],
          liveUrl:
              "https://github.com/ankitsharma098/career_bridge/releases/tag/Carier",
          githubUrl: "https://github.com/ankitsharma098/career_bridge",
        ),
        Project(
          title: "Inventory Management System",
          description:
              "A comprehensive inventory management solution with an intuitive UI for seamless stock management, real-time tracking, and advanced analytics.",
          features: [
            "Add, edit, delete, search, and sort inventory items effortlessly",
            "Real-time inventory tracking with detailed item categorization",
            "Advanced search and filter capabilities for quick item location",
            "Batch operations for bulk inventory updates and data visualization for stock level alerts",
          ],
          mockupImages: [
            "https://res.cloudinary.com/dhsqd2ku1/image/upload/v1743762547/documents/resumes/o5d0feqgrzk2vxijbudp.png",
            "https://res.cloudinary.com/dhsqd2ku1/image/upload/v1743762573/documents/resumes/mhmivdfisyvyfaltascu.png",
            "https://res.cloudinary.com/dhsqd2ku1/image/upload/v1743762594/documents/resumes/nkavbh939lyqgqwhl45b.png",
            "https://res.cloudinary.com/dhsqd2ku1/image/upload/v1743762623/documents/resumes/efoayyyp6otgzhmyufsp.png",
          ],
          technologies: ["Flutter", "Dart", "SQLite"],
          githubUrl: "https://github.com/ankitsharma098/Inventory-Management",
          liveUrl:
              "https://github.com/ankitsharma098/Inventory-Management/releases/tag/v1.0.0",
        ),
        Project(
          title: "AI-Powered Chatbot",
          description:
              "An intelligent chatbot capable of processing both text-based and image-based queries, with Gemini API integration, voice conversion, and local storage for responses.",
          features: [
            "Seamless integration with Gemini API for natural language processing and image analysis",
            "Text-to-voice conversion with local storage for saving generated voice responses",
            "Advanced image recognition and context-aware response system",
            "Multi-modal input support: text, images, and voice",
          ],
          mockupImages: [
            "https://res.cloudinary.com/dhsqd2ku1/image/upload/v1743762210/documents/resumes/cdro2pczbglimap3ay0v.png",
            "https://res.cloudinary.com/dhsqd2ku1/image/upload/v1743762323/documents/resumes/balplfxwene3cx6raryu.png",
            "https://res.cloudinary.com/dhsqd2ku1/image/upload/v1743762350/documents/resumes/zx4puitwlqei5sxft9zs.png",
            "https://res.cloudinary.com/dhsqd2ku1/image/upload/v1743762375/documents/resumes/twbtyake26p2jpysxwux.png",
            "https://res.cloudinary.com/dhsqd2ku1/image/upload/v1743762413/documents/resumes/cmenkbciq3nvtcggz9bc.png",
          ],
          technologies: ["Flutter", "Dart", "Gemini API", "Firebase"],
          githubUrl: "https://github.com/ankitsharma098/ChatBot",
          liveUrl:
              "https://github.com/ankitsharma098/ChatBot/releases/tag/v1.0.0",
        ),
        Project(
          title: "Screen Sense – Digital Wellbeing App",
          description:
              "A smart screen time management solution that tracks app usage with advanced analytics, usage limits, and intelligent alerts to boost productivity.",
          features: [
            "Precise app usage tracking with custom background services",
            "7-day usage history and app usage limit enforcement",
            "Comprehensive analytics dashboard for detailed insights",
            "40% increase in user productivity through intelligent usage alerts",
          ],
          mockupImages: [
            "https://res.cloudinary.com/dhsqd2ku1/image/upload/v1743762668/documents/resumes/oztzh5xb4xndvka3rcmx.png",
            "https://res.cloudinary.com/dhsqd2ku1/image/upload/v1743762698/documents/resumes/rmqfgquo3gl1acbgiopc.png",
            "https://res.cloudinary.com/dhsqd2ku1/image/upload/v1743762719/documents/resumes/nndybdzzbu7wxkylwpd6.png",
          ],
          technologies: ["Flutter", "Dart", "Local Storage"],
          githubUrl: "https://github.com/ankitsharma098/Screen-Timer",
        ),
      ];
}
