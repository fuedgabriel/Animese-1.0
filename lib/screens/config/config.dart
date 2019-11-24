import 'package:flutter/material.dart';
import 'package:flutter_netflix_ui_redesign/screens/home_page/home_screen.dart';
import 'package:flutter_netflix_ui_redesign/widgets/menu.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_netflix_ui_redesign/main.dart';


class config extends StatefulWidget {

  @override
_config createState() => _config();
}

class _config extends State<config> {
  void initState() {
    super.initState();
    restore();
}

  restore() async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    setState(() {
      _notifications = (sharedPrefs.getBool('notifications') ?? false);
      //TODO: More restoring of settings would go here...
    });
  }

  //Email address
  //String _email;
  //theme
  bool _theme = true;
  //Notifications actives
  bool _notifications = true;
  //Alert of the animes
  bool _alertAnimes = true;
  //Alert of the messages
  bool _alertMenssages = true;
  //dar theme enable

  _nameRetriever() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(){
      _theme = prefs.getBool('theme') ?? '';
    }

    print(_theme);
  }
  



  save(String key, dynamic value) async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    if (value is bool) {
      sharedPrefs.setBool(key, value);
    } else if (value is String) {
      sharedPrefs.setString(key, value);
    } else if (value is int) {
      sharedPrefs.setInt(key, value);
    } else if (value is double) {
      sharedPrefs.setDouble(key, value);
    } else if (value is List<String>) {
      sharedPrefs.setStringList(key, value);
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      drawer: new MenuWidget(page: 'Config'),
      appBar: AppBar(
        title: Text('Configurações'),
      ),
      body: Column(
        children: <Widget>[
          Padding(padding: EdgeInsets.all(5.0),),
          Container(
            child: Align(
              alignment: Alignment.centerLeft,
              child:Text(
                '  Tema:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.lightGreenAccent,
                ),
              )
            ),
          ),
          
          SwitchListTile(
            value: _theme,
            onChanged: (bool value) {
              setState(() {
                _theme = value;
              }
              );
              save('theme', value);

              },
            secondary: const Icon(Icons.swap_horiz),
            title: Text(
              'Escuro',
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
                    color: Colors.lightGreenAccent,
                  ),
                )
            ),
          ),
          //new Switch(value: _value1, onChanged: _onChanged1),
          SwitchListTile(
            value: _notifications,
            onChanged: (bool value) {
              setState(() {
                _notifications = value;
              });
              save('notifications', value);
              },
            secondary: const Icon(Icons.notifications),
            title: Text(
              'Ativar/Desativar',
            ),
          ),
          SwitchListTile(
            value: _alertAnimes,
            onChanged: (bool value) {
              setState(() {
                _alertAnimes = value;
              });
              save('alertAnimes', value);
            },
            secondary: const Icon(Icons.notifications),
            title: Text(
              'Alerta de animes',
            ),
          ),
          SwitchListTile(
            value: _alertMenssages,
            onChanged: (bool value) {
              setState(() {
                _alertMenssages = value;
              });
              save('alertMenssages', value);
            },
            secondary: const Icon(Icons.message),
            title: Text(
              'Alerta de mensagens',
            ),
          ),
          Divider(),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: FlatButton(
                onPressed: () {
                  print(_theme);

                  _nameRetriever();
                  },
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
