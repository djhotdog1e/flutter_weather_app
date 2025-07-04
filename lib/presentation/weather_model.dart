import 'package:weather_app/domain/usecases/weather_usecases.dart';
import 'package:elementary/elementary.dart';

class WeatherModel extends ElementaryModel {
  final GetCurrentWeather getCurrentWeather;
  final GetWeeklyWeather getWeeklyWeather;
  final GetHourlyWeather getHourlyWeather;

  WeatherModel({
    required this.getCurrentWeather,
    required this.getWeeklyWeather,
    required this.getHourlyWeather,
  });

  Future<Map<String, dynamic>?> fetchCurrentWeather() async {
      return getCurrentWeather();

  }

  Future<List?> fetchWeatherWeek() async {
      return getWeeklyWeather();
  }

  Future<List?> fetchWeatherHour() async {
      return getHourlyWeather();

  }
}

