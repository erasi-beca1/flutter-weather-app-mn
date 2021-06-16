import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_weather_mn/services/location.dart';
import 'package:flutter_weather_mn/services/weather.dart';
import 'package:flutter_weather_mn/theme/gradients.dart';
import 'package:flutter_weather_mn/views/weather/weather_error.dart';
import 'package:flutter_weather_mn/views/weather/weather_view.dart';

class LocationScreen extends StatelessWidget {
  final Location location;
  final Animation<double> controller;

  LocationScreen({
    this.location,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    Weather weather = location.getWeather();
      if (weather == null) {
        return ErrorView();
      } else {
        return LocationView(
          controller: controller,
          weather: weather,
        );
      }
    }
  }
