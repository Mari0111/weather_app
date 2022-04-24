import 'package:flutter/material.dart';

import 'weather.dart';
import 'weather_data.dart';

class WeatherScreenManager {
  final weatherNotifier = ValueNotifier<Weather>(Weather.sunny);
  final degreeNotifier = ValueNotifier<String>('-');
  final weatherData = WeatherData();

  void updateWeather() async {
    // TODO: ask the internet
    print('Updating...');
    final degree = await weatherData.getDegree();
    degreeNotifier.value = '$degree°';

    weatherNotifier.value = await weatherData.getWeather();
  }
}
