import 'package:flutter/material.dart';

import 'pages/add_page.dart';
import 'pages/button_gallery_page.dart';
import 'pages/details_page.dart';
import 'pages/login_page.dart';
import 'pages/profile_page.dart';
import 'pages/register_page.dart';
import 'pages/settings_page.dart';
import 'theme.dart';

void main() => runApp(const ZuppiApp());

class ZuppiApp extends StatelessWidget {
  const ZuppiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zuppi - Buttons & Navigation',
      debugShowCheckedModeBanner: false,
      theme: buildTheme(),
      // Named routes
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/buttons': (context) => const ButtonGallery(),
        '/profile': (context) => const ProfileScreen(),
        '/details': (context) => const DetailsScreen(),
        '/settings': (context) => const SettingsScreen(),
        '/add': (context) => const AddScreen(),
      },
    );
  }
}
