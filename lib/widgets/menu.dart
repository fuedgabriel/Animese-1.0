import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../request/request.dart';


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
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountEmail: Text(email),
            accountName: Text(nick),
            currentAccountPicture: GestureDetector(
              onTap: (){




              },
              child: CircleAvatar(
                child: Text(nome.toString().substring(0,0)),
              ),
            ),
            otherAccountsPictures: <Widget>[
              GestureDetector(
                onTap: () =>
                {
                  if(email == 'convidado'){
                    if (widget.page == 'Login') {
                      Navigator.pop(context),
                    }
                    else{
                      if(widget.page == 'Inicio'){
                        Navigator.pop(context),
                        Navigator.of(context).pushNamed('/Login'),

                      }
                      else{
                        Navigator.pop(context),
                        Navigator.of(context).pushReplacementNamed('/Login'),
                      }

                    }

                  }
                  else{
                    showGeneralDialog(
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

          ListTile(
              leading: Icon(Icons.home),
              title: Text('Inicio'),
              onTap: () {
                if (widget.page == 'Inicio') {
                  Navigator.pop(context);
                }
                else{
                  Navigator.of(context).pushNamedAndRemoveUntil('/Home', (Route<dynamic> route) => false);
                }
              }
          ),
          Divider(),

          ListTile(
              leading: Icon(Icons.pageview),
              title: Text('Lista'),
              onTap: ()  {
                if (widget.page == 'Lista') {
                  Navigator.pop(context);
                }
                else{
                  if(widget.page == 'Inicio'){
                    Navigator.pop(context);
                    Navigator.of(context).pushNamed('/Animes');
                  }
                  else{
                    Navigator.pop(context);
                    Navigator.of(context).pushReplacementNamed('/Animes');
                  }
                }
              }
          ),
          Divider(),

          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('Meus animes'),
            trailing: Chip(label: Text("11", style: TextStyle(
              fontWeight: FontWeight.bold,
//              backgroundColor: Colors.blue[100],
            ),
            ),
            ),
            onTap: () {
              if (widget.page == 'Favoritos') {
                Navigator.pop(context);
              }
              else{
                if(widget.page == 'Inicio'){
                  Navigator.pop(context);
                  Navigator.of(context).pushNamed('/Favoritos');
                }
                else{
                  Navigator.pop(context);
                  Navigator.of(context).pushReplacementNamed('/Favoritos');
                }
              }
            },
          ),
          Divider(),
          Align(
            alignment: FractionalOffset.bottomCenter,
            child: ListTile(
              leading: Icon(Icons.report_problem),
              title: Text("Suporte"),
              onTap: ()  {
                if (widget.page == 'Suporte') {
                  Navigator.pop(context);
                }
                else{
                  if(widget.page == 'Inicio'){
                    Navigator.pop(context);
                    Navigator.of(context).pushNamed('/Suporte');
                  }
                  else{
                    Navigator.pop(context);
                    Navigator.of(context).pushReplacementNamed('/Suporte');
                  }
                }
              },
            ),
          ),
          Divider(),
          Align(
            alignment: FractionalOffset.bottomCenter,
            child: ListTile(
              leading: Icon(Icons.settings),
              title: Text('Configurações'),
              onTap: ()
              {
                if (widget.page == 'Config') {
                  Navigator.pop(context);
                }
                else{
                  if(widget.page == 'Inicio'){
                    Navigator.pop(context);
                    Navigator.of(context).pushNamed('/Config');
                  }
                  else{
                    Navigator.pop(context);
                    Navigator.of(context).pushReplacementNamed('/Config');
                  }
                }
              },
            ),
          ),
          Divider(),
        ],
      ),
    );
  }
}



