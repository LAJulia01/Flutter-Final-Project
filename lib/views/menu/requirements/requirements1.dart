import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:nannycare/auth/widgets/dialogbutton.dart';
import 'package:nannycare/utils/customButton.dart';
import 'package:nannycare/models/location/location_mapscreen.dart';
import 'package:nannycare/views/menu/requirements/requirements2.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

class Requirements1 extends StatefulWidget {
  const Requirements1({super.key});

  @override
  State<Requirements1> createState() => _Requirements1State();
}

class _Requirements1State extends State<Requirements1> {
  String currentAddress = "Fetching current address...";
  double? latitude;
  double? longitude;

  @override
  void initState() {
    super.initState();
    _fetchCurrentAddress();
  }

  Future<void> _fetchCurrentAddress() async {
    try {
      Position position = await Geolocator.getCurrentPosition();
      latitude = position.latitude;
      longitude = position.longitude;

      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude!, longitude!);
      Placemark place = placemarks[0];

      setState(() {
        currentAddress =
            "${place.street}, ${place.locality}, ${place.administrativeArea}, ${place.country}";
      });
    } catch (e) {
      setState(() {
        currentAddress = "Unable to fetch address: $e";
      });
    }
  }

  Future<void> _navigateToMap() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const GoogleMapsPage()),
    );

    if (result != null) {
      setState(() {
        latitude = result['latitude'];
        longitude = result['longitude'];
        currentAddress = result['address'];
      });
    }
  }

  Future<File> saveFilePermanently(PlatformFile file) async {
    final appStorage = await getApplicationDocumentsDirectory();
    final newFile = File('${appStorage.path}/${file.name}');
    return File(file.path!).copy(newFile.path);
  }

  void openFile(PlatformFile file) {
    OpenFile.open(file.path!);
  }

  Future<void> handleFileSelection() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.custom,
      allowedExtensions: ['pdf', 'mp4'],
    );

    if (result != null) {
      for (var file in result.files) {
        // Save file permanently (example)
        await saveFilePermanently(file);

        // Open file (example)
        openFile(file);

        // Log file details
        debugPrint('Name: ${file.name}');
        debugPrint('Size: ${file.size}');
        debugPrint('Extension: ${file.extension}');
        debugPrint('Path: ${file.path}');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          'Requirements',
          style: TextStyle(color: Color.fromARGB(255, 255, 150, 229)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: ListView(
          children: [
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
            TextField(
              decoration: InputDecoration(
                labelText: 'Full name:',
                border: OutlineInputBorder(),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              ),
            ),
            const SizedBox(height: 5),
            TextField(
              decoration: InputDecoration(
                labelText: 'Age:',
                border: OutlineInputBorder(),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              ),
            ),
            const SizedBox(height: 5),
            TextField(
              decoration: InputDecoration(
                labelText: 'Gender:',
                border: OutlineInputBorder(),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              ),
            ),
            const SizedBox(height: 5),
            TextField(
              decoration: InputDecoration(
                labelText: 'Address:',
                hintText: currentAddress,
                border: const OutlineInputBorder(),
              ),
              readOnly: true,
              onTap: _navigateToMap,
            ),
            const SizedBox(height: 10),
            // CustomButton(
            //   text: 'Next',
            //   onPressed: () {
            //     Navigator.of(context).push(
            //       MaterialPageRoute(builder: (context) => Requirements2()),
            //     );
            //   },
            // ),
            const SizedBox(height: 20),
            const Text(
              'Work Experience',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
            const SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 255, 200, 210),
                  ),
                ),
                border: const OutlineInputBorder(),
                hintText: 'Share your work experience...',
              ),
              maxLines: 7,
            ),
            // const SizedBox(height: 20),
            // const Text(
            //   'Certifications',
            //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            // ),
            // GestureDetector(
            //   onTap: handleFileSelection,
            //   child: Container(
            //     alignment: Alignment.center,
            //     width: screenWidth,
            //     height: 120,
            //     decoration: BoxDecoration(
            //       border: Border.all(
            //         width: 1,
            //         color: Color.fromARGB(255, 255, 200, 210),
            //       ),
            //       borderRadius: BorderRadius.circular(10),
            //     ),
            //     child: const Column(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: [
            //         Text(
            //           'Attach file',
            //           style: TextStyle(
            //             fontSize: 20,
            //             fontWeight: FontWeight.bold,
            //           ),
            //         ),
            //         Icon(
            //           Icons.upload_file,
            //           size: 30,
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            const SizedBox(height: 20),
            Row(
              children: [
                Text(
                  'Have experience caring for children',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'with special needs.',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 10),
            _buildOption('Yes'),
            const SizedBox(height: 10),
            _buildOption('No'),
            const SizedBox(height: 10),
            Row(
              children: [
                Text(
                  'Rate',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 5),
            TextField(
              decoration: InputDecoration(
                labelText: 'Amount:',
                border: OutlineInputBorder(),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Hours:',
                border: OutlineInputBorder(),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              ),
            ),
            const SizedBox(height: 300),
            const AlertDialog1(),
          ],
        ),
      ),
    );
  }

  Widget _buildOption(String label) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Color.fromARGB(255, 255, 200, 210),
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Center(
        child: Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
