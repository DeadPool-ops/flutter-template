import 'package:flutter/material.dart';

import '../../../core/constants/app_strings.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.ok), // TODO: Replace with page title
      ),
      body: const Center(
        child: Text('Home Page'),
      ),
      // TODO: Add FAB, BottomNavBar, or Drawer as needed
    );
  }
}
