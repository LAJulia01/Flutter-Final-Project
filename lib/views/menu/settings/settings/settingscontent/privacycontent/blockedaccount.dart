
import 'package:final_project/utils/styles/style/textstyle.dart';
import 'package:final_project/views/menu/widgets/settings_appbar_widget.dart';
import 'package:flutter/material.dart';

class BlockedAccountContent extends StatefulWidget {
  const BlockedAccountContent({super.key});

  @override
  State<BlockedAccountContent> createState() => _BlockedAccountContentState();
}

class _BlockedAccountContentState extends State<BlockedAccountContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Scaffold added here
      appBar: settingsAppBar(title: 'Blocked Account', context: context),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 20), // Add padding to the entire column
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              //btn
              const Icon(
                Icons.face,
                color: Color(0xFFF5A7A5),
                size: 80, // Set the icon size
              ),

              const SizedBox(
                height: 15,
              ),

              // Expanded widget for the text
              Text(
                "You have no blocked users.",
                style: AppTextStyles.bodyText,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
