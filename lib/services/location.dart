import 'dart:convert';

import 'package:http/http.dart' as http;

class LocationService {
  final String apiKey = '02a215df6cd682da9610e6921d10bd45';

  Future<List<Map<String, dynamic>>?> fetchLocationData(String query) async {
    final url = Uri.parse(
        'http://api.positionstack.com/v1/forward?access_key=$apiKey&query=$query');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data['data'] != null && data['data'].isNotEmpty) {
          return List<Map<String, dynamic>>.from(data['data']);
        }
      }
      return null;
    } catch (e) {
      print("Error fetching location data: $e");
      return null;
    }
  }
}
