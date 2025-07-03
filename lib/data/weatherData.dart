class WeatherData {
  final String day;
  final double maxTemp;
  final double minTemp;
  final String condition;
  final String iconUrl;
  final String? hour;    
  final double tempHour;   

  WeatherData({
    required this.condition,
    required this.iconUrl,
    this.day = '',
    this.maxTemp = 0,
    this.minTemp = 0,
    this.hour = '',
    this.tempHour = 0,
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

  factory WeatherData.fromHourJson(Map<String, dynamic> json) {
    final timeStr = json['time'];
    final hour = DateTime.parse(timeStr).hour.toString().padLeft(2, '0');
    return WeatherData(
      hour: '$hour:00',
      tempHour: (json['temp_c'] as double).roundToDouble(),
      condition: json['condition']['text'],
      iconUrl: 'https:${json['condition']['icon']}',
    );
  }
}
