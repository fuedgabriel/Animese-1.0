import 'package:flutter/material.dart';
import 'package:flutter_netflix_ui_redesign/widgets/menu.dart';

class Suporte extends StatefulWidget {
  @override
  _Suporte createState() => _Suporte();
}

class _Suporte extends State<Suporte> {
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
