import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nannycare/utils/customButton.dart';

class GoogleMapsPage extends StatefulWidget {
  const GoogleMapsPage({super.key});

  @override
  GoogleMapsPageState createState() => GoogleMapsPageState();
}

class GoogleMapsPageState extends State<GoogleMapsPage> {
  late GoogleMapController _mapController;
  final LatLng _initialPosition = const LatLng(7.30870680, 125.68411780);
  final Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    _determinePosition();
  }

  // Determines the user's current position and updates the map location.
  Future<void> _determinePosition() async {
    if (!await _checkLocationService()) return;

    LocationPermission permission = await _checkLocationPermission();
    if (permission == LocationPermission.deniedForever) {
      _showSnackBar('Location permissions are permanently denied.');
      return;
    }

    final currentPosition = await Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(accuracy: LocationAccuracy.high),
    );

    if (mounted) {
      _moveCameraToPosition(currentPosition);
      _updateMarker(currentPosition);
    }
  }

  // Checks if the location service is enabled.
  Future<bool> _checkLocationService() async {
    if (!await Geolocator.isLocationServiceEnabled()) {
      _showSnackBar('Location services are disabled.');
      return false;
    }
    return true;
  }

  // Checks and requests location permissions.
  Future<LocationPermission> _checkLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    return permission;
  }

  // Moves the camera to the provided position.
  void _moveCameraToPosition(Position position) {
    final currentLatLng = LatLng(position.latitude, position.longitude);
    _mapController.animateCamera(CameraUpdate.newLatLng(currentLatLng));
  }

  // Shows a snack bar with the specified message.
  void _showSnackBar(String message) {
    if (mounted) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(message)));
    }
  }

  // Updates the marker to the provided position.
  void _updateMarker(Position position) {
    final currentLatLng = LatLng(position.latitude, position.longitude);

    final marker = Marker(
      markerId: const MarkerId('currentLocation'),
      position: currentLatLng,
      infoWindow: const InfoWindow(title: 'Your Location'),
    );

    setState(() {
      _markers.clear(); // Clear previous markers
      _markers.add(marker); // Add new marker
    });
  }

  // Callback for when the Google Map is created.
  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
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
            onPressed: _determinePosition,
            tooltip: 'Refresh Location',
            child: const Icon(Icons.location_searching),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              width: 100,
              height: 56,
              child: customBtn('Next', () {}),
            ),
          ),
        ),
      ],
    );
  }
}
