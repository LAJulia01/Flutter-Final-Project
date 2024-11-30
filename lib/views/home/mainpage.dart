import 'package:flutter/material.dart';
import 'package:nannycare/utils/customButton.dart';
import 'package:nannycare/views/Profile/userProfile.dart';
import 'package:nannycare/views/home/search/searchpage.dart';
import 'package:nannycare/views/home/widgets/circle_button_widget.dart';
import 'package:nannycare/views/message/chat.dart';
import 'package:nannycare/views/message/chathome.dart';
import 'package:nannycare/views/widgets/bottom_navigation_bar.dart';
import 'package:custom_info_window/custom_info_window.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../utils/styles/styles1.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Set<Marker> markers = {};
  Set<Circle> circles = {};
  GoogleMapController? mapController;
  LatLng location = const LatLng(7.313675416878131, 125.67034083922026);
  final CustomInfoWindowController _customInfoWindowController =
      CustomInfoWindowController();
  String locationMsg = 'Current Location of User';
  late String lat;
  late String long;
  double _radius = 500;
  bool _areButtonsVisible = true; // default radius for geofence

  final List<LatLng> markerPositions = [
    LatLng(7.3099, 125.6708),
    LatLng(7.3141, 125.6653),
    LatLng(7.3195, 125.6702),
    LatLng(7.3165, 125.6748),
    LatLng(7.3153, 125.6692)
  ];

  BitmapDescriptor? currentLocationIcon;

  Future<void> _loadCustomIcons() async {
    currentLocationIcon = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(), "assets/mylocation.bmp");
  }

  Future<Position> _getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled');
    }
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permission');
    }
    return await Geolocator.getCurrentPosition();
  }

  void _addGeofenceCircle(LatLng position) {
    setState(() {
      circles = {
        Circle(
          circleId: CircleId("geofence"),
          center: position,
          radius: _radius,
          fillColor: Colors.blue.withOpacity(0.3),
          strokeColor: Colors.blue,
          strokeWidth: 2,
        )
      };
    });
    _filterMarkers();
  }

  // Filter markers based on distance from the center
  void _filterMarkers() {
    setState(() {
      markers.clear();
      for (var position in markerPositions) {
        final distance = Geolocator.distanceBetween(
          location.latitude,
          location.longitude,
          position.latitude,
          position.longitude,
        );

        if (distance <= _radius) {
          markers.add(
            Marker(
              markerId: MarkerId(position.toString()),
              position: position,
              icon: BitmapDescriptor.defaultMarker,
              infoWindow: InfoWindow(title: " ${position.toString()}"),
              onTap: () {
                _showProfileDialog();
              },
            ),
          );
        }
      }
    });
  }

  addMyMarker(LatLng myLoc) {
    setState(() {
      markers.add(
        Marker(
          icon: currentLocationIcon ?? BitmapDescriptor.defaultMarker,
          markerId: const MarkerId('current_location'),
          position: myLoc,
          draggable: false,
          visible: true,
          infoWindow: const InfoWindow(title: "Your Current Location"),
        ),
      );
      _addGeofenceCircle(myLoc); // Add geofence circle at current location
    });

    _filterMarkers(); // Filter existing markers based on the radius
  }

  void _liveLocation() {
    LocationSettings locationSettings = const LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 100,
    );
    Geolocator.getPositionStream(locationSettings: locationSettings)
        .listen((Position position) {
      lat = position.latitude.toString();
      long = position.longitude.toString();
      setState(() {
        location = LatLng(position.latitude, position.longitude);
        locationMsg = 'Lat: $lat , Long: $long';
        _customInfoWindowController.googleMapController?.animateCamera(
            CameraUpdate.newCameraPosition(
                CameraPosition(target: location, zoom: 15.0)));

        addMyMarker(location);
      });
    });
  }

  void onMapCreated(controller) {
    setState(() {
      mapController = controller;
    });
  }

  @override
  void initState() {
    super.initState();

    _loadCustomIcons(); // Load custom icons
    _getCurrentLocation().then((value) {
      lat = '${value.latitude}';
      long = '${value.longitude}';
      setState(() {
        location = LatLng(value.latitude, value.longitude);
        locationMsg = 'Lat: $lat , Long: $long';
        _addGeofenceCircle(location); // Show the circle immediately
      });
      _liveLocation();
    });
  }

  void _showProfileDialog() {
    showDialog(
      context: context,
      builder: (context) => const UserProfile(),
    );
  }

  Widget loadMap() => Column(
        children: [
          Stack(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height - 180.0,
                width: double.infinity,
                child: GoogleMap(
                  myLocationButtonEnabled: true,
                  myLocationEnabled: true,
                  scrollGesturesEnabled: true,
                  zoomGesturesEnabled: true,
                  mapType: MapType.normal,
                  markers: markers,
                  circles: circles,
                  initialCameraPosition: CameraPosition(
                    target: location,
                    zoom: 15.0,
                  ),
                  onTap: (position) {
                    _customInfoWindowController.hideInfoWindow!();
                  },
                  onCameraMove: (position) {
                    _customInfoWindowController.onCameraMove!();
                  },
                  onMapCreated: (GoogleMapController controller) async {
                    setState(() {
                      _customInfoWindowController.googleMapController =
                          controller;
                    });
                  },
                ),
              ),
              CustomInfoWindow(
                controller: _customInfoWindowController,
                height: 150,
                width: 250,
                offset: 50,
              ),
            ],
          ),
          // Slider for adjusting radius
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text("Adjust Geofence Radius: ${_radius.toInt()} meters"),
                Slider(
                  min: 100,
                  max: 2000,
                  value: _radius,
                  divisions: 19,
                  onChanged: (value) {
                    setState(() {
                      _radius = value;
                      _addGeofenceCircle(location); // Update circle radius
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomBottomNavigationBar(selectedIndex: 2),
      body: Stack(
        children: [
          // Google Map Section
          loadMap(),

          // SearchBar Section
          const Positioned(
            top: 30,
            left: 0,
            right: 0,
            child: SearchPage(),
          ),

          // Adjust Geofence Radius Section (Always Visible)
          Positioned(
            bottom: 150, // Positioned above the circular buttons
            left: 10,
            right: 10,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    "Adjust to show more Babysitters: ${_radius.toInt()} meters",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Slider(
                    min: 100,
                    max: 2000,
                    value: _radius,
                    divisions: 19,
                    onChanged: (value) {
                      setState(() {
                        _radius = value;
                        _addGeofenceCircle(location); // Update circle radius
                      });
                    },
                  ),
                ],
              ),
            ),
          ),

          // DraggableScrollableSheet
          DraggableScrollableSheet(
            initialChildSize: 0.2,
            minChildSize: 0.2,
            maxChildSize: 1.0,
            builder: (context, scrollController) {
              scrollController.addListener(() {
                setState(() {
                  // Show buttons when scrolled up; hide when fully expanded
                  _areButtonsVisible = scrollController.position.pixels < 50;
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
                child: ListView(
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
                    // Additional content here...
                    Container(
                      margin: const EdgeInsets.all(10),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const UserProfile()),
                          );
                        },
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      width: 2,
                                      color: const Color(0xFFF5A7A5),
                                    ),
                                  ),
                                  child: const CircleAvatar(
                                    backgroundImage:
                                        AssetImage('assets/marga_image1.jpg'),
                                  ),
                                ),
                                const SizedBox(width: 15),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        'Melissa Guillar',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'poppins',
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'Location:',
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontFamily: 'poppins',
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          SizedBox(width: 15),
                                          Text('Panabo City'),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'No. of Transaction:',
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontFamily: 'poppins',
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          SizedBox(width: 15),
                                          Text('12'),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
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

          // Circular Buttons Section (Fixed at the Bottom)
          Positioned(
            bottom: 30, // Position buttons at the bottom of the screen
            right: 20,
            child: Visibility(
              visible: _areButtonsVisible,
              child: Column(
                children: [
                  // Message Button
                  circleButton(
                    context: context,
                    icon: Icons.message_rounded,
                    targetPage: const Chathome(),
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
  }
}
