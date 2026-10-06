import 'package:flutter/material.dart';

import '../theme.dart';
import '../widgets.dart';
import 'add_page.dart';
import 'profile_page.dart';

class ButtonGallery extends StatefulWidget {
  const ButtonGallery({super.key});

  @override
  State<ButtonGallery> createState() => _ButtonGalleryState();
}

class _ButtonGalleryState extends State<ButtonGallery> {
  bool _favourite = false;

  void _snack(String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(message)));
  }

  // Navigator.push + waiting for a result returned by Navigator.pop
  Future<void> _openAdd() async {
    final result = await Navigator.push<String>(
      context,
      MaterialPageRoute(builder: (context) => const AddScreen()),
    );
    if (result != null) _snack('Added: $result');
  }

  // Navigator.push
  void _openProfile() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ProfileScreen()),
    );
  }

  // Named routes
  void _openDetails() => Navigator.pushNamed(context, '/details');
  void _openSettings() => Navigator.pushNamed(context, '/settings');

  // pushReplacementNamed: gallery is replaced by Login
  void _logout() => Navigator.pushReplacementNamed(context, '/');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Button Gallery'),
        actions: [
          IconButton(
            tooltip: 'Profile',
            icon: const Icon(Icons.account_circle_outlined),
            onPressed: _openProfile,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add',
        onPressed: _openAdd,
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 88),
          children: [
            SectionCard(
              title: 'Primary actions',
              icon: Icons.touch_app,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ElevatedButton(
                    onPressed: () => _snack('Saved to your list'),
                    child: const Text('Elevated - Save'),
                  ),
                  const SizedBox(height: 8),
                  FilledButton(
                    onPressed: _openDetails,
                    child: const Text('Filled - Details'),
                  ),
                  const SizedBox(height: 8),
                  FilledButton.tonal(
                    onPressed: _openProfile,
                    child: const Text('Filled Tonal - Profile'),
                  ),
                ],
              ),
            ),
            SectionCard(
              title: 'Secondary actions',
              icon: Icons.tune,
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  OutlinedButton(
                    onPressed: _openSettings,
                    child: const Text('Outlined - Settings'),
                  ),
                  TextButton(
                    onPressed: () => showDialog<void>(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Help'),
                        content: const Text(
                            'This gallery demonstrates Material buttons and navigation.'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('Got it'),
                          ),
                        ],
                      ),
                    ),
                    child: const Text('Text - Help'),
                  ),
                ],
              ),
            ),
            SectionCard(
              title: 'Buttons with icons',
              icon: Icons.emoji_emotions_outlined,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  FilledButton.icon(
                    onPressed: () => _snack('Shared with friends'),
                    icon: const Icon(Icons.share),
                    label: const Text('Share event'),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        tooltip: 'Favourite',
                        isSelected: _favourite,
                        icon: const Icon(Icons.favorite_border),
                        selectedIcon:
                        const Icon(Icons.favorite, color: Colors.red),
                        onPressed: () =>
                            setState(() => _favourite = !_favourite),
                      ),
                      IconButton.filled(
                        tooltip: 'Notifications',
                        icon: const Icon(Icons.notifications),
                        onPressed: () => _snack('No new notifications'),
                      ),
                      IconButton.outlined(
                        tooltip: 'Settings',
                        icon: const Icon(Icons.settings),
                        onPressed: _openSettings,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SectionCard(
              title: 'Custom styled',
              icon: Icons.brush,
              child: Column(
                children: [
                  // Custom gradient pill button
                  Material(
                    borderRadius: BorderRadius.circular(30),
                    clipBehavior: Clip.antiAlias,
                    child: Ink(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [AppColors.teal, Color(0xFF4F9A8F)],
                        ),
                      ),
                      child: InkWell(
                        onTap: _openDetails,
                        child: const SizedBox(
                          height: 52,
                          width: double.infinity,
                          child: Center(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.rocket_launch,
                                    color: Colors.white, size: 20),
                                SizedBox(width: 8),
                                Text(
                                  'Explore events',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SectionCard(
              title: 'Account',
              icon: Icons.manage_accounts,
              child: SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: _logout,
                  icon: const Icon(Icons.logout),
                  label: const Text('Logout'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.danger,
                    side: const BorderSide(color: AppColors.danger),
                    minimumSize: const Size.fromHeight(48),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
