import 'package:flutter/material.dart';
import 'package:flutter_netflix_ui_redesign/screens/animes_list/animes_screen.dart';
import 'package:flutter_netflix_ui_redesign/screens/movie/models/movie_model.dart';
import 'package:flutter_netflix_ui_redesign/screens/movie/circular_clipper.dart';
import 'package:flutter_netflix_ui_redesign/screens/home_page/widgets/content_scroll.dart';
import 'package:flutter_netflix_ui_redesign/routes.dart';
import 'package:share/share.dart';


class MovieScreen extends StatefulWidget {
  final Movie movie;

  MovieScreen({this.movie});

  @override
  _MovieScreenState createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#212121'),
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                transform: Matrix4.translationValues(0.0, -50.0, 0.0),
                child: Hero(
                  tag: widget.movie.imageUrl,
                  child: ClipShadowPath(
                    clipper: CircularClipper(),
                    shadow: Shadow(blurRadius: 20.0),
                    child: Image(
                      height: 400.0,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      image: AssetImage(widget.movie.imageUrl),
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
                    onPressed: () => {

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
                    onPressed: () => print('Play Video'),
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
                        builder: (context) => Routes.SuporteAnimeScreenR(widget.movie),
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
                  onPressed: () => {
                    Share.share('https://example.com')
                  },
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
                SizedBox(height: 10.0),
                Text(
                  widget.movie.categories,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(height: 12.0),
                Row(

                  children: <Widget>[
                    SizedBox(width: 80.0),
                    Icon(Icons.star),
                    Icon(Icons.star),
                    Icon(Icons.star),
                    Icon(Icons.star_half),
                    Icon(Icons.star_border),
                  ],
                ),


                SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text(
                          'Year',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 16.0,
                          ),
                        ),
                        SizedBox(height: 2.0),
                        Text(
                          widget.movie.year.toString(),
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
                          'Country',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 16.0,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          widget.movie.country.toUpperCase(),
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
                          'Length',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 16.0,
                          ),
                        ),
                        SizedBox(height: 2.0),
                        Text(
                          '${widget.movie.length} min',
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
                      widget.movie.description,
                      style: TextStyle(
                        color: Colors.white70,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          ContentScroll(
            images: widget.movie.screenshots,
            title: 'Screenshots',
            imageHeight: 200.0,
            imageWidth: 250.0,
          ),
        ],
      ),
    );
  }
}
