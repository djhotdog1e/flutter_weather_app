import 'package:flutter/material.dart';
import 'package:weather_app/data/weatherData.dart';
import 'package:weather_app/data/weatherApi.dart';
import 'package:weather_app/components/header.dart';
import 'package:weather_app/components/weatherInfo.dart';
import 'package:weather_app/components/weatherWeek.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => WeatherScreenState();
}

class WeatherScreenState extends State<WeatherScreen> {
  late Future<List<WeatherData>> futureWeatherWeek;
  late Future<Map<String, dynamic>> futureCurrentWeather;

  @override
  void initState() {
    super.initState();
    futureWeatherWeek = WeatherApi.fetchWeatherWeek();
    futureCurrentWeather = WeatherApi.fetchCurrentWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: Center(
        child: Column(
          children: [
            header(),
            FutureBuilder<Map<String, dynamic>>(
              future: futureCurrentWeather,
              builder: (a, state) {
                if (state.hasData) {
                  final current = state.data!;
                  final condition = current['condition']['text'] as String;
                  final iconUrl = current['iconUrl'] as String;
                  return weatherInfo(
                    temp: current['temp_c'].round(),
                    condition: condition,
                    iconUrl: iconUrl,
                  );
                } else {
                  return Text('Нет данных');
                }
              },
            ),
            FutureBuilder<List<WeatherData>>(
              future: futureWeatherWeek,
              builder: (context, state) {
                if (state.hasData) {
                  final week = state.data!;
                  return weatherWeek(week);
                } else {
                  return Text('Нет данных');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}