import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nannycare/views/menu/menupage.dart';
import 'package:nannycare/views/menu/requirements/requirements1.dart';
import 'package:nannycare/views/menu/settings/settingspage.dart';

class Accountparent extends StatefulWidget {
  const Accountparent({super.key});

  @override
  State<Accountparent> createState() => _AccountparentState();
}

class _AccountparentState extends State<Accountparent> {
  String address = "No address added"; // Default address

  // Firebase Firestore reference
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Replace with the actual user ID
  final String userId = "unique_user_id_placeholder";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 231, 249),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Navigation Bar
            _buildTopNavigationBar(context),
            // Scrollable Content
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 20),
                    child: Column(
                      children: [
                        // Profile Picture Section
                        _buildProfilePictureSection(),
                        const SizedBox(height: 15),
                        // Details Section
                        buildSectionHeader('Details'),
                        buildInfoContainer(
                          'Add a short detail to tell people more about yourself.',
                        ),
                        const SizedBox(height: 15),
                        // Intro Section
                        buildSectionHeader('Intro'),
                        buildInfoContainerWithIcons(),
                        const SizedBox(height: 15),
                        // Featured Section
                        buildSectionHeader('Featured'),
                        buildInfoContainer(
                          'Feature your Certificates and Valid IDs here for all to see.',
                        ),
                        const SizedBox(height: 20),
                        // Edit Button
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 255, 193, 204),
                            fixedSize: const Size(250, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text(
                            "Edit your About info",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Color.fromARGB(207, 0, 0, 0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Save updated address to Firestore
  Future<void> _saveAddressToFirebase(String newAddress) async {
    try {
      await _firestore.collection('users').doc(userId).update({
        'address': newAddress,
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Address updated successfully!')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to update address: $e')),
      );
    }
  }

  /// Top Navigation Bar
  Widget _buildTopNavigationBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, top: 10, right: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(
                context,
                MaterialPageRoute(builder: (context) => const MenuPage()),
              );
            },
            icon: const Icon(Icons.arrow_back_ios_new, size: 24),
          ),
          const Text(
            'EDIT PROFILE',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
              fontSize: 18,
              color: Color(0xFFE96E97),
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsPage()),
              );
            },
            icon: const Icon(
              Icons.settings_rounded,
              size: 24,
            ),
          ),
        ],
      ),
    );
  }

  /// Profile Picture Section
  Widget _buildProfilePictureSection() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Profile Picture',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Color.fromARGB(255, 233, 110, 151),
              ),
            ),
            IconButton(
              onPressed: () async {
                // Navigate and wait for address
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Requirements1(),
                  ),
                );
                if (result != null && result is String) {
                  setState(() {
                    address = result; // Update the address locally
                  });
                  await _saveAddressToFirebase(result); // Save to Firebase
                }
              },
              icon: const Icon(
                Icons.edit_rounded,
                color: Color.fromARGB(255, 233, 110, 151),
              ),
            ),
          ],
        ),
        const CircleAvatar(
          radius: 60,
          backgroundImage: AssetImage('assets/sofia_image1.jpg'),
        ),
      ],
    );
  }

  /// Section Header Widget
  Widget buildSectionHeader(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            fontSize: 15,
            color: Color.fromARGB(255, 233, 110, 151),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.add_rounded,
            color: Color.fromARGB(255, 233, 110, 151),
          ),
        ),
      ],
    );
  }

  /// Generic Info Container
  Widget buildInfoContainer(String text) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 231, 249),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 15,
          color: Colors.grey,
        ),
      ),
    );
  }

  /// Info Container with Icons
  Widget buildInfoContainerWithIcons() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 231, 249),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          // Address Display
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Address: $address',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          buildInfoRow(Icons.person, 'Characteristics'),
          buildInfoRow(Icons.cookie, 'Skills'),
          buildInfoRow(Icons.edit_document, 'More...'),
        ],
      ),
    );
  }

  /// Row with Icon and Text
  Widget buildInfoRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Icon(icon, color: const Color.fromARGB(255, 233, 110, 151)),
          const SizedBox(width: 10),
          Text(
            text,
            style: const TextStyle(
              fontSize: 15,
              fontFamily: 'Poppins',
              color: Color.fromARGB(255, 233, 110, 151),
            ),
          ),
        ],
      ),
    );
  }
}
