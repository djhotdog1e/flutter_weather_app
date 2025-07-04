import 'package:flutter/material.dart';
import 'week_item.dart';

class WeatherWeek extends StatelessWidget {
  final List dataWeek;

  const WeatherWeek({super.key, required this.dataWeek});

  @override
  Widget build(BuildContext context) {
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
                children: [for (final data in dataWeek) WeekItem(data: data)],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
