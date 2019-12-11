import 'package:flutter/material.dart';
import 'package:flutter_netflix_ui_redesign/screens/animes_list/animes_screen.dart';
import 'package:flutter_netflix_ui_redesign/screens/home_page/home_screen.dart';
import 'package:flutter_netflix_ui_redesign/screens/config/config.dart';
import 'package:flutter_netflix_ui_redesign/screens/suporte/suporte.dart';
import '../screens/login/LoginPage.dart';
import '../request/request.dart';

// text: isso tira um erro
// ignore: must_be_immutable
class MenuWidget extends StatefulWidget{
  String page;

  MenuWidget({
    this.page,
});

  @override
  _MenuWidgetState createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {

  var nome = '';
  var email = '';
  var nick = '';
  Future _getUser()async{
    Shared.getLogin(0, 1, 0, 0, 0).then((resp){
      setState(() {
        nome = resp;
      });
    });
    Shared.getLogin(0, 0, 1, 0, 0).then((resp){
      setState(() {
        nick = resp;
      });
    });
    Shared.getLogin(0, 0, 0, 1, 0).then((resp){
      setState(() {
        email = resp;
      });
    });
  }

  _MenuWidgetState(){
    _getUser();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Drawer(
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountEmail: Text(email),
            accountName: Text(nick),
            currentAccountPicture: CircleAvatar(child: Text(nome.toString().substring(0,0)),),
            otherAccountsPictures: <Widget>[
              GestureDetector(
                onTap: () =>
                {
                  if(email == 'convidado'){
                    if (widget.page == 'Login') {
                      Navigator.pop(context)
                    }
                    else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ),
                      ),
                    },
                  }
                  else{
                    showGeneralDialog(
                        barrierColor: Colors.black.withOpacity(0.5),
                        transitionBuilder: (context, a1, a2, widget) {
                          return Transform.scale(
                            scale: a1.value,
                            child: Opacity(
                              opacity: a1.value,
                              child: AlertDialog(
                                shape: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16.0)),
                                title: Text('Você já está logado',
                                  style: TextStyle(
                                    fontSize: 15.6,
                                  ),
                                ),
                              ),
                            ),
                          );
                          },
                        transitionDuration: Duration(milliseconds: 500),
                        barrierDismissible: true,
                        barrierLabel: '',
                        context: context,
                        pageBuilder: (context, animation1, animation2) {var a; return a;}),
                  }
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
              if (widget.page == 'Inicio') {
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
                if (widget.page == 'Lista') {
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
                if (widget.page == 'Suporte') {
                  Navigator.pop(context)
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Suporte(),
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
                if (widget.page == 'Config') {
                  Navigator.pop(context)
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Config(),
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



