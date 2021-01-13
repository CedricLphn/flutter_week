import 'package:flutter/material.dart';
import 'package:musicweek/views/age.dart';
import 'package:musicweek/views/home.dart';
import 'views/bytes_converter.dart';
import 'views/temperature_converter.dart';

void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, routes: {
      '/': (context) => Home(),
      '/age': (context) => Age(),
      '/temperature_converter': (context) => TempApp(),
      '/bytes_converter': (context) => BytesConvert()
    });
  }
}
