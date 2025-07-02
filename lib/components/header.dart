import 'package:flutter/material.dart';

Widget header() {
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
        const Text(
          'Санкт-Петербург',
          style: TextStyle(
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