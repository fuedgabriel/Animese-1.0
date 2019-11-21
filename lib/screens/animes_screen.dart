

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_netflix_ui_redesign/models/movie_model.dart';
import 'package:flutter_netflix_ui_redesign/requetions/Animes.dart';
import 'package:flutter_netflix_ui_redesign/screens/home_screen.dart';
import '../routes.dart';

class AnimesScreen extends StatefulWidget {
  @override

  _AnimesScreenState createState() => _AnimesScreenState();
}

class _AnimesScreenState extends State<AnimesScreen> {
  @override


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[600],
      drawer: Routes.Menu('Lista'),
      appBar: AppBar(
        
        backgroundColor: Colors.transparent,
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
          padding: EdgeInsets.all(20.0),
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
                            fillColor: Colors.black.withOpacity(.2)
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10,),




            ],
          ),
        ),
      ),
    );
  }
}
