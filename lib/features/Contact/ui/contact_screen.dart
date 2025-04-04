import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/core/utils/snackBarUtils.dart';
import 'package:url_launcher/url_launcher.dart'; // Added for URL launching
import 'package:http/http.dart' as http;
import '../../Widgets/section_tile.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();
  bool _isLoading = false;

  Future<void> _sendEmail() async {
    if (_formKey.currentState == null || !_formKey.currentState!.validate()) {
      return;
    }
    setState(() => _isLoading = true);
    try {
      final response = await http.post(
        Uri.parse('${AppConstants.baseUrl}/send-email'),
        body: {
          'name': _nameController.text,
          'email': _emailController.text,
          'message': _messageController.text,
        },
      );

      if (response.statusCode == 200) {
        SnackBarUtils.showGreenSnackBar("Message sent successfully!", context);

        _formKey.currentState!.reset();
      } else {
        throw Exception('Failed to send email');
      }
    } catch (e) {
      SnackBarUtils.showRedSnackBar('Failed to send message: $e', context);
    } finally {
      setState(() => _isLoading = false);
    }
  }


  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(title: "Let's Connect"),
          const SizedBox(height: 40),
          LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 800) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: _buildContactForm(context)),
                    const SizedBox(width: 40),
                    Expanded(child: _buildContactInfo(context)),
                  ],
                );
              } else {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildContactInfo(context),
                    const SizedBox(height: 40),
                    _buildContactForm(context),
                  ],
                );
              }
            },
          ),
          const SizedBox(height: 60),
          const Divider(),
          const SizedBox(height: 20),
          Center(
            child: Text(
              "© ${DateTime.now().year} Ankit Sharma. All rights reserved.",
              style: TextStyle(
                color: Theme.of(context).textTheme.bodyLarge?.color?.withOpacity(0.7),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactForm(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Send me a message",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: "Name",
                border: OutlineInputBorder(),
              ),
              validator: (value) => value!.isEmpty ? 'Please enter your name' : null,
            ),
            const SizedBox(height: 15),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
              ),
              validator: (value) => value!.isEmpty || !value.contains('@')
                  ? 'Please enter a valid email'
                  : null,
            ),
            const SizedBox(height: 15),
            TextFormField(
              controller: _messageController,
              maxLines: 5,
              decoration: const InputDecoration(
                labelText: "Message",
                border: OutlineInputBorder(),
              ),
              validator: (value) => value!.isEmpty ? 'Please enter a message' : null,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _isLoading ? null : _sendEmail,
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
              child: _isLoading
                  ? LoadingAnimationWidget.twistingDots(
                leftDotColor: const Color(0xFF1A1A3F),
                rightDotColor: const Color(0xFFEA3799),
                size: 20, // Reduced size to fit button better
              )
                  : const Text("Send Message"),
            ),
          ],
        ),
      ),
    ).animate().fadeIn(duration: 600.ms).moveY(begin: 30, end: 0);
  }

  Widget _buildContactInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Get in touch",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        _buildContactCard(
          context,
          icon: FontAwesomeIcons.envelope,
          title: "Email",
          content: "ankits45987@gmail.com",
          url:"https://mail.google.com/mail/?view=cm&fs=1&to=ankits45987@gmail.com",
          index: 0,
        ),
        const SizedBox(height: 15),
        _buildContactCard(
          context,
          icon: FontAwesomeIcons.linkedin,
          title: "LinkedIn",
          content: "ankit-sharma-037379223",
          url: "https://www.linkedin.com/in/ankit-sharma-037379223/",
          index: 1,
        ),
        const SizedBox(height: 15),
        _buildContactCard(
          context,
          icon: FontAwesomeIcons.github,
          title: "GitHub",
          content: "ankitsharma098",
          url: "https://github.com/ankitsharma098",
          index: 2,
        ),
      ],
    );
  }

  Widget _buildContactCard(
      BuildContext context, {
        required IconData icon,
        required String title,
        required String content,
        required String url,
        required int index,
      }) {
    return InkWell(
      onTap: () async {
        if (await canLaunchUrl(Uri.parse(url))) {
          await launchUrl(Uri.parse(url));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Could not launch URL')),
          );
        }
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Icon(icon, color: Theme.of(context).colorScheme.primary),
            ),
            const SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Text(
                  content,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ).animate().fadeIn(duration: 600.ms, delay: (index * 100).ms).moveX(begin: -30, end: 0);
  }
}