import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_netflix_ui_redesign/request/Animes.dart';
import '../video/movie_screen.dart';

// ignore: must_be_immutable
class ContentScroll extends StatelessWidget {
  final List<ListAnime> images;

  ContentScroll({
    this.images,

  });


  double heightC;
  double horizontal;
  double vertical;
  double heightRC;
  double widthRC;
  double heightCRC;
  double widthCRC;

  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    if(width > 530){
      if(width>= 650){
        heightC = 551;
        horizontal = 10.0;
        vertical = 5.0;
        heightRC = 170;
        widthRC = 120;
        heightCRC = 120;
        widthCRC = 178;


      }
      else if(width>=630){
        heightC = 551;
        horizontal = 10.0;
        vertical = 5.0;
        heightRC = 160;
        widthRC = 110;
        heightCRC = 120;
        widthCRC = 178;
      }
      else if(width>=593){
        heightC = 551;
        horizontal = 10.0;
        vertical = 5.0;
        heightRC = 140;
        widthRC = 90;
        heightCRC = 120;
        widthCRC = 178;
      }
      else if(width>=530){
        heightC = 551;
        horizontal = 10.0;
        vertical = 5.0;
        heightRC = 120;
        widthRC = 70;
        heightCRC = 100;
        widthCRC = 158;
      }
      return Container(
        height: heightC,
        alignment: Alignment.bottomLeft,
        child: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
                alignment: Alignment.bottomLeft,
                margin: EdgeInsets.symmetric(
                  horizontal: horizontal,
                  vertical: 5.0,
                ),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Card(
                      elevation: 5,
                      child: Row(
                        children: <Widget>[
                          GestureDetector(
                            onTap: () { Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => Videoscreen(movie: images[index]),
                              ),
                            );
                            },
                            child: Container(
                              height: heightRC,
                              width: widthRC,
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
                          ),
                          Container(
                            height: heightCRC,
                            width: widthCRC,
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
                                  opacity: 0.9,
                                  child: Text(
                                    'Ep:' + images[index].episodes.toString(),
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
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
                          GestureDetector(
                            onTap: () { Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => Videoscreen(movie: images[index+1]),
                              ),
                            );
                            },
                            child: Container(
                              height: heightRC,
                              width: widthRC,
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
                          ),
                          Container(
                            height: heightCRC,
                            width: widthCRC,
                            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: ListView(
                              children: <Widget>[
                                Text(
                                  images[index+1].title,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                Opacity(
                                  opacity: 0.9,
                                  child: Text(
                                    'Ep:' + images[index+1].episodes.toString(),
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
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
    else{
      if(width < 530 && width>=444){
        heightRC = 180;
        widthRC = 130;
      }
      else if(width <= 444 && width>=382){
        heightRC = 170;
        widthRC = 110;
      }
      else if(width <= 382 && width>=354){
        heightRC = 160;
        widthRC = 100;
      }
      else if(width <= 354 && width>=322){
        heightRC = 150;
        widthRC = 90;
      }
      else if(width <= 322 && width>=0){
        heightRC = 130;
        widthRC = 70;
      }
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
                          width: widthRC,
                          height: heightRC,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(images[index].url)
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(8.0)),
                            color: Colors.redAccent,
                          ),
                          child: GestureDetector(
                            onTap: () { Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => Videoscreen(movie: images[index]),
                              ),
                            );
                            },
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
                          width: widthRC,
                          height: heightRC,
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
                          width: widthRC,
                          height: heightRC,
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
