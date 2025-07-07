import 'package:flutter/foundation.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'weather_model.dart';
import 'package:weather_app/presentation/weather_widget.dart';

abstract class IWeatherWidgetModel implements IWidgetModel {
  ValueListenable<Map<String, dynamic>?> get currentWeather;
  ValueListenable<List?> get weeklyWeather;
  ValueListenable<List?> get hourlyWeather;
  ValueListenable<String> get city;
  void updateCity(String newCity);
}

class WeatherWidgetModel extends WidgetModel<WeatherWidget, WeatherModel>
    implements IWeatherWidgetModel {
  final ValueNotifier<Map<String, dynamic>?> _currentWeather = ValueNotifier(null);
  final ValueNotifier<List?> _weeklyWeather = ValueNotifier(null);
  final ValueNotifier<List?> _hourlyWeather = ValueNotifier(null);
  final ValueNotifier<String> _city = ValueNotifier(dotenv.env['CITY']!);

  WeatherWidgetModel(super.model);
  
  @override
  ValueListenable<Map<String, dynamic>?> get currentWeather => _currentWeather;
  @override
  ValueListenable<List?> get weeklyWeather => _weeklyWeather;
  @override
  ValueListenable<List?> get hourlyWeather => _hourlyWeather;
  @override
  ValueNotifier<String> get city => _city;

  @override
  void initWidgetModel() {
    super.initWidgetModel();
    _loadWeatherData();
  }
  @override
  void updateCity(String newCity) {
    if (newCity.isNotEmpty && newCity != _city.value) {
      _city.value = newCity;
      _loadWeatherData();
    }
  }

  Future _loadWeatherData() async {

    _currentWeather.value = await model.fetchCurrentWeather(_city.value);
    _weeklyWeather.value = await model.fetchWeatherWeek(_city.value);
    _hourlyWeather.value = await model.fetchWeatherHour(_city.value);
  }

}
