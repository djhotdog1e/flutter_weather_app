import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weather_app/data/DTO/weatherDTO.dart';


abstract class API {
  dynamic fetchCurrentWeather(String city);
  dynamic fetchWeatherWeek(String city);
  dynamic fetchWeatherHour(String city);
}

class WeatherApiCom implements API {
  static String get apiKey => dotenv.env['API_KEY']!;
  static String get baseUrl => dotenv.env['WEATHER_URL']!;

  @override
  Future<Map<String, dynamic>> fetchCurrentWeather(String city) async {
    final url = '$baseUrl/current.json?key=$apiKey&q=$city&lang=ru';
    final response = await http.get(Uri.parse(url));
    final data = jsonDecode(response.body);
    final current = data['current'];
    current['iconUrl'] = 'https:${current['condition']['icon']}';
    return current;
  }

  @override
  Future<List<WeatherDTO>> fetchWeatherWeek(String city) async {
    final url = '$baseUrl/forecast.json?key=$apiKey&q=$city&days=7&lang=ru';
    final response = await http.get(Uri.parse(url));
    final data = jsonDecode(response.body);
    final List forecastDays = data['forecast']['forecastday'];
    return forecastDays.map((json) => WeatherDTO.fromForecastDay(json)).toList();
  }

  @override
  Future<List<WeatherDTO>> fetchWeatherHour(String city) async {
    final url = '$baseUrl/forecast.json?key=$apiKey&q=$city&days=1&lang=ru';
    final response = await http.get(Uri.parse(url));
    final data = jsonDecode(response.body);
    final List hours = data['forecast']['forecastday'][0]['hour'];
    return hours.map((json) => WeatherDTO.fromHourJson(json)).toList();
  }
}