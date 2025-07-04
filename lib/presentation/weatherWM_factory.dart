import 'package:flutter/material.dart';
import 'package:weather_app/data/datasourses/API.dart';
import 'package:weather_app/presentation/weather_model.dart';
import 'package:weather_app/domain/usecases/weather_usecases.dart';
import 'package:weather_app/presentation/weather_widget_model.dart';
import 'package:weather_app/data/repositories/weather_repository_impl.dart';



WeatherWidgetModel weatherWidgetModelFactory(BuildContext context) {
  final repository = WeatherRepositoryImpl(api: WeatherApiCom());

  final getCurrentWeather = GetCurrentWeather(repository);
  final getWeeklyWeather = GetWeeklyWeather(repository);
  final getHourlyWeather = GetHourlyWeather(repository);

  final model = WeatherModel(
    getCurrentWeather: getCurrentWeather,
    getWeeklyWeather: getWeeklyWeather,
    getHourlyWeather: getHourlyWeather,
  );

  return WeatherWidgetModel(model);
}
