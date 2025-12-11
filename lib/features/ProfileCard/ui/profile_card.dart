import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    final isSmallScreen = size.width < 600;

    return Container(
      width: isSmallScreen ? size.width * 0.9 : 300,
      padding: EdgeInsets.all(size.width * 0.02),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 20,
            offset: Offset(0, 10),
          ),
        ],
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            theme.colorScheme.surface,
            theme.colorScheme.surface.withOpacity(0.8),
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: theme.colorScheme.primary,
                width: 3,
              ),
            ),
            child: ClipOval(
              child: Image.asset(
                'assets/images/profile.jpg',
                fit: BoxFit.cover,
                width: 120,
                height: 120,
              ),
            ),
          ),

          SizedBox(height: size.height * 0.02),

          // Name and Designation with responsive font sizes
          Text(
            "Ankit Sharma",
            style: TextStyle(
              fontSize: (size.width * 0.015).clamp(20.0, 24.0),
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 5),

          Text(
            "Flutter Developer",
            style: TextStyle(
              fontSize: (size.width * 0.01).clamp(14.0, 16.0),
              color: theme.colorScheme.primary,
              fontWeight: FontWeight.w500,
            ),
          ),

          SizedBox(height: size.height * 0.02),

          // Responsive Social Media Links
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildSocialButton(
                icon: FontAwesomeIcons.github,
                url: "https://github.com/ankitsharma098",
                context: context,
                size: size,
              ),
              SizedBox(width: size.width * 0.02),
              _buildSocialButton(
                icon: FontAwesomeIcons.linkedin,
                url: "https://www.linkedin.com/in/ankit-sharma-037379223/",
                context: context,
                size: size,
              ),
              SizedBox(width: size.width * 0.02),
              _buildSocialButton(
                icon: FontAwesomeIcons.envelope,
                url:
                    "https://mail.google.com/mail/?view=cm&fs=1&to=ankits45987@gmail.com",
                context: context,
                size: size,
              ),
            ],
          ),

          SizedBox(height: size.height * 0.025),

          // Contact Information with responsive spacing
          ...[
            _buildContactItem(
              icon: Icons.phone,
              title: "Phone",
              value: "+91 7302104299",
              context: context,
              size: size,
            ),
            _buildContactItem(
              icon: Icons.email,
              title: "Email",
              value: "ankits45987@gmail.com",
              context: context,
              size: size,
            ),
            _buildContactItem(
              icon: Icons.location_on,
              title: "Location",
              value: "Hapur, Uttar Pradesh",
              context: context,
              size: size,
            ),
            _buildContactItem(
              icon: Icons.cake,
              title: "Birthday",
              value: "May 25, 2005",
              context: context,
              size: size,
            ),
          ],

          SizedBox(height: size.height * 0.025),

          // Download CV Button with responsive sizing
          ElevatedButton.icon(
            onPressed: () {
              _launchUrl(
                  "https://drive.google.com/file/d/1jwWiH7znRKm3mjrXmczhU-4Il3RU2tYl/view?usp=sharing");
            },
            icon: Icon(Icons.download),
            label: Text("Download CV"),
            style: ElevatedButton.styleFrom(
              backgroundColor: theme.colorScheme.primary,
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(
                  horizontal: (size.width * 0.02).clamp(16.0, 30.0),
                  vertical: (size.height * 0.01).clamp(12.0, 15.0)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              minimumSize: Size(double.infinity, 50),
              elevation: 3,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialButton({
    required IconData icon,
    required String url,
    required BuildContext context,
    required Size size,
  }) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: () => _launchUrl(url),
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: theme.colorScheme.primary.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, color: theme.colorScheme.primary, size: 18),
      ),
    );
  }

  Widget _buildContactItem({
    required IconData icon,
    required String title,
    required String value,
    required BuildContext context,
    required Size size,
  }) {
    final theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: theme.colorScheme.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              color: theme.colorScheme.primary,
              size: 18,
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 12,
                    color: theme.colorScheme.onSurface.withOpacity(0.6),
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
