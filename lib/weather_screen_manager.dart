import 'package:flutter/material.dart';

import 'weather.dart';
import 'weather_api.dart';

class WeatherScreenManager {
  final weatherNotifier = ValueNotifier<Weather>(Weather.sunny);
  final degreeNotifier = ValueNotifier<String>('-');
  final isLoadingNotifier = ValueNotifier<bool>(false);
  final weatherData = WeatherApi();

  void updateWeather() async {
    isLoadingNotifier.value = true;

    final WeatherData data = await weatherData.getWeatherData();
    degreeNotifier.value = '${data.degree}°';

    weatherNotifier.value = data.weather;

    isLoadingNotifier.value = false;
  }
}
