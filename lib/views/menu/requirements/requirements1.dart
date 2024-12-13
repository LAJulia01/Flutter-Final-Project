import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:nannycare/models/location/location_mapscreen.dart';
import 'package:nannycare/auth/views/model/user.dart'; // Assuming UserData class is here

class Requirements1 extends StatefulWidget {
  const Requirements1({super.key});

  @override
  State<Requirements1> createState() => _Requirements1State();
}

class _Requirements1State extends State<Requirements1> {
  String currentAddress = "Fetching current address...";
  double? latitude;
  double? longitude;

  final _fullnameController = TextEditingController();
  final _ageController = TextEditingController();
  final _genderController = TextEditingController();
  final _addressController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fetchCurrentAddress();
  }

  @override
  void dispose() {
    _fullnameController.dispose();
    _ageController.dispose();
    _genderController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  Future<void> _fetchCurrentAddress() async {
    try {
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      latitude = position.latitude;
      longitude = position.longitude;

      List<Placemark> placemarks = await placemarkFromCoordinates(latitude!, longitude!);
      Placemark place = placemarks[0];

      setState(() {
        currentAddress =
            "${place.street}, ${place.locality}, ${place.administrativeArea}, ${place.country}";
        _addressController.text = currentAddress;
      });
    } catch (e) {
      setState(() {
        currentAddress = "Unable to fetch address: $e";
      });
    }
  }

  Future<void> _saveUserDataToFirebase() async {
    if (!_validateInputs()) return;

    final userData = UserData(
      fullname: _fullnameController.text,
      age: _ageController.text,
      gender: _genderController.text,
      address: _addressController.text,
      name: "", // Placeholder if required in model
      password: "", // Placeholder if required in model
      email: "", // Placeholder if required in model
      description: "",  // You can add description if needed
      hourlyRate: 0.0,  // Default hourly rate, change if needed
      numOfReviews: 0,  // Default number of reviews
      reviewersList: [],  // Default empty list
    );

    try {
      await FirebaseFirestore.instance.collection('users').add(userData.toJson());

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('User data saved successfully!')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to save data: $e')),
      );
    }
  }

  Future<void> _navigateToMap() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const GoogleMapsPage()),
    );
    if (result != null && result is Map<String, dynamic>) {
      setState(() {
        latitude = result['latitude'];
        longitude = result['longitude'];
        currentAddress = result['address'];
        _addressController.text = currentAddress;
      });
    }
  }

  bool _validateInputs() {
    if (_fullnameController.text.isEmpty ||
        _ageController.text.isEmpty ||
        _genderController.text.isEmpty ||
        _addressController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill out all fields.')),
      );
      return false;
    }
    return true;
  }

  Widget buildTextField({
    required String label,
    required TextEditingController controller,
    bool readOnly = false,
    VoidCallback? onTap,
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(labelText: label),
      readOnly: readOnly,
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Requirements'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Profile Picture Section
            const SizedBox(height: 10),
            const Center(
              child: Text(
                'Parent',
                style: TextStyle(
                  fontFamily: 'poppins',
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Image.asset('assets/imageava1.png'),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: Color.fromARGB(255, 255, 200, 210),
                ),
                borderRadius: BorderRadius.circular(30),
              ),
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: const Center(
                child: Text(
                  'About Me',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'Personal Information',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
            const SizedBox(height: 5),
            buildTextField(
              label: 'Full name:',
              controller: _fullnameController,
            ),
            const SizedBox(height: 10),
            buildTextField(
              label: 'Age:',
              controller: _ageController,
            ),
            const SizedBox(height: 10),
            buildTextField(
              label: 'Gender:',
              controller: _genderController,
            ),
            const SizedBox(height: 10),
            buildTextField(
              label: 'Address:',
              controller: _addressController,
              readOnly: true,
              onTap: _navigateToMap,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveUserDataToFirebase,
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
