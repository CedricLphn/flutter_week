import 'package:flutter/material.dart';
import 'package:musicweek/Date.dart';
import 'package:musicweek/Age.dart';
import 'package:musicweek/aires.dart';
import 'package:musicweek/binaire.dart';
import 'package:musicweek/bytes_converter.dart';
import 'package:musicweek/distance.dart';
import 'package:musicweek/Home.dart';
import 'package:musicweek/music.dart';
import 'package:musicweek/promotion.dart';
import 'package:musicweek/romain.dart';
import 'package:musicweek/temperature_converter.dart';

void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
      primarySwatch: Colors.brown,
    ),
        routes: {
      '/': (context) => Home(),
      '/bytes_converter': (context) => BytesConvert(),
      '/age': (context) => Age(),
      '/binaire': (context) => Binaire(),
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
