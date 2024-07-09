import 'package:flutter/material.dart';
import 'package:landlord/utils/theme/app_colors.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: const Column(
        children: [],
      ),
    );
  }
}
