import 'package:flutter/material.dart';

class WeatherInfo extends StatelessWidget {
  final int temp;
  final String condition;
  final String iconUrl;

  const WeatherInfo({
    super.key,
    required this.temp,
    required this.condition,
    required this.iconUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 50, bottom: 50),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(iconUrl, width: 50, height: 50),
              Text(
                '$temp°',
                style: const TextStyle(
                  fontSize: 70,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 36, 89, 116),
                ),
              ),
            ],
          ),
          Text(
            condition,
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 36, 33, 33),
            ),
          ),
        ],
      ),
    );
  }
}
