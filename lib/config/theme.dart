import 'package:flutter/material.dart';

ThemeData theme () {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'Avenir',
    textTheme: textTheme(),
  );
}

TextTheme textTheme(){
  return const TextTheme(
    displayLarge: TextStyle(color: Colors.black,
        fontSize: 24,
        fontFamily: 'Avenir',
        ),
    displayMedium:TextStyle(color: Colors.black,
        fontSize: 20,
        fontFamily: 'Avenir',
        ),
    displaySmall :TextStyle(color: Colors.black,
        fontSize: 16,
        fontFamily: 'Avenir',
        fontWeight: FontWeight.bold),
    bodyLarge:  TextStyle(color: Colors.black,
        fontSize: 12,
        fontFamily: 'Avenir',
        fontWeight: FontWeight.bold),
    bodySmall: TextStyle(color: Colors.black,
        fontSize: 10,
        fontFamily: 'Avenir',
        fontWeight: FontWeight.bold),
    );

}