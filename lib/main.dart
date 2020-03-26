import 'package:flutter/material.dart';
import 'screens/LoginPage.dart';
import 'screens/Home.dart';
import 'screens/Room.dart';
import 'screens/Lessons.dart';
import 'screens/Matter.dart';
import 'screens/questions/Questions.dart';
void main() => runApp(MyApp());
extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Imperium',
      theme: ThemeData(
        scaffoldBackgroundColor: HexColor.fromHex('#48006d'),
        primaryColor: HexColor.fromHex('#5a0089'),
        accentColor: Colors.deepPurpleAccent[600],
        backgroundColor: HexColor.fromHex('#5a0089'),
        fontFamily: 'Georgia',
        textTheme: TextTheme(
          headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          body1: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),
      ),
      routes: <String, WidgetBuilder>{
        '/LoginPage': (BuildContext context) => LoginPage(),
        '/Home': (BuildContext context) => Home(),
        '/Room': (BuildContext context) => Room(),
        '/Lessons': (BuildContext context) => Lessons(),
        '/Matter': (BuildContext context) => Matter(),
        '/Questions': (BuildContext context) => Questions(),
      },

      home: Home(),

    );
  }
}



