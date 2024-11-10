import 'package:final_project/views/menu/settings/settingspage.dart';
import 'package:final_project/views/menu/widgets/navigation_button_widget.dart';
import 'package:final_project/views/menu/widgets/profile_widget.dart';
import 'package:flutter/material.dart';
import 'package:final_project/utils/styles/styles1.dart';
import 'package:final_project/views/widgets/bottom_navigation_bar.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  final GlobalKey _paddingKey = GlobalKey();
  double paddingHeight = 150.0; // Default to a safe value

  @override
  void initState() {
    super.initState();
    // Post-frame callback to get the widget height after rendering
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _getPaddingHeight();
    });
  }

  void _getPaddingHeight() {
    final renderBox =
        _paddingKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox != null) {
      setState(() {
        paddingHeight = renderBox.size.height;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Ensure the calculated height is valid
    double safeHeight = (paddingHeight - 150).clamp(0.0, double.infinity);

    return Scaffold(
      // Bottom Navigation Bar at the bottom
      bottomNavigationBar: const CustomBottomNavigationBar(selectedIndex: 4),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  // Background Section
                  Column(
                    children: [
                      // Upper Part (Pink and White Layers)
                      Stack(
                        children: [
                          Container(
                            height: 150,
                            color: Colors.white, // Pink back layer
                          ),
                          ClipPath(
                            clipper: LowerRightRoundedClipper(),
                            child: Container(
                              height: 150,
                              color: const Color.fromARGB(
                                  255, 249, 235, 240), // White front layer
                            ),
                          ),
                        ],
                      ),

                      // Lower Part (White and Blue Layers)
                      Stack(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height - 150,
                            color: const Color.fromARGB(
                                255, 249, 235, 240), // White back layer
                          ),
                          ClipPath(
                            clipper: UpperLeftRoundedClipper(),
                            child: Container(
                              height: safeHeight > 0
                                  ? safeHeight
                                  : 900, // Use the measured safeHeight or a default
                              color: Colors
                                  .white, // Blue for now (can change to pink)
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  // Content Section with Buttons and Profile Info
                  Padding(
                    key: _paddingKey, // Key used to measure height
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 40),
                        myProfile(), // Profile widget
                        const SizedBox(height: 24),
                        navigationButton(
                          icon: Icons.edit_rounded,
                          label: 'Edit Profile',
                          page: null,
                          context: null,
                        ),
                        navigationButton(
                          icon: Icons.person_rounded,
                          label: 'Account',
                          page: null,
                          context: null,
                        ),
                        navigationButton(
                          icon: Icons.settings_rounded,
                          label: 'Settings',
                          page: const SettingsPage(),
                          context: context,
                        ),
                        const SizedBox(height: 24),
                        Text(
                          'Support',
                          style: AppTextStyles.subHeader.copyWith(
                            color: const Color(0xFFF5A7A5),
                          ),
                        ),
                        navigationButton(
                          icon: Icons.bookmark_rounded,
                          label: 'Tips & Articles',
                          page: null,
                          context: null,
                        ),
                        navigationButton(
                          icon: Icons.price_change_rounded,
                          label: 'Pricing',
                          page: null,
                          context: null,
                        ),
                        navigationButton(
                          icon: Icons.security_rounded,
                          label: 'Trust & Safety',
                          page: null,
                          context: null,
                        ),
                        navigationButton(
                          icon: Icons.playlist_add_check_rounded,
                          label: 'Terms & Conditions',
                          page: null,
                          context: null,
                        ),
                        navigationButton(
                          icon: Icons.privacy_tip_rounded,
                          label: 'Privacy Policy',
                          page: null,
                          context: null,
                        ),
                        navigationButton(
                          icon: Icons.help_outline_rounded,
                          label: 'Help & Support',
                          page: null,
                          context: null,
                        ),

                        const SizedBox(height: 40),
                        const Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.logout_rounded,
                                size: 24,
                                color: Color(0xFFF5A7A5),
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Logout',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFF5A7A5),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 40),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Custom Clipper for Lower Right Rounded Edge
class LowerRightRoundedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height - 20);
    path.quadraticBezierTo(
      size.width,
      size.height,
      size.width - 20,
      size.height,
    );
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

// Custom Clipper for Upper Left Rounded Edge
class UpperLeftRoundedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(20, 0);
    path.quadraticBezierTo(0, 0, 0, 20);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
