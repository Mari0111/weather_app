import 'package:flutter/material.dart';
import 'package:my_weather/weather_screen_manager.dart';

import 'weather.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final manager = WeatherScreenManager();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            ValueListenableBuilder<Weather>(
                valueListenable: manager.weatherNotifier,
                builder: (context, value, child) {
                  switch (value) {
                    case Weather.sunny:
                      return const Icon(
                        Icons.wb_sunny,
                        size: 100,
                        color: Colors.yellow,
                      );
                    case Weather.cloudy:
                      return const Icon(
                        Icons.wb_cloudy,
                        size: 100,
                        color: Colors.blueGrey,
                      );
                    case Weather.rainy:
                      return const Icon(Icons.umbrella,
                          size: 100, color: Colors.greenAccent);
                    default:
                      return const Icon(Icons.wb_sunny, size: 100);
                  }
                }),
            SizedBox(height: 20),
            ValueListenableBuilder<String>(
              valueListenable: manager.degreeNotifier,
              builder: (context, value, child) {
                return Text(
                  value,
                  style: TextStyle(fontSize: 40),
                );
              },
            ),
            const Text(
              'Ulaanbaatar',
              style: TextStyle(fontSize: 30),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                manager.updateWeather();
              },
              child: Text('Update'),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
