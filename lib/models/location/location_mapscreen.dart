import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';

class GoogleMapsPage extends StatefulWidget {
  const GoogleMapsPage({super.key});

  @override
  State<GoogleMapsPage> createState() => _GoogleMapsPageState();
}

class _GoogleMapsPageState extends State<GoogleMapsPage> {
  LatLng selectedLocation = const LatLng(7.30870680, 125.68411780); // Default location Panabo
  String selectedAddress = "Fetching address...";

  void _updateAddress(LatLng location) async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(location.latitude, location.longitude);
      Placemark place = placemarks[0];
      setState(() {
        selectedAddress =
            "${place.street}, ${place.locality}, ${place.administrativeArea}, ${place.country}";
      });
    } catch (e) {
      setState(() {
        selectedAddress = "Unable to fetch address.";
      }
      );
      if (mounted) {
  setState(() {
    // Your state update logic here
  });
}
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Location'),
      ),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: selectedLocation,
              zoom: 15,
            ),
            onTap: (LatLng location) {
              setState(() {
                selectedLocation = location;
                _updateAddress(location);
              });
            },
            markers: {
              Marker(
                markerId: const MarkerId("selectedLocation"),
                position: selectedLocation,
              ),
            },
          ),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context, {
                  'latitude': selectedLocation.latitude,
                  'longitude': selectedLocation.longitude,
                  'address': selectedAddress,
                });
              },
              child: const Text('Confirm Location'),
            ),
          ),
        ],
      ),
    );
  }
}
