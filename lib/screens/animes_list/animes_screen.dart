
import 'widgets/content_scroll_list.dart';
import 'package:flutter/material.dart';
import '../../routes.dart';
import 'package:flutter_netflix_ui_redesign/screens/movie/models/movie_model.dart';
//import 'widgets/content_scroll_list.dart';




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
          padding: EdgeInsets.only(top: 10),
        child: ListView(
          children: <Widget>[
            ContentScroll(images: myList,),
            Container(
              alignment: Alignment.centerRight,
              child: ContentScroll(images: myList,),
            ),


          ],
        )
      ),
    );
  }
}
