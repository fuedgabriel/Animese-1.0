//widget

import 'package:animese/request/Videos.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//request
import 'package:animese/request/Animes.dart';

// ignore: must_be_immutable
class ContentScroll extends StatelessWidget {
  final List<ListVideo> images;
  final ListAnime movies;

  ContentScroll({this.images, this.movies});

  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Container(
      height: (height-170),
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: 5,
          // ignore: non_constant_identifier_names
          itemBuilder: (BuildContext, int conta) {
            return Stack(
              children: <Widget>[
                Container(
                  height: 90,
                  child: Card(
                    elevation: 5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 6),
                          child: GestureDetector(
                            child: Stack(
                              children: <Widget>[
                                Image(
                                  image: NetworkImage(
                                      'https://3.bp.blogspot.com/-2bwBfYvt0Rk/WDM-lfH574I/AAAAAAAABos/Jb4MauEsi8072H-4IOy5b4y9Joi_ia5_ACLcB/s1600/Untitled.png'),
                                  fit: BoxFit.contain,
                                  height: 128,
                                  width: 128,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 10, left: 5),
                                  child: Icon(
                                    Icons.play_circle_outline,
                                    size: 32,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            onTap: (){

                            },
                          )
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10, left: 5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Opacity(
                                  opacity: 0.8,
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 5),
                                    child: Text(
                                      'Episódio ' +
                                          images[0].episode.toString() +
                                          '   ',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          fontStyle: FontStyle.italic),
                                    ),
                                  )),
                              Opacity(
                                  opacity: 0.6,
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 5),
                                    child: Text(
                                      movies.air
                                          .toString()
                                          .replaceAll('T00:00:00.000Z', ''),
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          fontStyle: FontStyle.italic),
                                    ),
                                  )),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Container(
                              height: 20,
                              child: IconButton(
                                icon: Icon(Icons.file_download),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 20, left: 12),
                              child: Container(
                                height: 20,
                                child: IconButton(
                                  icon: Icon(Icons.screen_share),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            );
          }),
    );
  }
}
