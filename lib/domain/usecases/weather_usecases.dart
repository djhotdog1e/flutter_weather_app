import 'package:weather_app/domain/repositories/weather_repository.dart';
import 'package:weather_app/domain/entities/weather_entity.dart';

class GetCurrentWeather {
  final WeatherRepository repository;

  GetCurrentWeather(this.repository);

  Future<Map<String, dynamic>> call() async {
    return repository.getCurrentWeather();
  }
}

class GetWeeklyWeather {
  final WeatherRepository repository;

  GetWeeklyWeather(this.repository);

  Future<List<WeatherEntity>> call() async {
    return repository.getWeeklyWeather();
  }
}

class GetHourlyWeather {
  final WeatherRepository repository;

  GetHourlyWeather(this.repository);

  Future<List<WeatherEntity>> call() async {
    return repository.getHourlyWeather();
  }
}
