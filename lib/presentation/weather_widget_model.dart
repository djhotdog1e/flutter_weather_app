import 'package:flutter/foundation.dart';
import 'package:elementary/elementary.dart';
import 'weather_model.dart';
import 'package:weather_app/presentation/weather_screen.dart';

abstract class IWeatherWidgetModel implements IWidgetModel {
  ValueListenable<Map<String, dynamic>?> get currentWeather;
  ValueListenable<List?> get weeklyWeather;
  ValueListenable<List?> get hourlyWeather;
}

class WeatherWidgetModel extends WidgetModel<WeatherScreen, WeatherModel>
    implements IWeatherWidgetModel {
  final ValueNotifier<Map<String, dynamic>?> _currentWeather = ValueNotifier(null);
  final ValueNotifier<List?> _weeklyWeather = ValueNotifier(null);
  final ValueNotifier<List?> _hourlyWeather = ValueNotifier(null);

  WeatherWidgetModel(super.model);
  
  @override
  ValueListenable<Map<String, dynamic>?> get currentWeather => _currentWeather;
  @override
  ValueListenable<List?> get weeklyWeather => _weeklyWeather;
  @override
  ValueListenable<List?> get hourlyWeather => _hourlyWeather;


  @override
  void initWidgetModel() {
    super.initWidgetModel();
    _loadWeatherData();
  }

Future<void> _loadWeatherData() async {
  _currentWeather.value = await model.fetchCurrentWeather();
  print('Current weather loaded: ${_currentWeather.value != null}');
  
  _weeklyWeather.value = await model.fetchWeatherWeek();
  print('Weekly weather loaded: ${_weeklyWeather.value?.length ?? 0} days');
  
  _hourlyWeather.value = await model.fetchWeatherHour();
  print('Hourly weather loaded: ${_hourlyWeather.value?.length ?? 0} hours');
}


}
