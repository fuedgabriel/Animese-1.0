import 'package:flutter/material.dart';
import 'package:flutter_netflix_ui_redesign/screens/animes_list/animes_screen.dart';
import 'package:flutter_netflix_ui_redesign/screens/home_page/home_screen.dart';
import 'package:flutter_netflix_ui_redesign/screens/config/config.dart';
import 'package:flutter_netflix_ui_redesign/screens/suporte/suporte.dart';
import '../screens/login/LoginPage.dart';
import '../screens/player/video.dart';


class MenuWidget extends StatelessWidget{
  String page;

  MenuWidget({
    this.page
});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Drawer(
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountEmail: Text("souloiramesmo@hotmail.com"),
            accountName: Text("Loira"),
            currentAccountPicture: CircleAvatar(child: Text("oi"),),
            otherAccountsPictures: <Widget>[
              GestureDetector(
                onTap: () =>
                {
                  if (page == 'Login') {
                    Navigator.pop(context)
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ),
                    ),
                  },
                },
                child: CircleAvatar(
                  child: Icon(Icons.add),
                ),
              ),
            ],
          ),
//          Padding(
//            padding: EdgeInsets.only(top: 20),
//          ),
//          Divider(),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Inicio'),
            onTap: () => {
              if (page == 'Inicio') {
                Navigator.pop(context)
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ),
                ),
              },
            }
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.pageview),
            title: Text('Lista'),
              onTap: () => {
                if (page == 'Lista') {
                  Navigator.pop(context)
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AnimesScreen(),
                    ),
                  ),
                },
              }
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.add),
            title: Text('Categorias'),
            onTap: () => {
              if (page == 'Video') {
                Navigator.pop(context)
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VideoApp(),
                  ),
                ),
              },
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('Favoritos'),
            trailing: Chip(label: Text("11", style: TextStyle(
              fontWeight: FontWeight.bold,
              backgroundColor: Colors.blue[100],
            ),
            )
            ),
          ),
          Divider(),
          Expanded(child: Align(
            alignment: FractionalOffset.bottomCenter,
            child: ListTile(
              leading: Icon(Icons.report_problem),
              title: Text("Suporte"),
              onTap: () => {
                if (page == 'Suporte') {
                  Navigator.pop(context)
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => suporte(),
                    ),
                  ),
                },
              },
            ),
          ),
          ),
          Align(
            alignment: FractionalOffset.bottomCenter,
            child: ListTile(
              leading: Icon(Icons.settings),
              title: Text('Configurações'),
                onTap: () => {
                if (page == 'Config') {
                  Navigator.pop(context)
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => config(),
                    ),
                  ),
                },
                },
                ),
          ),
        ],
      ),
    );
  }
}
