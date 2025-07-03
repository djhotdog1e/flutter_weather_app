import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/data/weatherData.dart';
import 'package:weather_app/data/weatherApi.dart';
import 'package:weather_app/components/header.dart';
import 'package:weather_app/components/weatherInfo.dart';
import 'package:weather_app/components/weatherWeek.dart';
import 'package:weather_app/components/weatherHour.dart';


class WeatherScreen extends StatefulWidget {

   WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => WeatherScreenState();
}
 



class WeatherScreenState extends State<WeatherScreen> {
    final WeatherApi api = WeatherApiCom();
  late Future<List<WeatherData>> futureWeatherWeek;
  late Future<Map<String, dynamic>> futureCurrentWeather;
  late Future<List<WeatherData>> futureWeatherHour;

  @override
  void initState() {
    super.initState();
    futureWeatherWeek = api.fetchWeatherWeek();
    futureCurrentWeather = api.fetchCurrentWeather();
    futureWeatherHour = api.fetchWeatherHour();
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
              builder: (context, state) {
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
                future: futureWeatherHour,
                builder: (context, state) {
                  if (state.hasData) {
                    final hours = state.data!;
                    return ScrollConfiguration(behavior: CustomBehavior(),child: hourWeather(hours),);
                  } else {
                      return const SizedBox.shrink();
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


class CustomBehavior extends ScrollBehavior{
  @override
   Set<PointerDeviceKind> _kTouchLikeDeviceTypes = {
     PointerDeviceKind.mouse,
     PointerDeviceKind.touch,
  };
 }