enum Weather {
  sunny,
  cloudy,
  rainy,
}

class WeatherData {
  WeatherData(this.weather, this.degree);
  final Weather weather;
  final int degree;
}
