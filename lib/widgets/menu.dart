import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_netflix_ui_redesign/screens/animes_screen.dart';
import 'package:flutter_netflix_ui_redesign/screens/home_screen.dart';

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
                onTap: () =>{
                  showDialog(
                      context: context,
                      builder: (context){
                        return AlertDialog(
                            title: Text("Adicionar uma nova conta..."));})},
                child: CircleAvatar(
                  child: Icon(Icons.add),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 20),
          ),
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
          ListTile(
            leading: Icon(Icons.add),
            title: Text('Categorias'),
          ),
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
              title: Text("Report"),
            ),
          ),
          ),
          Expanded(child: Align(
            alignment: FractionalOffset.bottomCenter,
            child: ListTile(
              leading: Icon(Icons.settings),
              title: Text('Configurações'),
            ),
          ),
          ),
        ],
      ),
    );
  }
}
