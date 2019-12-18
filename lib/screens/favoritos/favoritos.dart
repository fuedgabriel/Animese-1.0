


import 'package:flutter/material.dart';
import 'package:flutter_netflix_ui_redesign/screens/animes_list/gridViwer_play.dart';
import 'package:flutter_netflix_ui_redesign/screens/video/episodios.dart';
//woidget
import 'widgets.dart';
//rotas
import '../../routes.dart';
import 'package:flutter_netflix_ui_redesign/request/Animes.dart';
import 'package:flutter_netflix_ui_redesign/request/request.dart';
//biblioteca
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';




class Favoritos extends StatefulWidget {
  @override

  _FavoritosState createState() => _FavoritosState();
}


class _FavoritosState extends State<Favoritos> {
  var list = new List<ListAnime>();
  ListAnime lisa;

//  var user;
  List<ListAnime> user;
  var jsonData;
  int quantidade = 0;
  String id;
  String title;
  String english;
  String air;
  String synopse;
  String status;
  String category;


  get() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List animes = prefs.getStringList('lista');


    for(int i = 0;i<=animes.length; i++){
      if(i == animes.length-1){
        break;
      }


      API.getAnimes(animes[i]).then((response){
        setState(() {
          print(i);
          final json = jsonDecode(response.body);
          lisa = ListAnime.fromJson(json);
          list.add(lisa);
          print('Tamanho: '+list.length.toString());
//          list = json.map((model) => ListAnime.fromJson(model)).toList();
        });
      });
    }
  }







  _getAnime(){
    API.getAnimes('').then((response){
      setState(() {
        Iterable lista = json.decode(response.body);
        print(lista.toList());
        print('_________________________________');
        print(lista);

        list = lista.map((model) => ListAnime.fromJson(model)).toList();
      });
    });
  }

  _FavoritosState(){
    get();
  }


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      drawer: Routes.menu('Favoritos'),
      appBar: AppBar(
        elevation: 0,
        title: Text("Favoritos"),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Container(
              width: 36,
              height: 30,
              decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Center(child: Text(list.length.toString())
              ),
            ),
          )
        ],
      ),
      body: Stack(
        children: <Widget>[
          ContentScroll(images: list),
        ],
      ),
    );
  }
}
