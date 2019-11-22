import 'package:flutter/material.dart';
import 'package:flutter_netflix_ui_redesign/widgets/menu.dart';



class config extends StatefulWidget {
  @override

_config createState() => _config();

}

class _config extends State<config> {

  bool _value1 = false;
  bool _value2 = false;

  void _onChanged1(bool value) => setState(() => _value1 = value);
  void _onChanged2(bool value) => setState(() => _value2 = value);

  bool _value3 = false;
  bool _value4 = false;

  void _onChanged3(bool value) => setState(() => _value3 = value);
  void _onChanged4(bool value) => setState(() => _value4 = value);


  @override
  Widget build(BuildContext context) {
    int _currValue = 1;
    return Scaffold(
      drawer: new MenuWidget(page: 'Config'),
      appBar: AppBar(
        title: Text('Preferences Demo'),
      ),
      body: Column(
        children: <Widget>[
          Padding(padding: EdgeInsets.all(5.0),),
          Container(
            child: Align(
              alignment: Alignment.centerLeft,
              child:Text(

                '  Escolha seu tema:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              )
            ),
          ),
          Container(
            child: ListTile(
              title: const Text('Escuro'),
              leading: Radio(
                activeColor: Colors.blue,
                groupValue: _currValue,
                onChanged: (int i) => setState(() => _currValue = i),
                value: 1,
              ),
            ),
          ),
          Container(
            child: ListTile(
              title: const Text('Claro'),
              leading: Radio(
                groupValue: _currValue,
                onChanged: (int i) => setState(() => _currValue = i),
                value: 2,
              ),
            ),
          ),
          Divider(),

          Container(
            child: Align(
                alignment: Alignment.centerLeft,
                child:Text(
                  '  Notificações:',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                )
            ),
          ),
          //new Switch(value: _value1, onChanged: _onChanged1),
          SwitchListTile(
            value: _value4,
            onChanged: _onChanged4,
            title: Text(
                'Ativar/Desativar',
            ),
          ),
          SwitchListTile(
            value: _value2,
            onChanged: _onChanged2,
            title: Text(
              'Alerta de animes',
            ),
          ),
          SwitchListTile(
            value: _value2,
            onChanged: _onChanged2,
            title: Text(
              'Alerta de mensagens',
            ),
          ),
          Divider(),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: FlatButton(
                onPressed: () {},
                child: Text("Sair",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 16,
                  ),
                ),
              )
          ),),
        ],
      ),
    );
  }
}
