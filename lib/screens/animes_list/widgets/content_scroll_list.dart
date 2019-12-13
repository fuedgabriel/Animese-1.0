import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_netflix_ui_redesign/request/Animes.dart';
import '../../video/movie_screen.dart';


class ContentScroll extends StatelessWidget {
  final List<ListAnime> images;

  ContentScroll({
    this.images,

  });


  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    if(width>600){
      return Container(
        height: 551,
        alignment: Alignment.bottomLeft,
        child: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
                alignment: Alignment.bottomLeft,
                margin: EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 5.0,
                ),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Card(
                      elevation: 5,
                      child: Row(
                        children: <Widget>[
                          Container(
                            height: 140,
                            width: 90,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(5),
                                  topLeft: Radius.circular(5)
                              ),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(images[index].url)
                              ),
                            ),
                          ),
                          Container(
                            height: 120,
                            width: 190,
                            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: ListView(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Text(
                                      images[index].title,
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      '  Ep: '+images[index].episodes.toString(),
                                      style: TextStyle(
                                        fontSize: 13,
                                      ),
                                    ),
                                  ],
                                ),
                                Stack(
                                  children: <Widget>[
                                    Opacity(
                                      opacity: 0.9,
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
                      ),
                    ),
                    Card(
                      elevation: 5,
                      child: Row(
                        children: <Widget>[
                          Container(
                            height: 140,
                            width: 90,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(5),
                                  topLeft: Radius.circular(5)
                              ),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(images[index+1].url)
                              ),
                            ),
                          ),
                          Container(
                            height: 120,
                            width: 190,
                            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: ListView(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Text(
                                      images[index+1].title,
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      '  Ep: '+images[index+1].episodes.toString(),
                                      style: TextStyle(
                                        fontSize: 13,
                                      ),
                                    ),
                                  ],
                                ),
                                Stack(
                                  children: <Widget>[
                                    Opacity(
                                      opacity: 0.9,
                                      child: Text(
                                        images[index+1].synopse,
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
                      ),
                    ),
                  ],
                )
            );
          },
        ),
      );
    }
//    else if(width <= 360){}
    else if(width == 360|| width>=300 || width<=430){
      return Container(
        height: 551,
        alignment: Alignment.bottomLeft,
        child: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
                alignment: Alignment.bottomLeft,
                margin: EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 5.0,
                ),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Container(
                          width: 100.0,
                          height: 150.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(images[index].url)
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(8.0)),
                            color: Colors.redAccent,
                          ),
                          child: GestureDetector(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => Videoscreen(movie: images[index]),
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.network(
                                images[index].url,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 5.0,
                          right: 5.0,
                          bottom: 5.0,
                          child: Container(
                            width: 250.0,
                            child: Text(
                              images[index].title.toUpperCase(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(margin: EdgeInsets.symmetric(horizontal: 3.0)),
                    Stack(
                      children: <Widget>[
                        Container(
                          width: 100.0,
                          height: 150.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(images[index+1].url)
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(8.0)),
                            color: Colors.redAccent,
                          ),
                          child: GestureDetector(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => Videoscreen(movie: images[index+1]),
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.network(
                                images[index+1].url,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 5.0,
                          right: 5.0,
                          bottom: 5.0,
                          child: Container(
                            width: 250.0,
                            child: Text(
                              images[index+1].title.toUpperCase(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(margin: EdgeInsets.symmetric(horizontal: 3.0)),
                    Stack(
                      children: <Widget>[
                        Container(
                          width: 100.0,
                          height: 150.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(images[index+2].url)
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(8.0)),
                            color: Colors.redAccent,
                          ),
                          child: GestureDetector(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => Videoscreen(movie: images[index+2]),
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.network(
                                images[index+2].url,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 5.0,
                          right: 5.0,
                          bottom: 5.0,
                          child: Container(
                            width: 250.0,
                            child: Text(
                              images[index+2].title.toUpperCase(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
            );
          },
        ),
      );
    }
  }
}
