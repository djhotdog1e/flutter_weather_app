class WeatherData {
  final String day;
  final double maxTemp;
  final double minTemp;
  final String condition;
  final String iconUrl;

  WeatherData({
    required this.day,
    required this.maxTemp,
    required this.minTemp,
    required this.condition,
    required this.iconUrl,
  });

  factory WeatherData.fromForecastDay(Map<String, dynamic> json) {
    final date = DateTime.parse(json['date']);
    const weekDays = ['Пн', 'Вт', 'Ср', 'Чт', 'Пт', 'Сб', 'Вс'];
    return WeatherData(
      day: weekDays[date.weekday - 1],
      maxTemp: (json['day']['maxtemp_c'] as double).roundToDouble(),
      minTemp: (json['day']['mintemp_c'] as double).roundToDouble(),
      condition: json['day']['condition']['text'],
      iconUrl: 'https:${json['day']['condition']['icon']}',
    );
  }
}
