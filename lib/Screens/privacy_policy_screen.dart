import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Privacy Policy'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildSectionTitle('1. Types data we collect'),
            _buildSectionContent('Lorem ipsum dolor sit amet, consectetur...'),
            _buildSectionTitle('2. Use of your personal data'),
            _buildSectionContent('Sed ut perspiciatis unde omnis iste natus...'),
            _buildSectionTitle('3. Disclosure of your personal data'),
            _buildSectionContent('At vero eos et accusamus et iusto odio...'),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildSectionContent(String content) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Text(
        content,
        style: const TextStyle(fontSize: 16, fontFamily: "Montserrat"),
      ),
    );
  }
}
