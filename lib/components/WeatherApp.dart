import 'package:flutter/material.dart';
//import 'package:weather_app/components/WeatherScreen.dart';
import 'package:weather_app/presentation/weather_screen.dart';
class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Погода',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan),
      ),
      home:  WeatherScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}