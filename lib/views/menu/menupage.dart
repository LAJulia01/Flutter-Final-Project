import 'package:flutter/material.dart';
import 'package:nannycare/auth/views/loginpage.dart';
import 'package:nannycare/views/help_andsupport/helpandsupp_page.dart';
import 'package:nannycare/views/menu/accounts/parent/accountparent.dart';
import 'package:nannycare/views/menu/requirements/requirements1.dart';
import 'package:nannycare/views/menu/settings/settingspage.dart';
import 'package:nannycare/views/menu/terms/privacy/PrivacyPolicy.dart';
import 'package:nannycare/views/menu/terms/privacy/TermsAndCondtionsPage.dart';
import 'package:nannycare/views/menu/widgets/navigation_button_widget.dart';
import 'package:nannycare/views/menu/widgets/profile_widget.dart';
import 'package:nannycare/views/transaction/transaction_history_page.dart';
import 'package:nannycare/views/widgets/bottom_navigation_bar.dart';

import '../../utils/styles/styles1.dart';

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
    double safeHeight = (paddingHeight - 150).clamp(0.0, double.infinity);

    return Scaffold(
      bottomNavigationBar: const CustomBottomNavigationBar(selectedIndex: 4),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: 150,
                            color: Colors.white,
                          ),
                          ClipPath(
                            clipper: LowerRightRoundedClipper(),
                            child: Container(
                              height: 150,
                              color: const Color.fromARGB(255, 249, 235, 240),
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height - 150,
                            color: const Color.fromARGB(255, 249, 235, 240),
                          ),
                          ClipPath(
                            clipper: UpperLeftRoundedClipper(),
                            child: Container(
                              height: safeHeight > 0 ? safeHeight : 900,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    key: _paddingKey,
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 40),
                        myProfile(),
                        const SizedBox(height: 24),
                        navigationButton(
                          icon: Icons.edit_rounded,
                          label: 'Edit Profile',
                          page: Requirements1(),
                          context: context,
                        ),
                        navigationButton(
                          icon: Icons.person_rounded,
                          label: 'Account',
                          page: Accountparent(),
                          context: context,
                        ),
                        navigationButton(
                          icon: Icons.credit_card,
                          label: 'Transaction',
                          page: TransactionHistoryPage(),
                          context: context,
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
                          icon: Icons.playlist_add_check_rounded,
                          label: 'Terms & Conditions',
                          page: TermsAndConditionsPage(),
                          context: context,
                        ),
                        navigationButton(
                          icon: Icons.privacy_tip_rounded,
                          label: 'Privacy Policy',
                          page: PrivacyPolicy(),
                          context: context,
                        ),
                        navigationButton(
                          icon: Icons.help_outline_rounded,
                          label: 'Help & Support',
                          page: HelpandSupportPage(),
                          context: context,
                        ),
                        const SizedBox(height: 40),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()),
                            );
                          },
                          child: Center(
                            
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
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

class LowerRightRoundedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height - 20);
    path.quadraticBezierTo(
        size.width, size.height, size.width - 20, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

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
