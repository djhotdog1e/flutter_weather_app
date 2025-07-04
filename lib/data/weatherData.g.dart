// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weatherData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherData _$WeatherDataFromJson(Map<String, dynamic> json) => WeatherData(
  day: json['day'] as String? ?? '',
  maxTemp: (json['maxTemp'] as num?)?.toDouble(),
  minTemp: (json['minTemp'] as num?)?.toDouble(),
  condition: json['condition'] as String,
  iconUrl: json['iconUrl'] as String,
  hour: json['hour'] as String?,
  tempHour: (json['tempHour'] as num?)?.toDouble(),
);

Map<String, dynamic> _$WeatherDataToJson(WeatherData instance) =>
    <String, dynamic>{
      'day': instance.day,
      'maxTemp': instance.maxTemp,
      'minTemp': instance.minTemp,
      'condition': instance.condition,
      'iconUrl': instance.iconUrl,
      'hour': instance.hour,
      'tempHour': instance.tempHour,
    };
