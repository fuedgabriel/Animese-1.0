import 'package:flutter/material.dart';
import 'package:flutter_netflix_ui_redesign/screens/config/config.dart';
import 'screens/config/theme/bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      home: config(),
    );
  }
}
