import 'package:flutter/material.dart';
import 'package:flutter_netflix_ui_redesign/routes.dart';


class AnimeList extends StatelessWidget {
  //final List<String> images;
//  final String title;
  final String link;


  AnimeList(String s,
      {
    //this.images,
//    this.title,
    this.link,
      }
  );


  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
        height: 280,
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[Container(
                height: 200,
                width: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    border: new Border.all(
                        color: Colors.white.withOpacity(0.8),
                        width: 8.0,
                        style: BorderStyle.solid
                    ),

                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage('https://img.elo7.com.br/product/zoom/1F2E1D8/big-poster-anime-tokyo-ghoul-tamanho-90x-0-cm-lo10-tokyo-ghoul.jpg'),
                    ),
//                                  color: Colors.black.withOpacity(.8),
                    boxShadow: [
                      new BoxShadow(
                        color: Colors.white.withOpacity(0.8),
                        offset: new Offset(0.0, 20.0),
                      )
                    ]
                ),
              ),
                Text('Tojyo hgoul',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black.withOpacity(.8),
                  ),
                  textAlign: TextAlign.center,
                )

              ],
            )
          ],
        ),
      ),
      ],
    );
  }
}
