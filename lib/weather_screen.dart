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
                      return Icon(Icons.wb_sunny,
                          size: 100, color: Colors.yellow);
                    case Weather.cloudy:
                      return Icon(
                        Icons.wb_cloudy,
                        size: 100,
                        color: Colors.white,
                      );
                    case Weather.rainy:
                      return Icon(Icons.umbrella, size: 100, color: Colors.red);
                    default:
                      return Icon(
                        Icons.wb_sunny,
                        size: 100,
                        color: Colors.yellow,
                      );
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
            ValueListenableBuilder<bool>(
              valueListenable: manager.isLoadingNotifier,
              builder: (context, isLoading, child) {
                if (isLoading) {
                  return CircularProgressIndicator();
                } else {
                  return ElevatedButton(
                    onPressed: () {
                      manager.updateWeather();
                    },
                    child: Text('Update'),
                  );
                }
              },
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
