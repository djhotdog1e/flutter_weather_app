import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:elementary/elementary.dart';
import 'weather_widget_model.dart';
import 'weatherWM_factory.dart';
import 'widgets/weather_header.dart';
import 'widgets/weather_info.dart';
import 'widgets/weather_hour.dart';
import 'widgets/weather_week.dart';

class WeatherScreen extends ElementaryWidget<IWeatherWidgetModel> {
  const WeatherScreen({
    Key? key,
    WidgetModelFactory wmFactory = weatherWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IWeatherWidgetModel wm) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: Center(
        child: Column(
          children: [
            const WeatherHeader(),
            ValueListenableBuilder<Map<String, dynamic>?>(
              valueListenable: wm.currentWeather,
              builder: (context, current, _) {
                if (current == null) {
                  return const Text('Нет данных');
                }
                return WeatherInfo(
                  temp: current['temp_c']?.round() ?? 0,
                  condition: current['condition']['text'] ?? '',
                  iconUrl: current['iconUrl'] ?? '',
                );
              },
            ),
            ValueListenableBuilder<List?>(
              valueListenable: wm.hourlyWeather,
              builder: (context, hours, _) {
                if (hours == null) {
                  return const SizedBox.shrink();
                }
                return ScrollConfiguration(
                      behavior: ScrollConfiguration.of(context).copyWith(dragDevices: {
                        PointerDeviceKind.touch,
                        PointerDeviceKind.mouse,
                      },),
                      child:WeatherHour(hours: hours));
              },
            ),
            ValueListenableBuilder<List?>(
              valueListenable: wm.weeklyWeather,
              builder: (context, week, _) {
                if (week == null) {
                  return const Text('Нет данных');
                }
                return WeatherWeek(dataWeek: week);
              },
            ),
          ],
        ),
      ),
    );
  }
}
