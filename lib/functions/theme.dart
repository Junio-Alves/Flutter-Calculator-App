import 'package:calculadora/pages/homepage.dart';
import 'package:flutter/material.dart';

Color? backgroundColor;
Color? scaffoldColor;
Color? textColor;
Color? functionButtonColor;
Color? borderColor;
Color? historyColor;

switchTheme(String? theme) {
  //Tema branco
  if (theme == 'white') {
    darktheme = false;
    backgroundColor = const Color.fromARGB(255, 201, 201, 201);
    scaffoldColor = Colors.white;
    textColor = Colors.black;
    functionButtonColor = Colors.blue;
    borderColor = Colors.blue;
    historyColor = Colors.black.withOpacity(0.6);
  }
  //tema dark
  else if (theme == 'dark') {
    darktheme = true;
    backgroundColor = const Color.fromARGB(255, 30, 34, 70);
    scaffoldColor = const Color.fromARGB(255, 48, 54, 116);
    textColor = Colors.white;
    functionButtonColor = Colors.amber;
    borderColor = Colors.amber;
    historyColor = Colors.white.withOpacity(0.3);
  }
}
