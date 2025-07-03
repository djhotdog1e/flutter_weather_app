import 'package:json_annotation/json_annotation.dart';

part 'weatherData.g.dart';

@JsonSerializable()
class WeatherData {
  final String day;
  final double? maxTemp;
  final double? minTemp;
  final String condition;
  final String iconUrl;
  final String? hour;
  final double? tempHour;

  WeatherData({
    this.day= '',
    this.maxTemp,
    this.minTemp,
    required this.condition,
    required this.iconUrl,
    this.hour,
    this.tempHour,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) => _$WeatherDataFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherDataToJson(this);

  factory WeatherData.fromForecastDay(Map<String, dynamic> json) {
    final date = DateTime.parse(json['date']);
    const weekDays = ['Пн', 'Вт', 'Ср', 'Чт', 'Пт', 'Сб', 'Вс'];
    return WeatherData(
      day: weekDays[date.weekday - 1],
      maxTemp: (json['day']['maxtemp_c'] as num).toDouble(),
      minTemp: (json['day']['mintemp_c'] as num).toDouble(),
      condition: json['day']['condition']['text'],
      iconUrl: 'https:${json['day']['condition']['icon']}',
    );
  }

  factory WeatherData.fromHourJson(Map<String, dynamic> json) {
    final timeStr = json['time'];
    final hour = DateTime.parse(timeStr).hour.toString().padLeft(2, '0');
    return WeatherData(
      hour: '$hour:00',
      tempHour: (json['temp_c'] as num).toDouble(),
      condition: json['condition']['text'],
      iconUrl: 'https:${json['condition']['icon']}',
    );
  }
}

// data 
//   dto 
//   repositories
  
// domain
//   usecases 
// presentation
//   widgets 
//   models 

