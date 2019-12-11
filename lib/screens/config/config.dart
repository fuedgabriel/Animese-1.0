import 'package:flutter/material.dart';
import 'package:flutter_netflix_ui_redesign/widgets/menu.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'theme/app_themes.dart';
import 'theme/bloc/bloc.dart';
import '../../request/request.dart';


class Config extends StatefulWidget {

  @override
_Config createState() => _Config();
}

class _Config extends State<Config> {
  bool _notifications = true;
  bool _alertAnimes = true;
  bool _alertMenssages = true;

  Future _getConfig()async{
    Shared.getConfig(1, 0, 0).then((resp){
      setState(() {
        _notifications = resp;
      });
    });
    Shared.getConfig(0, 1, 0).then((resp){
      setState(() {
        _alertAnimes = resp;
      });
    });
    Shared.getConfig(0, 0, 1).then((resp){
      setState(() {
        _alertMenssages = resp;
      });
    });
  }
  void initState() {
    super.initState();
}
_Config(){
    _getConfig();
}


  save(String key, dynamic value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      drawer: new MenuWidget(page: 'Config'),
      appBar: AppBar(
        title: Text('Configurações'),
      ),
      body: ListView(
        children: <Widget>[
          Padding(padding: EdgeInsets.all(5.0),),
          Stack(
            children: <Widget>[
              Container(
                child: Align(
                    alignment: Alignment.centerLeft,
                    child:Text(
                      '  Escolha seu tema:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                ),
              ),
            ],
          ),
          Stack(
            children: <Widget>[
              Container(
//                width: 400,
                height: 275,
                child: ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.all(9),
                  itemCount: AppTheme.values.length,
                  itemBuilder: (context, index) {
                    final itemAppTheme = AppTheme.values[index];
                    return Card(
                      color: appThemeData[itemAppTheme].primaryColor,
                      child: ListTile(
                        title: Text(
                          itemAppTheme.toString().replaceAll('AppTheme.', '').replaceAll('__', ': ').replaceAll('_', ' '),
                          style: appThemeData[itemAppTheme].textTheme.body1,
                        ),
                        onTap: () async {
                          BlocProvider.of<ThemeBloc>(context).dispatch(
                            ThemeChanged(theme: itemAppTheme),
                          );
                          final prefs = await SharedPreferences.getInstance();
                          prefs.setString('Thema', itemAppTheme.toString());
                          print(itemAppTheme);

                        },
                      ),
                    );
                  },
                  scrollDirection: Axis.vertical,
                ),
              ),
            ],
          ),
          Divider(),
          Stack(
            children: <Widget>[
              Container(
                child: Align(
                    alignment: Alignment.centerLeft,
                    child:Text(
                      '  Notificações:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                ),
              ),
            ],
          ),
          Stack(
            children: <Widget>[
              //new Switch(value: _value1, onChanged: _onChanged1),
              SwitchListTile(
                value: _notifications,
                onChanged: (bool value) {
                  setState(() {
                    _notifications = value;
                  });
                  save('Notifications', value);
                },
                secondary: const Icon(Icons.notifications),
                title: Text(
                  'Ativar/Desativar',
                ),
              ),
            ],
          ),
          Stack(
            children: <Widget>[
              //new Switch(value: _value1, onChanged: _onChanged1),
              SwitchListTile(
                value: _alertAnimes,
                onChanged: (bool value) {
                  setState(() {
                    _alertAnimes = value;
                  });
                  save('AlertaAnimes', value);
                },
                secondary: const Icon(Icons.notifications),
                title: Text(
                  'Alerta de animes',
                ),
              ),
            ],
          ),
          Stack(
            children: <Widget>[
              SwitchListTile(
                value: _alertMenssages,
                onChanged: (bool value) {
                  setState(() {
                    _alertMenssages = value;
                  });
                  save('AlertaMessages', value);
                },
                secondary: const Icon(Icons.message),
                title: Text(
                  'Alerta de mensagens',
                ),
              ),
            ],
          ),
          Divider(),
          Align(
            alignment: Alignment.bottomCenter,
            child: FlatButton(
              onPressed: () async {
                final prefs = await SharedPreferences.getInstance();
                prefs.remove('Email');
                prefs.remove('Name');
                prefs.remove('Nick');
                prefs.remove('Password');
                prefs.remove('_id');
                prefs.remove('Notifications');
                prefs.remove('AlertaAnimes');
                prefs.remove('AlertaMessages');
//                print(_theme);
//                _nameRetriever();
              },
              child: Text("Sair",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      )
    );
  }
}



