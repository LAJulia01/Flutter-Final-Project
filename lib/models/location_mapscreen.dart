import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:module2_4_lab_exercise/utils/customButton.dart';
import 'package:module2_4_lab_exercise/views/support_screen.dart';

class GoogleMapsPage extends StatefulWidget {
  const GoogleMapsPage({super.key});

  @override
  GoogleMapsPageState createState() => GoogleMapsPageState();
}

class GoogleMapsPageState extends State<GoogleMapsPage> {
  late GoogleMapController _mapController;
  LatLng _initialPosition = const LatLng(7.30870680, 125.68411780); // Default location
  Position? _currentPosition;
  final Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    _determinePosition();
  }

  /// Determines the user's current position and updates the map location.
  Future<void> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      _showSnackBar('Location services are disabled.');
      return;
    }

    // Request location permissions
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        _showSnackBar('Location permissions are denied.');
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      _showSnackBar('Location permissions are permanently denied.');
      return;
    }

    // Get the current location and update the map position
    final currentPosition = await Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
      ),
    );

    if (mounted) {
      setState(() {
        _currentPosition = currentPosition;
        _initialPosition = LatLng(currentPosition.latitude, currentPosition.longitude);
        _updateMarker();
        _mapController.animateCamera(
          CameraUpdate.newLatLng(_initialPosition),
        );
      });
    }
  }

  /// Shows a snack bar with the specified message.
  void _showSnackBar(String message) {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );
    }
  }

  /// Updates the marker to the current position.
  void _updateMarker() {
    final marker = Marker(
      markerId: const MarkerId('currentLocation'),
      position: _initialPosition,
      infoWindow: const InfoWindow(title: 'Your Location'),
    );

    setState(() {
      _markers
        ..clear() // Clear existing markers to keep only the current location
        ..add(marker);
    });
  }

  /// Callback for when the Google Map is created.
  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Maps Location'),
      ),
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _initialPosition,
              zoom: 14.0,
            ),
            markers: _markers,
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
          ),
          Positioned(
            bottom: 50,
            right: 55,
            child: FloatingActionButton(
              onPressed: _updateMarker,
              tooltip: 'Add Marker',
              child: const Icon(Icons.add_location),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: customBtn('Next', () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const Support(),
                  ),
                );
              }
              ),
            ),
          ),
        ],
      ),
    );
  }
}
