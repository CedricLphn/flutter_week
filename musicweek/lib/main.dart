import 'package:flutter/material.dart';
import 'package:musicweek/views/Date.dart';
import 'package:musicweek/views/age.dart';
import 'package:musicweek/views/aires.dart';
import 'package:musicweek/views/bytes_converter.dart';
import 'package:musicweek/views/distance.dart';
import 'package:musicweek/views/home.dart';
import 'package:musicweek/views/music.dart';
import 'package:musicweek/views/promotion.dart';
import 'package:musicweek/views/romain.dart';
import 'package:musicweek/views/temperature_converter.dart';

void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, routes: {
      '/': (context) => Home(),
      '/bytes_converter': (context) => BytesConvert(),
      '/age': (context) => Age(),
      '/temperature': (context) => TempApp(),
      '/date' : (context) => Date(),
      '/promotion' : (context) => Promotion(),
      '/distance': (context) => Distance(),
      '/aires' : (context) => Aires(),
      '/romain' : (context) => Romain(),
      '/music' : (context) => Music()
    });
  }
}
