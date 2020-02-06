import 'package:flutter/material.dart';
import 'package:animese/widgets/menu.dart';

class PremiumPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:  MenuWidget(page: 'Premium'),
      appBar: AppBar(
        title: Text('Configurações'),
      ),
      body: Container(child: Text('aaa'),),
    );
  }
}


