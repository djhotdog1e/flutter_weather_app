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

  Future<Map<String, dynamic>?> fetchCurrentWeather(String city) async {
      return getCurrentWeather(city);

  }

  Future<List?> fetchWeatherWeek(String city) async {
      return getWeeklyWeather(city);
  }

  Future<List?> fetchWeatherHour(String city) async {
      return getHourlyWeather(city);

  }

}

