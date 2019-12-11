import 'package:flutter/material.dart';
import '../../request/request.dart';
import '../../request/Videos.dart';
import 'dart:convert';
import '../../screens/video_native/pro.dart';

class Episodios extends StatefulWidget {
  final String id;
  final String title;

  Episodios({this.id, this.title});
  @override
  _EpisodiosState createState() => _EpisodiosState();
}

class _EpisodiosState extends State<Episodios> {
  var list = new List<Videos>();

  _getVideos(){
    API.getVideos().then((response){
      setState(() {
        Iterable lista = json.decode(response.body);
        list = lista.map((model) => Videos.fromJson(model)).toList();
      });
    });
  }

  _EpisodiosState(){
    _getVideos();
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
    appBar: AppBar(
    title: Text(widget.title),
    ),
    body: ListView(
        children: <Widget>[
          Lista(temporada: '01',link: list,)
        ]

    )
    );
  }
}

class Lista extends StatefulWidget {
  final String temporada;
  final List link;

  Lista({this.temporada, this.link});
  @override
  _ListaState createState() => _ListaState();
}

class _ListaState extends State<Lista> {
  var list = new List<Videos>();

  _getVideos(){
    API.getVideos().then((response){
      setState(() {
        Iterable lista = json.decode(response.body);
        list = lista.map((model) => Videos.fromJson(model)).toList();
      });
    });
  }

  _ListaState(){
    _getVideos();
  }



  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      leading: Icon(Icons.movie),
      title: Text('Temporada '+widget.temporada),
      children: <Widget>[
        Divider(),
        ListTile(title: Text('Ep 01'),
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Pro(title: list[0].title,ep: '01',link: list[0].url,)),
              );
          },),
        Divider(),
        ListTile(title: Text('Ep 02'),
          onTap: (){
          },),
        Divider(),
        ListTile(title: Text('Ep 03'),
          onTap: (){
          },),
        Divider(),
        ListTile(title: Text('Ep 04'),
          onTap: (){
          },),
        Divider(),
      ],
    );
  }
}
