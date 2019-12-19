
//widget
import 'package:flutter/material.dart';
//request
import 'package:flutter_netflix_ui_redesign/request/Animes.dart';
//rotas
import '../../video/movie_screen.dart';


// ignore: must_be_immutable
class ContentScroll extends StatelessWidget {
  final List<ListAnime> images;

  ContentScroll({
    this.images,
  });

  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    double heightRC;
    double widthRC;
    double widthCRC;
    if(width > 530){
      if(width>= 650){
        heightRC = 170;
        widthRC = 120;
        widthCRC = 178;
      }
      else if(width>=630){
        heightRC = 160;
        widthRC = 110;
        widthCRC = 178;
      }
      else if(width>=593){
        heightRC = 140;
        widthRC = 90;
        widthCRC = 178;
      }
      else if(width>=530){
        heightRC = 120;
        widthRC = 70;
        widthCRC = 158;
      }
      return Container(
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 5, childAspectRatio: 2.10, ),
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              elevation: 5,
              child: Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () { Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => Videoscreen(movie: images[index]),
                          ),
                        );
                        },
                        child: Image(
                          height: heightRC,
                          width: widthRC,
                          image: NetworkImage(images[index].url),
                          fit: BoxFit.fitWidth,
                          alignment: Alignment.topCenter,
                        ),
                      ),
                      Container(
                        height: heightRC,
                        width: widthCRC,
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 15),
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
                      ),
                    ],
                  )
              ),
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
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, mainAxisSpacing: 8, childAspectRatio: 0.9 ),
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          padding: EdgeInsets.only(left: 10, right: 10, top: 10,bottom: 10),
          itemBuilder: (BuildContext context, int index) {
            return Container(
//                alignment: Alignment.bottomLeft,
                margin: EdgeInsets.symmetric(
                  horizontal: 0.0,
                  vertical: 0.0,
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
                                fit: BoxFit.fill,
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
//                    Container(margin: EdgeInsets.symmetric(horizontal: 3.0, vertical: 3.0)),
                  ],
                )
            );
          },
        ),
      );
    }
  }
}
