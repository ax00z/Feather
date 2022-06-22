import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Feather/models/weather_forecast_daily.dart';
import 'package:Feather/utilities/forecast_util.dart';

class ButtomListView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;

  const ButtomListView({
    Key? key,
    required this.snapshot,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 1, top: 0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            '7 Day Weather',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: CupertinoColors.lightBackgroundGray,
            ),
          ),
          const SizedBox(
            height: 10,
            width: 10,
          ),
          Container(
            height: 110,
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 24),
            alignment: Alignment.center,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  alignment: Alignment.center,
                  width: 100,
                  height: 10,
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: CupertinoColors.tertiarySystemFill,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: forecastCard(snapshot, index),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(width: 10),
              itemCount: snapshot.data!.list!.length,
            ),
          )
        ],
      ),
    );
  }
}

Widget forecastCard(AsyncSnapshot snapshot, int index) {
  var forecastList = snapshot.data.list;
  var dayOfWeek = '';
  DateTime date =
      DateTime.fromMillisecondsSinceEpoch(forecastList[index].dt * 1000);
  var fullDate = Util.getFormattedDate(date);
  dayOfWeek = fullDate.split(',')[0]; // Tue
  var tempMin = forecastList[index].temp.min.toStringAsFixed(0);
  return Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(
        '$tempMin °C',
        style: const TextStyle(color: Colors.white, fontSize: 16),
      ),
      Image(
        image: AssetImage(
          Util.findIcon('${forecastList[index].weather![0].main}', false),
        ),
        width: 40,
        height: 40,
        fit: BoxFit.scaleDown,
      ),
      Text(
        dayOfWeek,
        style: const TextStyle(color: CupertinoColors.white, fontSize: 16),
      )
    ],
  );
}
