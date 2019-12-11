import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_netflix_ui_redesign/routes.dart';

enum AppTheme {
  Original,
  Preto_Tema__Escuro,
  Verde_Tema__Escuro,
  Vermelho_Tema__Escuro,
  Azul_Tema__Escuro,
  Azul_Tema__Claro,
  Verde_Tema__Claro,
}

final appThemeData = {
  AppTheme.Original: ThemeData(
    brightness: Brightness.dark,
    primaryColor: HexColor('#212121'),

  ),
  AppTheme.Preto_Tema__Escuro: ThemeData(
    brightness: Brightness.dark,
    primaryColor: HexColor('#000000'),

  ),
  AppTheme.Verde_Tema__Escuro: ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.green[700],
  ),
  AppTheme.Verde_Tema__Claro: ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.green,
  ),
  AppTheme.Azul_Tema__Claro: ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.blue,
  ),
  AppTheme.Azul_Tema__Escuro: ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.blue[700],
  ),
  AppTheme.Vermelho_Tema__Escuro: ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.red[700],
  ),
};