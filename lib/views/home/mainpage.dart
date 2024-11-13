import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nannycare/utils/customButton.dart';
import 'package:nannycare/views/home/search/searchpage.dart';
import 'package:nannycare/views/home/widgets/circle_button_widget.dart';
import 'package:nannycare/views/message/chat.dart';
import 'package:nannycare/views/widgets/bottom_navigation_bar.dart';
import '../../utils/styles/styles1.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late GoogleMapController _mapController;
  final LatLng _initialPosition = const LatLng(7.30870680, 125.68411780);
  final Set<Marker> _markers = {};
  final double _scaleFactor = 1.0;
  final Offset _offset = Offset.zero;
  bool _areButtonsVisible = true; // Track button visibility

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
    return Scaffold(
      bottomNavigationBar: const CustomBottomNavigationBar(selectedIndex: 2),
      body: Stack(
        children: [
          // Google Map Section
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

          // Floating Action Button for Refresh Location
          Positioned(
            bottom: 120,
            right: 20,
            child: FloatingActionButton(
              onPressed: _determinePosition,
              tooltip: 'Refresh Location',
              child: const Icon(Icons.location_searching),
            ),
          ),

          // Next Button
          Positioned(
            bottom: 50,
            right: 55,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: 100,
                height: 56,
                child: customBtn('Next', () {}),
              ),
            ),
          ),

          // SearchBar Section
          const Positioned(
            top: 30,
            left: 0,
            right: 0,
            child: SearchPage(),
          ),

          // DraggableScrollableSheet
          DraggableScrollableSheet(
            initialChildSize: 0.2,
            minChildSize: 0.2,
            maxChildSize: 1.0, // Full screen height when dragged up
            builder: (context, scrollController) {
              scrollController.addListener(() {
                setState(() {
                  _areButtonsVisible = scrollController.position.pixels <
                      scrollController.position.maxScrollExtent;
                });
              });

              return Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, -5),
                    ),
                  ],
                ),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    ListView(
                      controller: scrollController,
                      padding: const EdgeInsets.all(16),
                      children: [
                        Center(
                          child: Column(
                            children: [
                              Container(
                                width: 40,
                                height: 5,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFF5A7A5),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                'View 143 Results',
                                style: AppTextStyles.header,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'Add your custom content here...',
                          style: AppTextStyles.bodyText,
                        ),
                      ],
                    ),

                    // Circular Buttons Section (Messages and Location)
                    Positioned(
                      top: 16,
                      right: 20,
                      child: Visibility(
                        visible: _areButtonsVisible,
                        child: Column(
                          children: [
                            // Message Button
                            circleButton(
                              context: context,
                              icon: Icons.message_rounded,
                              targetPage: const Chat(),
                            ),
                            const SizedBox(height: 10),

                            // Location Button
                            circleButton(
                              context: context,
                              icon: Icons.my_location_rounded,
                              targetPage: const MainPage(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
