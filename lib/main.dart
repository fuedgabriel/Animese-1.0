

import 'screens/home_page/home_screen.dart';
import 'package:flutter/material.dart';
import 'screens/config/theme/bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'screens/config/config.dart';
import 'screens/login/LoginPage.dart';
import 'screens/animes_list/animes_screen.dart';
import 'screens/suporte/suporte.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      builder: (context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: _buildWithTheme,
      ),
    );
  }

  Widget _buildWithTheme(BuildContext context, ThemeState state) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      theme: state.themeData,
      routes: <String, WidgetBuilder>{
        '/Config': (BuildContext context) => Config(),
        '/Home': (BuildContext context) => HomeScreen(),
        '/Suporte': (BuildContext context) => Suporte(),
        '/Login': (BuildContext context) => LoginPage(),
        '/Animes': (BuildContext context) => AnimesScreen(),
      },
      home: HomeScreen(),
    );
  }
}
