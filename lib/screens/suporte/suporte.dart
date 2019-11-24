import 'package:flutter/material.dart';
import 'package:flutter_netflix_ui_redesign/widgets/menu.dart';

class suporte extends StatefulWidget {
  @override
  _suporte createState() => _suporte();
}

class _suporte extends State<suporte> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: new MenuWidget(page: 'Suporte'),
      appBar: AppBar(
        title: Text('Suporte'),
      ),
    );
  }
}
