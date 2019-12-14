

import 'package:flutter/material.dart';
//woidget
import 'widgets.dart';
//rotas
import '../../routes.dart';
import 'package:flutter_netflix_ui_redesign/request/Animes.dart';
import 'package:flutter_netflix_ui_redesign/request/request.dart';
//biblioteca
import 'dart:convert';





class Favoritos extends StatefulWidget {
  @override

  _FavoritosState createState() => _FavoritosState();
}


class _FavoritosState extends State<Favoritos> {
  var list = new List<ListAnime>();



  _getAnime(){


    API.getAnimes().then((response){
      setState(() {
        Iterable lista = json.decode(response.body);
        list = lista.map((model) => ListAnime.fromJson(model)).toList();
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    _getAnime();
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
          ContentScroll(images: list,),
        ],
      ),
    );
  }
}
