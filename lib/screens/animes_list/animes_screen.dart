

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../routes.dart';
import 'package:flutter_netflix_ui_redesign/screens/animes_list/gridViwer_play.dart';

class AnimesScreen extends StatefulWidget {
  @override

  _AnimesScreenState createState() => _AnimesScreenState();
}

class _AnimesScreenState extends State<AnimesScreen> {
  @override


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('000000'),
      drawer: Routes.Menu('Lista'),
      appBar: AppBar(
        backgroundColor: HexColor('#212121'),
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

              child: Center(child: Text("2900")),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Container(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      //Text("Lifestyle Sale", style: TextStyle(color: Colors.white, fontSize: 35, fontWeight: FontWeight.bold),),
                      TextField(
                        decoration: new InputDecoration(
                            border: new OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(30.0),
                              ),
                            ),
                            filled: true,
                            hintStyle: new TextStyle(color: Colors.grey[500]),
                            hintText: "Digite o nome do anime...",
                            fillColor: Colors.white
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10,),
              AnimeList('oioi'),
            ],
          ),
        ),
      ),
    );
  }

}
