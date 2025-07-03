import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'weatherData.dart';

abstract class WeatherApi {
  Future<Map<String, dynamic>> fetchCurrentWeather();
  Future<List<WeatherData>> fetchWeatherWeek();
  Future<List<WeatherData>> fetchWeatherHour();
}

class WeatherApiCom implements WeatherApi {
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
  Future<List<WeatherData>> fetchWeatherWeek() async {
    final url = '$baseUrl/forecast.json?key=$apiKey&q=$city&days=7&lang=ru';
    final response = await http.get(Uri.parse(url));
    final data = jsonDecode(response.body);
    final List forecastDays = data['forecast']['forecastday'];
    return forecastDays.map<WeatherData>((json) => WeatherData.fromForecastDay(json)).toList();
  }

  @override
  Future<List<WeatherData>> fetchWeatherHour() async {
    final url = '$baseUrl/forecast.json?key=$apiKey&q=$city&days=1&lang=ru';
    final response = await http.get(Uri.parse(url));
    final data = jsonDecode(response.body);
    final List hours = data['forecast']['forecastday'][0]['hour'];
    return hours.map<WeatherData>((json) => WeatherData.fromHourJson(json)).toList();
  }
}