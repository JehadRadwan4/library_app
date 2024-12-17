import 'package:final_project/authservices.dart';
import 'package:final_project/registerorlogin.dart';
import 'package:flutter/material.dart';

class ProfileSettings extends StatefulWidget {
  const ProfileSettings({super.key});

  @override
  State<ProfileSettings> createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {
  void logout(BuildContext context) async {
    final authService = auth_services();
    try {
      await authService.signout(); // Sign out the user
      // Navigate to the login screen and remove all previous routes
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => registrorlogin()), // Replace with your LoginScreen widget
        (route) => false, // Removes all previous routes
      );
    } catch (e) {
      // Handle errors during logout
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Logout failed: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 80),
        child: ListTile(
          title: Text("L O G O U T"),
          leading: Icon(Icons.logout),
          onTap: () {
            logout(context); // Call the logout function with context
          },
        ),
      ),
    );
  }
}
