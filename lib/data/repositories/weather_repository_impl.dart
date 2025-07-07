import 'package:weather_app/data/DTO/weatherDTO.dart';
import 'package:weather_app/domain/entities/weather_entity.dart';
import 'package:weather_app/domain/repositories/weather_repository.dart';
import 'package:weather_app/data/datasourses/API.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final API api;

  WeatherRepositoryImpl({required this.api});


  @override
  Future<Map<String, dynamic>> getCurrentWeather(String city) async {
    return await api.fetchCurrentWeather(city);
  }

  @override
  Future<List<WeatherEntity>> getWeeklyWeather(String city) async {
    final List<WeatherDTO> weeklyDTO = await api.fetchWeatherWeek(city);
    return weeklyDTO.map((dto) => WeatherEntity(
      day: dto.day,
      maxTemp: dto.maxTemp,
      minTemp: dto.minTemp,
      condition: dto.condition,
      iconUrl: dto.iconUrl,
    )).toList();
  }

  @override
  Future<List<WeatherEntity>> getHourlyWeather(String city) async {
    final List<WeatherDTO> hourlyDTO = await api.fetchWeatherHour(city);
    return hourlyDTO.map((dto) => WeatherEntity(
      hour: dto.hour,
      tempHour: dto.tempHour,
      condition: dto.condition,
      iconUrl: dto.iconUrl,
    )).toList();
  }
}
