import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:module2_4_lab_exercise/env.dart';
import 'package:module2_4_lab_exercise/views/directions_model.dart';

class DirectionsRepository {
  static const String _baseUrl =
      'https://maps.googleapis.com/maps/api/directions/json?';

  final Dio _dio;

  DirectionsRepository({Dio? dio}) : _dio = dio ?? Dio();

  Future<Directions?> getDirections({ // Changed return type to nullable
    required LatLng origin,
    required LatLng destination,
  }) async {
    try {
      final response = await _dio.get(
        _baseUrl,
        queryParameters: {
          'origin': '${origin.latitude},${origin.longitude}',
          'destination': '${destination.latitude},${destination.longitude}',
          'key': googleAPIKey,
        },
      );

      // Check if response is successful
      if (response.statusCode == 200) {
        return Directions.fromMap(response.data);
      }
    } catch (e) {
      // Handle exceptions (like network errors)
      debugPrint('Error fetching directions: $e');
    }
    return null; // Return null if something went wrong
  }
}
