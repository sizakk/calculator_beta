import 'package:calculator_beta/screen/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      fontFamily: 'sunflower',
      textTheme: const TextTheme(
          headline1: TextStyle(
            color: Colors.white,
            fontFamily: 'sunflower',
            fontSize: 80,
          ),
          headline2: TextStyle(
            color: Colors.white,
            fontSize: 50.0,
            fontWeight: FontWeight.w700,
          ),
          bodyText1: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
          ),
          bodyText2: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
          )),
    ),
    home: const HomeScreen(),
  ));
}
