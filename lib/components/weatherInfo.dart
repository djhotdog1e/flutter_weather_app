import 'package:flutter/material.dart';

Widget weatherInfo({
  required int temp,
  required String condition,
  required String iconUrl,
}) {
  return Container(
    margin: const EdgeInsets.only(top: 50, bottom: 50),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              iconUrl,
              width: 50,
              height: 50,
            ),
            Text(
              '$temp°',
              style: TextStyle(
                fontSize: 70,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 36, 89, 116),
              ),
            ),
          ],
        ),
        Text(
          condition,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: const Color.fromARGB(255, 36, 33, 33),
          ),
        ),
      ],
    ),
  );
}
abstract class WeatherRepository{


  Future<void> getWeather()async {
  }
}