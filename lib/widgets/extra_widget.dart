import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:Feather/models/weather_forecast_daily.dart';

class ExtraWeather extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;

  const ExtraWeather({
    Key? key,
    required this.snapshot,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var forecastList = snapshot.data!.list;
    var humidity = forecastList![0].humidity!;
    var wind = forecastList[0].speed!;
    var rain = forecastList[0].clouds!;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            const Icon(CupertinoIcons.wind, color: Colors.white70),
            const SizedBox(height: 10),
            Text(
              "$wind km/h",
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 14),
            ),
            const SizedBox(height: 10),
            const Text(
              "Wind",
              style: TextStyle(color: Colors.white54, fontSize: 14),
            )
          ],
        ),
        Column(
          children: [
            const Icon(CupertinoIcons.drop, color: Colors.white70),
            const SizedBox(height: 10),
            Text(
              "$humidity %",
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 14),
            ),
            const SizedBox(height: 10),
            const Text(
              "Humidity",
              style: TextStyle(color: Colors.white54, fontSize: 14),
            )
          ],
        ),
        Column(
          children: [
            const Icon(CupertinoIcons.cloud_rain, color: Colors.white70),
            const SizedBox(height: 10),
            Text(
              "$rain %",
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 14),
            ),
            const SizedBox(height: 10),
            const Text(
              "Rain",
              style: TextStyle(color: Colors.white54, fontSize: 14),
            )
          ],
        )
      ],
    );
  }
}
