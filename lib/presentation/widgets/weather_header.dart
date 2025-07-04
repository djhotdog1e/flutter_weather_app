import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class WeatherHeader extends StatelessWidget {
  const WeatherHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final city = dotenv.env['CITY']!;
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(top: 50),
      decoration: BoxDecoration(
        color: Colors.cyan,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
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