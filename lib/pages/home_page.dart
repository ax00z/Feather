import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Feather/api/weather_api.dart';
import 'package:Feather/models/weather_forecast_daily.dart';
import 'package:Feather/pages/search_page.dart';
import 'package:Feather/widgets/bottom_list.dart';
import 'package:Feather/widgets/current_weather.dart';

class HomePage extends StatefulWidget {
  final WeatherForecast? locationWeather;

  const HomePage({Key? key, required this.locationWeather}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<WeatherForecast> weatherObj;
  late String _cityName;

  @override
  void initState() {
    super.initState();
    if (widget.locationWeather != null) {
      weatherObj = Future.value(widget.locationWeather);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.black87,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: CupertinoColors.darkBackgroundGray,
        elevation: 10,
        foregroundColor: const Color(0x1B000000),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  weatherObj = WeatherApi().fetchWeatherForecast();
                });
              },
              child: const Icon(
                CupertinoIcons.location_circle,
                color: CupertinoColors.tertiarySystemBackground,
                size: 32,
              ),
            ),
            GestureDetector(
              child: const Icon(
                CupertinoIcons.search_circle,
                color: CupertinoColors.tertiarySystemBackground,
                size: 32,
              ),
              onTap: () async {
                var tappedName = await Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                  return const SearchPage();
                }));
                if (tappedName != null) {
                  setState(() {
                    _cityName = tappedName;
                    weatherObj = WeatherApi().fetchWeatherForecast(
                      cityName: _cityName,
                      isCity: true,
                    );
                  });
                }
              },
            )
          ],
        ),
      ),
      body: ListView(
        children: [
          FutureBuilder<WeatherForecast>(
            future: weatherObj,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    CurrentWeather(snapshot: snapshot),
                    ButtomListView(snapshot: snapshot),
                  ],
                );
              } else {
                return const Center(
                    child: Text(
                  '\n\n City not found \n\n Please enter correct city',
                  style: TextStyle(
                      fontSize: 23, color: CupertinoColors.systemGrey5),
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.ltr,
                ));
              }
            },
          ),
        ],
      ),
    );
  }
}
