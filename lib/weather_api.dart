import 'dart:convert';
import 'package:http/http.dart';

import 'weather.dart';

// 47.913833, 106.919501
class WeatherApi {
  Future<WeatherData> getWeatherData() async {
    final url = Uri.parse(
        'https://fcc-weather-api.glitch.me/api/current?lat=47.913833&lon=106.919501');
    final result = await get(url);
    final jsonString = result.body;
    final myMap = jsonDecode(jsonString);
    final degree = myMap['main']['temp'] as double;
    final weatherString = myMap['weather'][0]['main'];
    final Weather weather;
    switch (weatherString) {
      case 'Clouds':
        weather = Weather.cloudy;
        break;
      case 'Clear':
        weather = Weather.sunny;
        break;
      case 'Rain':
        weather = Weather.rainy;
        break;
      default:
        weather = Weather.sunny;
    }
    return WeatherData(weather, degree.toInt());
  }
}
