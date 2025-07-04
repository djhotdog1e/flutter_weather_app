class WeatherEntity {
  final String day;
  final double? maxTemp;
  final double? minTemp;
  final String condition;
  final String iconUrl;
  final String? hour;
  final double? tempHour;

  const WeatherEntity({
    this.day = '',
    this.maxTemp,
    this.minTemp,
    required this.condition,
    required this.iconUrl,
    this.hour,
    this.tempHour,
  });
}
