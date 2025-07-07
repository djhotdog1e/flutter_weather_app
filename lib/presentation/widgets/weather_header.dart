import 'package:flutter/material.dart';

class WeatherHeader extends StatelessWidget {
  final String city;
  final ValueChanged<String> onCityChanged;
  const WeatherHeader({super.key, required this.city, required this.onCityChanged});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(top: 50),
      decoration: BoxDecoration(
        color: Colors.cyan,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(5),
            child: TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
              controller: TextEditingController(text: city),
              onSubmitted: onCityChanged,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            city,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Сегодня, ${now.day}.${now.month}.${now.year}',
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}