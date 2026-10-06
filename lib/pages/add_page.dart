import 'package:flutter/material.dart';

import '../widgets.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final _title = TextEditingController();

  @override
  void dispose() {
    _title.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Event')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                controller: _title,
                decoration: const InputDecoration(
                  labelText: 'Event title',
                  prefixIcon: Icon(Icons.title),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: FilledButton.icon(
                  // pop with a result, received by the Button Gallery
                  onPressed: () => Navigator.pop(
                    context,
                    _title.text.trim().isEmpty ? 'Untitled event' : _title.text.trim(),
                  ),
                  icon: const Icon(Icons.check),
                  label: const Text('Save'),
                  style: FilledButton.styleFrom(
                      minimumSize: const Size.fromHeight(48)),
                ),
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
