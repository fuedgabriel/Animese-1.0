//widget
import '../../widgets/menu.dart';
import 'package:flutter/material.dart';
import 'widgets/content_scroll_list.dart';

//json
import 'dart:convert';

//request

import 'package:animese/request/Animes.dart';
import 'package:animese/request/request.dart';






class AnimesScreen extends StatefulWidget {
  @override

  _AnimesScreenState createState() => _AnimesScreenState();
}


class _AnimesScreenState extends State<AnimesScreen> {
  var list = new List<ListAnime>();



  _getAnime(){
    API.getAnimes('').then((response){
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
      drawer: MenuWidget(page: 'Lista',),
      appBar: AppBar(
        elevation: 0,
        title: Text("Lista"),
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
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          ContentScroll(images: list,),
        ],
      )

    );
  }
}
