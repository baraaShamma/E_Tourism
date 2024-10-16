
import 'package:e_tourism/Config/injection_container.dart';
import 'package:e_tourism/app/app_preferences.dart';
import 'package:flutter/material.dart';

class AddForAdminScreen extends StatelessWidget {
  const AddForAdminScreen({super.key});

  // AppPreferences appPreferences = instance<AppPreferences>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("admin")
        ],
      ),
    );
  }
}
