abstract class WeatherRepository {
  dynamic getCurrentWeather(String city);
  dynamic getWeeklyWeather(String city);
  dynamic getHourlyWeather(String city);
}

