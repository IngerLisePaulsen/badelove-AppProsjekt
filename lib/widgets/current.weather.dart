import 'dart:convert' show jsonDecode;

import 'package:http/http.dart' as http; //hente ut http fra pubspec.yaml

class CurrentWeather {
  final String cityName;
  final String apiKey;

  CurrentWeather({required this.cityName, required this.apiKey});

  Future<double> fetchTemperature() async {
    final url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=Bergen&appid=f5a86950619ef3046624e8687e9dbc6b');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      final temperature = jsonResponse['main']['temp'];
      return (temperature - 273.15).toDouble();
    } else {
      throw Exception('failed to get W.data');
    }
  }
}
