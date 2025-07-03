import 'dart:convert';
import 'package:http/http.dart' as http;
import 'weatherData.dart';

class WeatherApi {
  static const String apiKey = 'c06d239e340b4f539a681914250207'; 
  static const String city = 'Saint Petersburg';

    static Future<Map<String, dynamic>> fetchCurrentWeather() async {
    final url =
        'https://api.weatherapi.com/v1/current.json?key=$apiKey&q=$city&lang=ru';

    final response = await http.get(Uri.parse(url));

    final data = jsonDecode(response.body);
    final current = data['current'];
    current['iconUrl'] = 'https:${current['condition']['icon']}';
    return current;
  }

  static Future<List<WeatherData>> fetchWeatherWeek() async {
    final url =
        'https://api.weatherapi.com/v1/forecast.json?key=$apiKey&q=$city&days=7&lang=ru';

    final response = await http.get(Uri.parse(url));
    final data = jsonDecode(response.body);
    final List forecastDays = data['forecast']['forecastday'];
    return forecastDays.map<WeatherData>((json) => WeatherData.fromForecastDay(json)).toList();
  }

  static Future<List<WeatherData>> fetchWeatherHour() async {
    final url =
        'https://api.weatherapi.com/v1/forecast.json?key=$apiKey&q=$city&days=1&lang=ru';

    final response = await http.get(Uri.parse(url));

    final data = jsonDecode(response.body);
    final List hours = data['forecast']['forecastday'][0]['hour'];
    return hours.map<WeatherData>((json) => WeatherData.fromHourJson(json)).toList();
  }

}
