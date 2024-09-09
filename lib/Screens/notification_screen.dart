import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Notifications'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: ListView(
        children: [
          _buildSectionTitle('Common'),
          _buildSwitchTile('General Notification', true),
          _buildSwitchTile('Sound', false),
          _buildSwitchTile('Vibrate', true),
          _buildSectionTitle('System & services update'),
          _buildSwitchTile('App updates', false),
          _buildSwitchTile('Promotion', true),
          _buildSectionTitle('Others'),
          _buildSwitchTile('New Service Available', false),
          _buildSwitchTile('New Tips Available', true),
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

  Widget _buildSwitchTile(String title, bool value) {
    return SwitchListTile(
      title: Text(title, style: const TextStyle(fontFamily: "Montserrat"),),
      trackColor: WidgetStatePropertyAll(Colors.blue.shade100),
      // trackOutlineColor: const WidgetStatePropertyAll(Colors.grey),
      value: value,
      onChanged: (bool newValue) {},
    );
  }
}
