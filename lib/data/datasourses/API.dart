import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../weatherData.dart';
import 'package:weather_app/data/models/weather_model.dart';

abstract class API {
  dynamic fetchCurrentWeather();
  dynamic fetchWeatherWeek();
  dynamic fetchWeatherHour();
}

class WeatherApiCom implements API {
  static String get apiKey => dotenv.env['API_KEY']!;
  static String get baseUrl => dotenv.env['WEATHER_URL']!;
  static String get city => dotenv.env['CITY']!;

  @override
  Future<Map<String, dynamic>> fetchCurrentWeather() async {
    final url = '$baseUrl/current.json?key=$apiKey&q=$city&lang=ru';
    final response = await http.get(Uri.parse(url));
    final data = jsonDecode(response.body);
    final current = data['current'];
    current['iconUrl'] = 'https:${current['condition']['icon']}';
    return current;
  }

  @override
  Future<List<WeatherModel>> fetchWeatherWeek() async {
    final url = '$baseUrl/forecast.json?key=$apiKey&q=$city&days=7&lang=ru';
    final response = await http.get(Uri.parse(url));
    final data = jsonDecode(response.body);
    final List forecastDays = data['forecast']['forecastday'];
    return forecastDays.map((json) => WeatherModel.fromForecastDay(json)).toList();
  }

  @override
  Future<List<WeatherModel>> fetchWeatherHour() async {
    final url = '$baseUrl/forecast.json?key=$apiKey&q=$city&days=1&lang=ru';
    final response = await http.get(Uri.parse(url));
    final data = jsonDecode(response.body);
    final List hours = data['forecast']['forecastday'][0]['hour'];
    return hours.map((json) => WeatherModel.fromHourJson(json)).toList();
  }
}