import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'package:typewritertext/typewritertext.dart';
import '../../core/providers/scroll_provider.dart';
import '../../core/providers/section_provider.dart';
import '../../core/providers/theme_provider.dart';
import '../AboutScreen/about_screen.dart';
import '../Contact/ui/contact_screen.dart';
import '../Experience/ui/experience_screen.dart';
import '../ProfileCard/ui/profile_card.dart';
import '../Project/ui/project_screen.dart';
import '../Skills/skills.dart';
import '../Widgets/responsive_wrapper.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final ScrollController _scrollController;
  final _sections = ["Home", "About", "Skills", "Projects", "Experience", "Contact"];

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    _scrollController.addListener(() {
      Provider.of<ScrollProvider>(context, listen: false)
          .updateScrollPosition(_scrollController.offset);

      final offset = _scrollController.offset;
      final size = MediaQuery.of(context).size;
      final isSmallScreen = size.width < 600;
      final sectionProvider = Provider.of<SectionProvider>(context, listen: false);

      if (isSmallScreen) {
        // Mobile-specific section detection
        if (offset < size.height * 2.0) {
          sectionProvider.updateSection("Home");
        } else if (offset < size.height * 3.0) {
          sectionProvider.updateSection("About");
        } else if (offset < size.height * 5.4) {
          sectionProvider.updateSection("Skills");
        } else if (offset < size.height * 10.1) {
          sectionProvider.updateSection("Projects");
        } else if (offset < size.height * 11.8) {
          sectionProvider.updateSection("Experience");
        } else {
          sectionProvider.updateSection("Contact");
        }
      } else {
        // Desktop/tablet section detection (your existing logic)
        if (offset < size.height * 0.5) {
          sectionProvider.updateSection("Home");
        } else if (offset < size.height * 1.8) {
          sectionProvider.updateSection("About");
        } else if (offset < size.height * 2.7) {
          sectionProvider.updateSection("Skills");
        } else if (offset < size.height * 7.2) {
          sectionProvider.updateSection("Projects");
        } else if (offset < size.height * 8.2) {
          sectionProvider.updateSection("Experience");
        } else {
          sectionProvider.updateSection("Contact");
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final sectionProvider = Provider.of<SectionProvider>(context);

    return Scaffold(
      body: ResponsiveCustomWrapper(
        mobile: _buildMobileLayout(),
        tablet: _buildTabletLayout(),
        desktop: _buildDesktopLayout(),
      ),
    );
  }

  Widget _buildMobileLayout() {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ankit Sharma", style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [_buildThemeToggle()],
      ),
      drawer: Drawer(
        child: _buildNavigation(isVertical: true),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            // Profile card at the top for mobile view
            Padding(
              padding: EdgeInsets.all(20),
              child: ProfileCard(),
            ),
            _buildHeroSection(),
            AboutScreen(),
            SkillsScreen(),
            ProjectsScreen(),
            ExperienceScreen(),
            ContactScreen(),
          ],
        ),
      ),
    );
  }

  Widget _buildDesktopLayout() {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Ankit Sharma",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                Row(
                  children: [
                    _buildNavigation(isVertical: false),
                    SizedBox(width: 30),
                    _buildThemeToggle(),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Left sidebar with profile card
                SingleChildScrollView(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.25, // 25% of screen width
                    constraints: BoxConstraints(
                      minWidth: 280,
                      maxWidth: 340,
                    ),
                    padding: EdgeInsets.only(left: 40, right: 20, top: 40, bottom: 20),
                    child: Column(
                      children: [
                        ProfileCard(),
                        SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),
                // Main content
                Expanded(
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    child: Column(
                      children: [
                        _buildHeroSection(),
                        AboutScreen(),
                        SkillsScreen(),
                        ProjectsScreen(),
                        ExperienceScreen(),
                        ContactScreen(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabletLayout() {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Ankit Sharma",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                Row(
                  children: [
                    _buildNavigation(isVertical: false),
                    SizedBox(width: 20),
                    _buildThemeToggle(),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SingleChildScrollView(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.35, // 35% of screen width
                    constraints: BoxConstraints(
                      minWidth: 240,
                      maxWidth: 300,
                    ),
                    padding: EdgeInsets.only(left: 20, right: 10, top: 20, bottom: 20),
                    child: Column(
                      children: [
                        ProfileCard(),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
                // Main content
                Expanded(
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    child: Column(
                      children: [
                        _buildHeroSection(),
                        AboutScreen(),
                        SkillsScreen(),
                        ProjectsScreen(),
                        ExperienceScreen(),
                        ContactScreen(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeroSection() {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    final isSmallScreen = size.width < 800;
    final valueController = TypeWriterController.fromValue(
      TypeWriterValue([
        "Flutter Developer",
        "UI/UX Designer",
        "Mobile App Developer",
        "Tech Enthusiast"
      ]),
      duration: const Duration(milliseconds: 50),
    );
    return Container(
      height: size.height,
      width: double.infinity,
      decoration: BoxDecoration(
       borderRadius: BorderRadius.circular(12),

      ),
      
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      child: Stack(
        children: [
          // Background design elements
          Positioned(
            right: -100,
            top: size.height * 0.1,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    theme.colorScheme.primary.withOpacity(0.2),
                    theme.colorScheme.primary.withOpacity(0.0),
                  ],
                ),

              ),
            ),
          ),
          Positioned(
            left: -50,
            bottom: size.height * 0.1,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,

                gradient: RadialGradient(
                  colors: [
                    theme.colorScheme.secondary.withOpacity(0.2),
                    theme.colorScheme.secondary.withOpacity(0.0),
                  ],
                ),
              ),
            ),
          ),
          // Main content
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "👋 Hello! I'm",
                style: TextStyle(
                  fontSize: isSmallScreen ? 18 : 20,
                  color: theme.colorScheme.secondary,
                  fontWeight: FontWeight.w600,
                ),
              ).animate().fadeIn(duration: 600.ms).moveX(begin: -30, end: 0),

              SizedBox(height: 10),

              Text(
                "Ankit Sharma",
                style: TextStyle(
                  fontSize: isSmallScreen ? 40 : 60,
                  fontWeight: FontWeight.bold,

                ),
              ).animate().fadeIn(duration: 800.ms, delay: 300.ms).moveX(begin: -30, end: 0),

              SizedBox(height: 10),

              Row(
                children: [
                  Text(
                    "Innovative ",
                    style: TextStyle(
                      fontSize: isSmallScreen ? 18 : 24,
                      color: theme.colorScheme.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TypeWriter(
                      controller: valueController, // valueController // streamController
                      builder: (context, value) {
                        return Text(
                          value.text,
                          maxLines: 2,
                          style: TextStyle(
                          fontSize: isSmallScreen ? 18 : 24,
                          color: theme.colorScheme.tertiary,
                          fontWeight: FontWeight.w600,
                          ),

                        );
                      }
                  )
                ],
              ).animate().fadeIn(duration: 800.ms, delay: 600.ms),

              SizedBox(height: 20),

              Container(
                constraints: BoxConstraints(maxWidth: 600),
                child: Text(
                  "I'm a passionate Computer Science Graduate with a strong foundation in modern application development. Specializing in Flutter and cross-platform solutions, I create seamless digital experiences that combine technical excellence with intuitive design.My expertise spans mobile development, backend architecture, and database management, allowing me to deliver comprehensive solutions from concept to deployment. I'm dedicated to writing clean, efficient code and building applications that not only look great but perform exceptionally.Let's collaborate to bring your ideas to life with innovative technology solutions!",
                  style: TextStyle(
                    fontSize: isSmallScreen ? 14 : 16,
                    height: 1.6,
                    color: theme.textTheme.bodyLarge?.color?.withOpacity(0.8),
                  ),
                ),
              ).animate().fadeIn(duration: 1000.ms, delay: 900.ms).moveY(begin: 20, end: 0),

              SizedBox(height: 30),

              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {

                      isSmallScreen ? _scrollController.animateTo(
                        MediaQuery.of(context).size.height * 11.8, // Contact section
                        duration: Duration(milliseconds: 800),
                        curve: Curves.easeInOutCubic,
                      ) :  _scrollController.animateTo(
                        MediaQuery.of(context).size.height * 8.5, // Contact section
                        duration: Duration(milliseconds: 800),
                        curve: Curves.easeInOutCubic,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: theme.colorScheme.primary,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text("Get In Touch"),
                  ).animate().fadeIn(duration: 600.ms, delay: 1200.ms),

                  SizedBox(width: 20),

                  OutlinedButton(
                    onPressed: () {
                      _scrollController.animateTo(
                        MediaQuery.of(context).size.height, // About section
                        duration: Duration(milliseconds: 800),
                        curve: Curves.easeInOutCubic,
                      );
                    },
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: theme.colorScheme.primary),
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text("About Me"),
                  ).animate().fadeIn(duration: 600.ms, delay: 1400.ms),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }


  Widget _buildNavigation({required bool isVertical}) {
    final sectionProvider = Provider.of<SectionProvider>(context);
    final size = MediaQuery.of(context).size;
    final isSmallScreen = size.width < 600; // Check if we're on mobile

    void scrollToSection(String section) {
      double offset = 0;

      // Different offset calculations based on screen size
      if (isSmallScreen) {
        // Mobile-specific offsets
        switch (section) {
          case "Home":
            offset = 0.9;
            break;
          case "About":
          // Add profile card height for mobile view
            offset = size.height * 2.0;
            break;
          case "Skills":
            offset = size.height * 3.7;
            break;
          case "Projects":
            offset = size.height * 5.4;
            break;
          case "Experience":
            offset = size.height * 10.1;
            break;
          case "Contact":
            offset = size.height * 11.8;
            break;
        }
      } else {
        // Desktop/Tablet offsets
        switch (section) {
          case "Home":
            offset = 0;
            break;
          case "About":
            offset = size.height * 1.0;
            break;
          case "Skills":
            offset = size.height * 2.0;
            break;
          case "Projects":
            offset = size.height * 3.2;
            break;
          case "Experience":
            offset = size.height * 7.7;
            break;
          case "Contact":
            offset = size.height * 8.6;
            break;
        }
      }

      _scrollController.animateTo(
        offset,
        duration: Duration(milliseconds: 800),
        curve: Curves.easeInOutCubic,
      );

      if (isVertical) {
        Navigator.pop(context);
      }
    }

    // Rest of your _buildNavigation method stays the same
    if (isVertical) {
      return ListView.builder(
        shrinkWrap: true,
        itemCount: _sections.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_sections[index]),
            selected: sectionProvider.currentSection == _sections[index],
            onTap: () {
              sectionProvider.updateSection(_sections[index]);
              scrollToSection(_sections[index]);
            },
          );
        },
      );
    } else {
      // Horizontal navigation code remains unchanged
      return Row(
        children: _sections.map((section) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: InkWell(
              onTap: () {
                sectionProvider.updateSection(section);
                scrollToSection(section);
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: sectionProvider.currentSection == section
                      ? Theme.of(context).colorScheme.primary.withOpacity(0.1)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: sectionProvider.currentSection == section
                        ? Theme.of(context).colorScheme.primary
                        : Colors.transparent,
                    width: 1.5,
                  ),
                ),
                child: Text(
                  section,
                  style: TextStyle(
                    fontWeight: sectionProvider.currentSection == section
                        ? FontWeight.bold
                        : FontWeight.normal,
                    color: sectionProvider.currentSection == section
                        ? Theme.of(context).colorScheme.primary
                        : null,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      );
    }
  }

  Widget _buildThemeToggle() {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return IconButton(
      icon: Icon(themeProvider.isDarkMode ?  Icons.brightness_6:Icons.nightlight),
      onPressed: () {
       themeProvider.toggleTheme();
      },
    );
  }
}