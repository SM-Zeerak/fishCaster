

// import 'dart:convert';
// import 'package:fish_caster/core/string_cons.dart';
// import 'package:http/http.dart' as http;

// class LocationService {
//   static Future<void> fetchLocationData(double lat, double lon, String token) async {
//     const String baseUrl = "${StringCons.baseApiUrl}/locations";  // Replace with your actual base URL

//     final response = await http.post(
//       Uri.parse(baseUrl),
//       headers: {
//         'Content-Type': 'application/json',
//         'Authorization': 'Bearer $token',  // Add the Authorization token in the header
//       },
//       body: json.encode({
//         "lat": lat,
//         "lon": lon,
//         "name": "Miami, FL", // Change if you need to dynamically pass this value
//       }),
//     );

//     if (response.statusCode == 200) {
//       // Handle success
//       print('Response data: ${response.body}');
//     } else {
//       // Handle error
//       print('Error: ${response.statusCode}');
//     }
//   }
// }


import 'dart:convert';
import 'package:fish_caster/core/string_cons.dart';
import 'package:http/http.dart' as http;

class LocationService {
  static Future<void> fetchLocationData(double lat, double lon, String token) async {
    const String baseUrl = "${StringCons.baseApiUrl}/locations";  // Replace with your actual base URL

    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',  // Add the Authorization token in the header
      },
      body: json.encode({
        "lat": lat,
        "lon": lon,
        "name": "Miami, FL", // Change if you need to dynamically pass this value
      }),
    );

    if (response.statusCode == 200) {
      // Handle success and print response body
      print('Response data: ${response.body}');
    } else {
      // Handle error and print error status code
      print('Error: ${response.statusCode}');
      print('Error response: ${response.body}');
    }
  }
}
