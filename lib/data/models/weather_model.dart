import 'package:weather_app/domain/entities/weather_entity.dart';

class WeatherModel extends WeatherEntity {
  const WeatherModel({
    required String day,
    double? maxTemp,
    double? minTemp,
    required String condition,
    required String iconUrl,
    String? hour,
    double? tempHour,
  }) : super(
          day: day,
          maxTemp: maxTemp,
          minTemp: minTemp,
          condition: condition,
          iconUrl: iconUrl,
          hour: hour,
          tempHour: tempHour,
        );

  factory WeatherModel.fromForecastDay(Map<String, dynamic> json) {
    final date = DateTime.parse(json['date']);
    const weekDays = ['Пн', 'Вт', 'Ср', 'Чт', 'Пт', 'Сб', 'Вс'];

    return WeatherModel(
      day: weekDays[date.weekday - 1],
      maxTemp: (json['day']['maxtemp_c'] as num).toDouble(),
      minTemp: (json['day']['mintemp_c'] as num).toDouble(),
      condition: json['day']['condition']['text'],
      iconUrl: 'https:${json['day']['condition']['icon']}',
    );
  }

  factory WeatherModel.fromHourJson(Map<String, dynamic> json) {
    final timeStr = json['time'];
    final hour = DateTime.parse(timeStr).hour.toString().padLeft(2, '0');

    return WeatherModel(
      day: '',
      hour: '$hour:00',
      tempHour: (json['temp_c'] as num).toDouble(),
      condition: json['condition']['text'],
      iconUrl: 'https:${json['condition']['icon']}',
    );
  }
}
