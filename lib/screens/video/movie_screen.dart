import 'package:flutter/material.dart';
import 'package:flutter_netflix_ui_redesign/request/Animes.dart';
import 'package:flutter_netflix_ui_redesign/screens/movie/circular_clipper.dart';
import 'package:flutter_netflix_ui_redesign/routes.dart';
import 'package:share/share.dart';
import '../player/video.dart';

//import 'package:android_intent/android_intent.dart';

class Cat{
  static categoria(List categoria, int tamanho)  {
    if(tamanho == 1){
      return categoria[0];
    }
    if(tamanho == 0){
      return categoria[0];
    }

}
}

class Videoscreen extends StatefulWidget {
  final ListAnime movie;

  Videoscreen({this.movie});

  @override
  _VideoscreenState createState() => _VideoscreenState();
}

class _VideoscreenState extends State<Videoscreen> {

  @override
  Widget build(BuildContext context) {
    String categoria;

    categoria = widget.movie.category.replaceAll('5de1d75c43c6f33cf8f9331f', 'Ação').replaceAll('5de1d7a943c6f33cf8f93320', 'Aventura').replaceAll('5de1d7b143c6f33cf8f93321', 'Fantasia').replaceAll('5de1d7b743c6f33cf8f93322', 'Game').replaceAll('5de1d7c643c6f33cf8f93323', 'Romance');
    categoria = categoria.replaceAll('|', ',  ');

    return Scaffold(
      backgroundColor: HexColor('#212121'),
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                transform: Matrix4.translationValues(0.0, -50.0, 0.0),
                child: Hero(
                  tag: widget.movie.url,
                  child: ClipShadowPath(
                    clipper: CircularClipper(),
                    shadow: Shadow(blurRadius: 20.0),
                    child: Image(
                      height: 400.0,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      image: NetworkImage(widget.movie.url),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    padding: EdgeInsets.only(left: 30.0),
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.arrow_back),
                    iconSize: 30.0,
                    color: Colors.red,
                  ),
                  Image(
                    image: AssetImage('assets/images/netflix_logo.png'),
                    height: 60.0,
                    width: 150.0,
                  ),
                  IconButton(
                    padding: EdgeInsets.only(left: 30.0),
                    icon: Icon(Icons.favorite),
                    iconSize: 30.0,
                    color: Colors.red,
                    onPressed: () =>
                    {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VideoApp(),
                        ),
                      ),

                    },

                  ),
                ],
              ),
              Positioned.fill(
                bottom: 10.0,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: RawMaterialButton(
                    padding: EdgeInsets.all(10.0),
                    elevation: 12.0,
                    onPressed: () =>
                    {



                    },
                    shape: CircleBorder(),
                    fillColor: Colors.black,
                    child: Icon(
                      Icons.play_arrow,
                      size: 60.0,
                      color: Colors.redAccent,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0.0,
                left: 20.0,
                child: IconButton(
                  onPressed: () =>
                  {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Routes.suporteAnimeScreenR(widget.movie),
                      ),
                    ),
                  },
                  icon: Icon(Icons.assistant_photo),
                  iconSize: 35.0,
                  color: Colors.white,
                ),
              ),
              Positioned(
                bottom: 0.0,
                right: 25.0,
                child: IconButton(
                  onPressed: () => Share.share('check out my website https://example.com'),
                  icon: Icon(Icons.share),
                  iconSize: 35.0,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  widget.movie.title.toUpperCase(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 2.0),
                Text(
                  widget.movie.englishTitle.toUpperCase(),
                  style: TextStyle(
                    color: Colors.white.withOpacity(.6),
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  categoria+ '.',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(height: 12.0),
                Row(

                  children: <Widget>[
                    SizedBox(width: 80.0),
                    Icon(Icons.star, color: Colors.white,),
                    Icon(Icons.star, color: Colors.white,),
                    Icon(Icons.star, color: Colors.white,),
                    Icon(Icons.star_half, color: Colors.white,),
                    Icon(Icons.star_border, color: Colors.white,),
                  ],
                ),


                SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text(
                          'Ano',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 16.0,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          widget.movie.air.substring(0,4),
                          style: TextStyle(
                            color: Colors.white54,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          'Episodeos',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 16.0,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          widget.movie.episodes.toString(),
                          style: TextStyle(
                            color: Colors.white54,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          'Temporadas',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 16.0,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          widget.movie.seasons.toString(),
                          style: TextStyle(
                            color: Colors.white54,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 25.0),
                Container(
                  //height: 120.0,
                  child: SingleChildScrollView(
                    child: Text(
                      widget.movie.synopse,
                      style: TextStyle(
                        color: Colors.white70,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
//          ContentScroll(
//            images: widget.movie.url,
//            title: 'Screenshots',
//            imageHeight: 200.0,
//            imageWidth: 250.0,
//          ),
        ],
      ),
    );
  }
}
