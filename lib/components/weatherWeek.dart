import 'package:flutter/material.dart';
import 'package:weather_app/components/weekItem.dart';
import 'package:weather_app/data/weatherData.dart';

Widget weatherWeek(List<WeatherData> dataWeek) {
  return Center(
    child: Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Прогноз на неделю',
            style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 150,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [for (final data in dataWeek) weekItem(data)],
            ),
          ),
        ],
      ),
    ),
  );
}

