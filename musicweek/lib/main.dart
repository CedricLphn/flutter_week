import 'package:flutter/material.dart';
import 'package:musicweek/views/Date.dart';
import 'package:musicweek/views/age.dart';
import 'package:musicweek/views/aires.dart';
import 'package:musicweek/views/distance.dart';
import 'package:musicweek/views/home.dart';
import 'package:musicweek/views/music.dart';
import 'package:musicweek/views/promotion.dart';
import 'package:musicweek/views/romain.dart';
import 'package:musicweek/views/temperature.dart';

void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, routes: {
      '/': (context) => Home(),
      '/age': (context) => Age(),
      '/date' : (context) => Date(),
      '/promotion' : (context) => Promotion(),
      '/distance': (context) => Distance(),
      '/aires' : (context) => Aires(),
      '/temperature' : (context) => Temperature(),
      '/romain' : (context) => Romain(),
      '/music' : (context) => Music()
    });
  }
}
