import 'package:flutter/material.dart';
import 'package:nannycare/views/menu/widgets/settings_appbar_widget.dart';

class ChangePasswordContent extends StatefulWidget {
  const ChangePasswordContent({super.key});

  @override
  State<ChangePasswordContent> createState() => _ChangePasswordContentState();
}

class _ChangePasswordContentState extends State<ChangePasswordContent> {
  // Variables to hold password input
  final TextEditingController _currentPasswordController =
      TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmNewPasswordController =
      TextEditingController();

  // Variables to toggle password visibility
  bool _isCurrentPasswordObscured = true;
  bool _isNewPasswordObscured = true;
  bool _isConfirmNewPasswordObscured = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Scaffold added here
        appBar: settingsAppBar(
        title: 'Settings',
        context: context, 
        style: TextStyle(), 
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            // Current Password Field
            TextField(
              controller: _currentPasswordController,
              obscureText: _isCurrentPasswordObscured, // Obscures password
              decoration: InputDecoration(
                labelText: 'Current Password',
                suffixIcon: IconButton(
                  icon: Icon(
                    _isCurrentPasswordObscured
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _isCurrentPasswordObscured = !_isCurrentPasswordObscured;
                    });
                  },
                ),
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),

            // New Password Field
            TextField(
              controller: _newPasswordController,
              obscureText: _isNewPasswordObscured, // Obscures password
              decoration: InputDecoration(
                labelText: 'New Password',
                suffixIcon: IconButton(
                  icon: Icon(
                    _isNewPasswordObscured
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _isNewPasswordObscured = !_isNewPasswordObscured;
                    });
                  },
                ),
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),

            // Confirm New Password Field
            TextField(
              controller: _confirmNewPasswordController,
              obscureText: _isConfirmNewPasswordObscured, // Obscures password
              decoration: InputDecoration(
                labelText: 'Confirm New Password',
                suffixIcon: IconButton(
                  icon: Icon(
                    _isConfirmNewPasswordObscured
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _isConfirmNewPasswordObscured =
                          !_isConfirmNewPasswordObscured;
                    });
                  },
                ),
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            //btn

            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF5A7A5),
                  padding: const EdgeInsets.all(20), // Button padding
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Save',
                  style: TextStyle(
                    color: Colors.white,
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
