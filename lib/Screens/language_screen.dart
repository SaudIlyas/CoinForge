import 'package:flutter/material.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  _LanguageScreenState createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  String _selectedLanguage = 'English (UK)';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Language'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: ListView(
        children: [
          _buildSectionTitle('Suggested'),
          _buildRadioTile('English (US)'),
          _buildRadioTile('English (UK)'),
          _buildSectionTitle('Others'),
          _buildRadioTile('Mandarin'),
          _buildRadioTile('Hindi'),
          _buildRadioTile('Spanish'),
          _buildRadioTile('French'),
          _buildRadioTile('Arabic'),
          _buildRadioTile('Russian'),
          _buildRadioTile('Indonesian'),
          _buildRadioTile('Vietnamese'),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildRadioTile(String language) {
    return RadioListTile<String>(
      fillColor: WidgetStatePropertyAll(Colors.blue.shade300),
      title: Text(language, style: const TextStyle(fontFamily: "Montserrat"),),
      value: language,
      groupValue: _selectedLanguage,
      onChanged: (String? newValue) {
        setState(() {
          _selectedLanguage = newValue!;
        });
      },
    );
  }
}
