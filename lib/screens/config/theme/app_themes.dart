import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_netflix_ui_redesign/routes.dart';

enum AppTheme {
  BlackDefault,
  BlackDark,
  GreenDark,
  RedDark,
  BlueDark,
  BlueLight,
  GreenLight,
}

final appThemeData = {
  AppTheme.BlackDefault: ThemeData(
    brightness: Brightness.dark,
    primaryColor: HexColor('#212121'),

  ),
  AppTheme.BlackDark: ThemeData(
    brightness: Brightness.dark,
    primaryColor: HexColor('#000000'),

  ),
  AppTheme.GreenDark: ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.green[700],
  ),
  AppTheme.GreenLight: ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.green,
  ),
  AppTheme.BlueLight: ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.blue,
  ),
  AppTheme.BlueDark: ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.blue[700],
  ),
  AppTheme.RedDark: ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.red[700],
  ),
};