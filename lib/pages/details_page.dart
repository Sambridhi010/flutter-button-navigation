import 'package:flutter/material.dart';

import '../theme.dart';
import '../widgets.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Details')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 160,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.teal,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Icon(Icons.event, color: Colors.white, size: 72),
              ),
              const SizedBox(height: 16),
              Text('Sunset Music Night',
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(fontWeight: FontWeight.w700)),
              const SizedBox(height: 12),
              const ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Icon(Icons.calendar_today, color: AppColors.teal),
                title: Text('Saturday, 7:00 PM'),
              ),
              const ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Icon(Icons.location_on, color: AppColors.teal),
                title: Text('Lakeside Park, Pokhara'),
              ),
              const Text(
                'An open-air evening of live music, food stalls and '
                    'community activities. Bring a friend and enjoy the sunset.',
              ),
              const Spacer(),
              const BackButtonBar(),
            ],
          ),
        ),
      ),
    );
  }
}
