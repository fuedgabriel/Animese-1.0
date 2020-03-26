import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


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
  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return new Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            currentAccountPicture: Image.asset('src/image/logo.png'),
          ),
          ListTile(
              leading: Icon(Icons.home),
              title: Text('Início'),
              onTap: () {
                if (widget.page == 'Home') {
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
              title: Text('Sala de aula'),
              onTap: ()  {
                if (widget.page == 'Room') {
                  Navigator.pop(context);
                }
                else{
                  if(widget.page == 'Home'){
                    Navigator.pop(context);
                    Navigator.of(context).pushNamed('/Room');
                  }
                  else{
                    Navigator.pop(context);
                    Navigator.of(context).pushReplacementNamed('/Room');
                  }
                }
              }
          ),
          Divider(),

          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('PErguntas'),
            onTap: () {
              if (widget.page == 'Questions') {
                Navigator.pop(context);
              }
              else{
                if(widget.page == 'Inicio'){
                  Navigator.pop(context);
                  Navigator.of(context).pushNamed('/Favoritos');
                }
                else{
                  Navigator.pop(context);
                  Navigator.of(context).pushReplacementNamed('/Questions');
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



