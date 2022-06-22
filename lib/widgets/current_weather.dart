import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';

import 'package:Feather/models/weather_forecast_daily.dart';
import 'package:Feather/utilities/forecast_util.dart';
import 'package:Feather/widgets/extra_widget.dart';

String normaliseName(String name) {
  final stringBuffer = StringBuffer();
  var capitalizeNext = true;
  for (final letter in name.toLowerCase().codeUnits) {
    if (capitalizeNext && letter >= 97 && letter <= 122) {
      stringBuffer.writeCharCode(letter - 32);
      capitalizeNext = false;
    } else {
      if (letter == 32 || letter == 46) capitalizeNext = true;
      stringBuffer.writeCharCode(letter);
    }
  }

  return stringBuffer.toString();
}

class CurrentWeather extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;

  const CurrentWeather({
    Key? key,
    required this.snapshot,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var data = snapshot.data;
    var forecastList = data!.list!;
    var temp = forecastList[0].temp!.day!.toStringAsFixed(0);

    return GlowContainer(
      alignment: Alignment.center,
      glowColor: Colors.transparent,
      height: MediaQuery.of(context).size.height * 0.7,
      margin: const EdgeInsets.all(25),
      padding: const EdgeInsets.only(top: 50, left: 5, right: 5),
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(30),
        topLeft: Radius.circular(30),
        bottomLeft: Radius.circular(30),
        bottomRight: Radius.circular(30),
      ),
      color: CupertinoColors.tertiarySystemFill,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            data.city!.name!,
            textAlign: TextAlign.center,
            textScaleFactor: 1.05,
            style: const TextStyle(
                color: CupertinoColors.lightBackgroundGray,
                fontSize: 46,
                letterSpacing: 0,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w400,
                height: -0.95),
          ),
          SizedBox(
            height: 200,
            child: Stack(
              children: [
                Image(
                  image: AssetImage(
                    Util.findIcon('${forecastList[0].weather![0].main}', false),
                  ),
                  matchTextDirection: true,
                  fit: BoxFit.scaleDown,
                  height: 100,
                  alignment: Alignment.center,
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          ' $temp °C ',
                          style: const TextStyle(
                            fontSize: 42,
                            fontFamily: 'Montserrat',
                            color: CupertinoColors.systemGrey6,
                            fontWeight: FontWeight.normal,
                            wordSpacing: -5,
                          ),
                        ),
                        Text(
                          normaliseName(
                              '${forecastList[0].weather![0].description}'),
                          style: const TextStyle(
                            fontSize: 11,
                            fontStyle: FontStyle.italic,
                            fontFamily: 'Lato',
                            height: 2,
                            color: CupertinoColors.systemGrey5,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          const Divider(
            color: Colors.transparent,
            height: 25,
            thickness: 0,
          ),
          const Divider(
            color: CupertinoColors.systemOrange,
            height: 20,
            thickness: 1.5,
            indent: 20,
            endIndent: 20,
          ),
          Container(
            color: Colors.transparent,
            height: 32,
            alignment: Alignment.center,
            width: null,
          ),
          ExtraWeather(snapshot: snapshot),
        ],
      ),
    );
  }
}
