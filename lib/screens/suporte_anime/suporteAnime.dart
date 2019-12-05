//import 'dart:html';
import 'package:flutter/material.dart';
import 'package:flutter_netflix_ui_redesign/request/Animes.dart';



class SuporteAnime extends StatefulWidget {
  ListAnime movieA;
  SuporteAnime({this.movieA});
  @override
  _SuporteAnime createState() => _SuporteAnime();

}

class _SuporteAnime extends State<SuporteAnime> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(

        title: Text('Suporte'),
      ),
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              ExpansionTile(
                leading: Icon(Icons.report_problem),
                title: Text('Selecione o motivo'),
                children: <Widget>[
                  ListTile(title: Text('Episódio inlegível')),
                  ListTile(title: Text('Faltando episódios')),
                  ListTile(title: Text('Conteudo sexual')),
                  ListTile(title: Text('Conteudo violento ou repulsivo')),
                  ListTile(title: Text('Descrição está errada')),
                  ListTile(title: Text('Categoria está errada')),
                ],
              ),
            ],
          ),
          Stack(
            children: <Widget>[
              ExpansionTile(
                leading: Icon(Icons.report_problem),
                title: Text('Selecione o episódio'),
                children: <Widget>[
                  ListTile(title: Text('')),
                  ListTile(title: Text('Title of the item2'),),
                ],
              ),
            ],
          ),
          Container(
            child: Padding(
              padding: EdgeInsets.only(left: 50.0, top: 20.0),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Envie uma mensagem mais detalhada',
                ),
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(left: 290.0, top: 300.0),
            child: IconButton(
              //padding: EdgeInsets.only(left: 300.0, top: 400.0),
              icon: Icon(Icons.send),
              iconSize: 30.0,
              onPressed: () =>{
                showDialog(
                    context: context,
                    builder: (context){
                      return AlertDialog(
                          title: Text("Reclamação enviada..."));})
              },
            ),
          ),

        ],
      )
    );
  }
}



//      body: Container(
//        child: Column(
//          children: <Widget>[
//            ListView(
//              shrinkWrap: true,
//              children: <Widget>[
//                ExpansionTile(
//
//                  leading: Icon(Icons.report_problem),
//                  title: Text('Selecione o motivo'),
//                  children: <Widget>[
//                    ListTile(title: Text('Episódio inlegível')),
//                    ListTile(title: Text('Faltando episódios')),
//                    ListTile(title: Text('Conteudo sexual')),
//                    ListTile(title: Text('Conteudo violento ou repulsivo')),
//                    ListTile(title: Text('Descrição está errada')),
//                    ListTile(title: Text('Categoria está errada')),
//                  ],
//                ),
//                ExpansionTile(
//                  title: Text('Test2'),
//                  children: <Widget>[
//                    ListTile(title: Text('Title of the item')),
//                    ListTile(
//                      title: Text('Title of the item2'),
//                    )
//                  ],
//                )
//              ],
//            ),
//            Divider(),
//            Padding(
//              padding: EdgeInsets.only(left: 300.0, top: 370.0),
//              child: IconButton(
//                //padding: EdgeInsets.only(left: 300.0, top: 400.0),
//                icon: Icon(Icons.send),
//                iconSize: 30.0,
//                onPressed: () =>
//                {
//                  print('teste')
//                },
//              ),
//            ),
////            Container(
////              height: 120.0,
////              child: SingleChildScrollView(
////                child: Text(
////                  widget.movieA.description,
////                  style: TextStyle(
////                    color: Colors.black54,
////                  ),
////                ),
////              ),
////            ),
//          ],
//        ),
//      ),

