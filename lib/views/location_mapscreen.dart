import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:module2_4_lab_exercise/views/directions_model.dart';
import 'package:module2_4_lab_exercise/views/directions_repository.dart';
import 'package:logger/logger.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  MapScreenState createState() => MapScreenState();
}

class MapScreenState extends State<MapScreen> {
  static const _initialCameraPosition = CameraPosition(
    target: LatLng(7.30870680, 125.68411780),
    zoom: 15,
  );

  late GoogleMapController _googleMapController;
  Marker? _origin; // Origin marker
  Marker? _destination; // Destination marker
  Directions? _info; // Directions info
  final Logger _logger = Logger(); // Initialize logger

  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Location'),
        actions: [
          TextButton(
            onPressed: _origin != null ? () => _googleMapController.animateCamera(
              CameraUpdate.newCameraPosition(
                CameraPosition(
                  target: _origin!.position,
                  zoom: 14.5,
                  tilt: 50.0,
                ),
              ),
            ) : null,
            style: TextButton.styleFrom(
              foregroundColor: Colors.green, textStyle: const TextStyle(fontWeight: FontWeight.w600),
            ),
            child: const Text('ORIGIN'),
          ),
          TextButton(
            onPressed: _destination != null ? () => _googleMapController.animateCamera(
              CameraUpdate.newCameraPosition(
                CameraPosition(
                  target: _destination!.position,
                  zoom: 14.5,
                  tilt: 50.0,
                ),
              ),
            ) : null,
            style: TextButton.styleFrom(
              foregroundColor: Colors.blue, textStyle: const TextStyle(fontWeight: FontWeight.w600),
            ),
            child: const Text('DESTINATION'),
          )
        ],
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          GoogleMap(
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
            initialCameraPosition: _initialCameraPosition,
            onMapCreated: (controller) => _googleMapController = controller,
            markers: {
              if (_origin != null) _origin!,
              if (_destination != null) _destination!,
            },
            polylines: {
              if (_info != null)
                Polyline(
                  polylineId: const PolylineId('overview_polyline'),
                  color: Colors.red,
                  width: 5,
                  points: _info!.polylinePoints
                      .map((e) => LatLng(e.latitude, e.longitude))
                      .toList(),
                ),
            },
            onLongPress: _addMarker,
          ),
          if (_info != null)
            Positioned(
              top: 20.0,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 6.0,
                  horizontal: 12.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.yellowAccent,
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0, 2),
                      blurRadius: 6.0,
                    )
                  ],
                ),
                child: Text(
                  '${_info!.totalDistance}, ${_info!.totalDuration}',
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.black,
        onPressed: () => _googleMapController.animateCamera(
          _info != null
              ? CameraUpdate.newLatLngBounds(_info!.bounds, 100.0)
              : CameraUpdate.newCameraPosition(_initialCameraPosition),
        ),
        child: const Icon(Icons.center_focus_strong),
      ),
    );
  }

  void _addMarker(LatLng pos) async {
    if (_origin == null) {
      _logger.i("Setting Origin: $pos");
      setState(() {
        _origin = Marker(
          markerId: const MarkerId('origin'),
          infoWindow: const InfoWindow(title: 'Origin'),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
          position: pos,
        );
      });
      // Clear previous destination and info
      _destination = null;
      _info = null;
    } else {
      _logger.i("Setting Destination: $pos");
      setState(() {
        _destination = Marker(
          markerId: const MarkerId('destination'),
          infoWindow: const InfoWindow(title: 'Destination'),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
          position: pos,
        );
        });
      }

      // Fetch directions
      try {
        final directions = await DirectionsRepository().getDirections(
          origin: _origin!.position,
          destination: pos,
        );
        _logger.i("Directions fetched: $directions");

        // Check if the widget is still mounted before using the context
        if (mounted) {
          if (directions != null) {
            setState(() {
              _info = directions;
            });
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('No directions found')),
            );
          }
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error fetching directions: $e')),
          );
        }
      }
    }
  }

