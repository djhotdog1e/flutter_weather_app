import 'package:weather_app/domain/entities/weather_entity.dart';
import 'package:weather_app/domain/repositories/weather_repository.dart';
import 'package:weather_app/data/datasourses/API.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final API api;

  WeatherRepositoryImpl({required this.api});


  @override
  Future<Map<String, dynamic>> getCurrentWeather() async {
    return await api.fetchCurrentWeather();
  }

  @override
  Future<List<WeatherEntity>> getWeeklyWeather() async {
    return await api.fetchWeatherWeek();
  }

  @override
  Future<List<WeatherEntity>> getHourlyWeather() async {
    return await api.fetchWeatherHour();
  }
}
