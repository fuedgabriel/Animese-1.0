
import 'widgets/content_scroll_list.dart';
import 'package:flutter/material.dart';
import '../../routes.dart';
import 'package:flutter_netflix_ui_redesign/screens/movie/models/movie_model.dart';





class AnimesScreen extends StatefulWidget {
  @override

  _AnimesScreenState createState() => _AnimesScreenState();
}

class _AnimesScreenState extends State<AnimesScreen> {
  @override


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Routes.Menu('Lista'),
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
              child: Center(child: Text("2900")
              ),
            ),
          )
        ],
      ),
      body: Container(
        //padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
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
              ContentScroll(
                images: popular,
                title: "Minha lista",
                imageHeight: 250.0,
                imageWidth: 150.0,
              ),
          ],
        ),
      ),
    );
  }
}
