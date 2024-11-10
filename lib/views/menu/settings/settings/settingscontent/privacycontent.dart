import 'package:final_project/views/menu/settings/settings/settingscontent/privacycontent/blockedaccount.dart';
import 'package:final_project/views/menu/settings/settings/settingscontent/privacycontent/changepasswordcontent.dart';
import 'package:final_project/utils/styles/style/textstyle.dart';
import 'package:flutter/material.dart';

class PrivacyContent extends StatefulWidget {
  const PrivacyContent({super.key});

  @override
  _PrivacyContentState createState() => _PrivacyContentState();
}

class _PrivacyContentState extends State<PrivacyContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 16,
        ),
        Container(
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Colors.pink[50],
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment
                    .spaceBetween, // This spreads icons out nicely
                children: [
                  // Leading Icon
                  IconButton(
                    icon: const Icon(
                      Icons.password_sharp,
                      color: Colors.pink,
                    ), // Change this to any icon
                    onPressed: () {
                      // Add logic for the leading icon, if necessary
                    },
                  ),

                  // Text
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        "Change Paswword",
                        style: AppTextStyles.body,
                      ),
                    ),
                  ),

                  // Trailing Icon for Navigation
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_forward_ios,
                      color: Color(0xFF999999),
                    ), // Trailing navigation icon
                    onPressed: () {
                      // Navigation logic when clicking the trailing icon
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const ChangePasswordContent()),
                      );
                    },
                  ),
                ],
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment
                    .spaceBetween, // This spreads icons out nicely
                children: [
                  // Leading Icon
                  IconButton(
                    icon: const Icon(
                      Icons.block,
                      color: Colors.pink,
                    ), // Change this to any icon
                    onPressed: () {
                      // Add logic for the leading icon, if necessary
                    },
                  ),

                  // Text
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        "Blocked Users",
                        style: AppTextStyles.body,
                      ),
                    ),
                  ),

                  // Trailing Icon for Navigation
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_forward_ios,
                      color: Color(0xFF999999),
                    ), // Trailing navigation icon
                    onPressed: () {
                      // Navigation logic when clicking the trailing icon
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const BlockedAccountContent()),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
