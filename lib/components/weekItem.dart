import 'package:flutter/material.dart';
import 'package:weather_app/data/weatherData.dart';

Widget weekItem(WeatherData data) {
  return Container(
    width: 90,
    margin: const EdgeInsets.only(right: 10),
    padding: const EdgeInsets.all(8),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),
    ),
    child: Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(data.day),
          Image.network(
            data.iconUrl,
            width: 32,
            height: 32,
          ),
          Text(
            '${data.maxTemp}°',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text('${data.minTemp}°', style: const TextStyle(color: Colors.grey)),
          Text(data.condition, textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10))
        ],
      ),
    ),
  );
}
