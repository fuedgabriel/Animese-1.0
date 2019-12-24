//widget
import 'package:flutter/material.dart';
import 'widgets/content_scroll_list.dart';



//request

import 'package:animese/request/Animes.dart';






class Screen extends StatefulWidget {
  var list = new List<ListAnime>();
  String title;
  Screen(this.list, this.title);

  @override
  _ScreenState createState() => _ScreenState();
}


class _ScreenState extends State<Screen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(widget.title),
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
                child: Center(child: Text(widget.list.length.toString())
                ),
              ),
            ),
          ],
        ),
        body: Stack(
          children: <Widget>[
            ContentScroll(images: widget.list,),
          ],
        )

    );
  }
}
