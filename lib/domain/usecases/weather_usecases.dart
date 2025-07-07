import 'package:weather_app/domain/repositories/weather_repository.dart';
import 'package:weather_app/domain/entities/weather_entity.dart';

class GetCurrentWeather {
  final WeatherRepository repository;

  GetCurrentWeather(this.repository);

  Future<Map<String, dynamic>> call(String city) async {
    return repository.getCurrentWeather(city);
  }
}

class GetWeeklyWeather {
  final WeatherRepository repository;

  GetWeeklyWeather(this.repository);

  Future<List<WeatherEntity>> call(String city) async {
    return repository.getWeeklyWeather(city);
  }
}

class GetHourlyWeather {
  final WeatherRepository repository;

  GetHourlyWeather(this.repository);

  Future<List<WeatherEntity>> call(String city) async {
    return repository.getHourlyWeather(city);
  }
}
