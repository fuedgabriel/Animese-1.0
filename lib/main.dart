import 'package:flutter/material.dart';
import 'package:flutter_netflix_ui_redesign/screens/config/config.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      title: 'Flutter Netflix UI Redesign',
      debugShowCheckedModeBanner: false,
      home: config(),
    );
  }
}
