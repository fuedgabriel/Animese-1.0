//import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_netflix_ui_redesign/request/Animes.dart';
import 'package:flutter_netflix_ui_redesign/routes.dart';
import '../../../screens/video/movie_screen.dart';

class ContentScroll extends StatelessWidget {
  final List<ListAnime> images;
  final String title;
  final double imageHeight;
  final double imageWidth;

  ContentScroll({
    this.images,
    this.title,
    this.imageHeight,
    this.imageWidth,
  });


  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              GestureDetector(
                onTap: () => print('View $title'),
                child: Icon(
                  Icons.arrow_forward,
                  size: 30.0,
                ),
              ),
            ],
          ),
        ),


        Container(
          height: imageHeight,
          width: double.infinity,
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            scrollDirection: Axis.horizontal,
            itemCount: images.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                width: 340,
                child:  Card(
                    elevation: 5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: 10.0,
                            vertical: 20.0,
                          ),
                          width: imageWidth,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                color: HexColor('#2b2a2a'),
                                offset: Offset(0.0, 4.0),
                                blurRadius: 9.0,
                              ),
                            ],
                          ),
                          child: GestureDetector(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => Videoscreen(movie: images[index]),
                              ),
                            ),
                            child:
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.network(
                                images[index].url,
                                fit: BoxFit.cover,
                              ),
                            ),

                          ),
                        ),
                        Container(
                          height: 200,
                          width: 160,
                          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: ListView(
                            children: <Widget>[
                              Text(
                                images[index].title,
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              Opacity(
                                opacity: 0.8,
                                child:
                                Text(
                                  'Episódios: '+images[index].episodes.toString(),
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Stack(
                                children: <Widget>[
                                  Opacity(
                                    opacity: 0.8,
                                    child: Text(
                                      images[index].synopse,
                                      style: TextStyle(
                                          fontSize: 13
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        )

                      ],
                    )
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}


class ContentScrollFavorite extends StatelessWidget {
  final List<ListAnime> images;
  final String title;
  final double imageHeight;
  final double imageWidth;

  ContentScrollFavorite({
    this.images,
    this.title,
    this.imageHeight,
    this.imageWidth,
  });


  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed('/Favoritos');

                },
                child: Icon(
                  Icons.arrow_forward,
                  size: 30.0,
                ),
              ),
            ],
          ),
        ),


        Container(
          height: imageHeight,
          width: double.infinity,
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            scrollDirection: Axis.horizontal,
            itemCount: images.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                child:  Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 20.0,
                  ),
                  width: imageWidth,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: HexColor('#2b2a2a'),
                        offset: Offset(0.0, 4.0),
                        blurRadius: 9.0,
                      ),
                    ],
                  ),
                  child: GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => Videoscreen(movie: images[index]),
                      ),
                    ),
                    child:
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.network(
                        images[index].url,
                        fit: BoxFit.cover,
                      ),
                    ),

                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

