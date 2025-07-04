import 'package:flutter/material.dart';
import 'package:weather_app/data/weatherData.dart';

Widget hourWeather(List<WeatherData> hours) {
  final dataHours = hours.take(24).toList();

  return Container(
    height: 163,
    margin: const EdgeInsets.symmetric(vertical: 10),
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: dataHours.length,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        final hour = dataHours[index];
        
        return Container(
          width: 90,
          margin: const EdgeInsets.symmetric(horizontal: 6),
          padding: const EdgeInsets.only(top: 10, left: 8, right: 8, bottom: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(hour.hour ?? '', style: const TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Image.network(
                hour.iconUrl,
                width: 32,
                height: 32,
              ),
              const SizedBox(height: 4),
              Text('${hour.tempHour}°', style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 4),
              Text(hour.condition, textAlign: TextAlign.center,style: const TextStyle(fontSize: 10)),
            ],
          ),
        );
      },
    ),
  );
}


abstract class SomeShit{

  void doShit();

}

class ConcreteShit implements SomeShit{
 
 
  @override
  void doShit() {
    print('shit happens');
  }

}
