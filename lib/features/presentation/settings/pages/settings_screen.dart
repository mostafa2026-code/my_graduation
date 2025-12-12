import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          _buildSettingsItem(
            context,
            icon: Icons.person_outline,
            title: 'Account',
            onTap: () {
              // TODO: Navigate to Account
            },
          ),
          _buildSettingsItem(
            context,
            icon: Icons.notifications_outlined,
            title: 'Notifications',
            onTap: () {
              // TODO: Navigate to Notifications
            },
          ),
          _buildSettingsItem(
            context,
            icon: Icons.language,
            title: 'Language',
            onTap: () {
              // TODO: Change Language
            },
          ),
          const Divider(),
          _buildSettingsItem(
            context,
            icon: Icons.help_outline,
            title: 'Help & Support',
            onTap: () {
              // TODO: Navigate to Help
            },
          ),
          _buildSettingsItem(
            context,
            icon: Icons.info_outline,
            title: 'About',
            onTap: () {
              // TODO: Show About
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}