import 'package:flutter/material.dart';
import 'package:weather_app/components/WeatherApp.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  runApp(const WeatherApp());
}


