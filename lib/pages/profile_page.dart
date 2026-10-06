import 'package:flutter/material.dart';

import '../theme.dart';
import '../widgets.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(height: 16),
              const CircleAvatar(
                radius: 48,
                backgroundColor: AppColors.teal,
                child: Icon(Icons.person, size: 56, color: Colors.white),
              ),
              const SizedBox(height: 24),
              const Card(
                color: Colors.white,
                elevation: 0,
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.badge_outlined),
                      title: Text('Name'),
                      subtitle: Text('Milan'),
                    ),
                    ListTile(
                      leading: Icon(Icons.school_outlined),
                      title: Text('Role'),
                      subtitle: Text('Student'),
                    ),
                    ListTile(
                      leading: Icon(Icons.email_outlined),
                      title: Text('Email'),
                      subtitle: Text('student@example.com'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: FilledButton.icon(
                  onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Edit Profile tapped')),
                  ),
                  icon: const Icon(Icons.edit),
                  label: const Text('Edit Profile'),
                  style: FilledButton.styleFrom(
                      minimumSize: const Size.fromHeight(48)),
                ),
              ),
              const SizedBox(height: 12),
              const BackButtonBar(),
            ],
          ),
        ),
      ),
    );
  }
}
