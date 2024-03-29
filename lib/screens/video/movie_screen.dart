//widget
import 'package:animese/request/request.dart';
import 'package:video_box/video_box.dart';

import 'circular_clipper.dart';
import 'package:flutter/material.dart';

//request
import 'package:animese/request/Animes.dart';
import 'package:animese/request/Videos.dart';
//rotas
import 'package:animese/screens/suporte_anime/suporteAnime.dart';
import '../player/player.dart';

//biblioteca
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

//import 'package:share/share.dart';



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

// ignore: must_be_immutable
class Videoscreen extends StatefulWidget {
  final ListAnime movie;
  var icon = Icons.favorite;




  Videoscreen({this.movie});

  @override
  _VideoscreenState createState() => _VideoscreenState();
}

class _VideoscreenState extends State<Videoscreen> {


  IconData _obscureText = Icons.favorite_border;
  IconData __obscureText = Icons.favorite;

  String score = '';

  _VideoscreenState(){
    _estadoFavorito();
  }





  void _favorite() {
    setState(() {
      if(_obscureText == Icons.favorite_border){
        _obscureText = __obscureText;
        _saveFavoritos();
      }
      else{
        _obscureText = Icons.favorite_border;
        _removeFavoritos();
      }

    });
  }

  _estadoFavorito()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favoritos = prefs.getStringList('favoritos');
    if(favoritos == null){
      favoritos = [];
    }
    if(favoritos.contains(widget.movie.sId)== true) {
      setState(() {
        _obscureText = __obscureText;
      });
    }
  }


  var list = new List<ListAnime>();
  _removeFavoritos() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favoritos = prefs.getStringList('favoritos');
    favoritos.remove(widget.movie.sId.toString());
    prefs.setStringList('favoritos', favoritos);
  }

  _saveFavoritos() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favoritos = prefs.getStringList('favoritos');
    if(favoritos == null){ favoritos = [];}
    favoritos.add(widget.movie.sId.toString());
    prefs.setStringList('favoritos', favoritos);
  }

  _score(){
    setState(() {
      score = widget.movie.score.toString();
    });
  }


  @override
  Widget build(BuildContext context) {
    _score();
    String categoria;



    categoria = widget.movie.category.replaceAll('5de1d75c43c6f33cf8f9331f', 'Ação').replaceAll('5de1d7a943c6f33cf8f93320', 'Aventura').replaceAll('5de1d7b143c6f33cf8f93321', 'Fantasia').replaceAll('5de1d7b743c6f33cf8f93322', 'Game').replaceAll('5de1d7c643c6f33cf8f93323', 'Romance');
    categoria = categoria.replaceAll('|', ',  ');

    return Scaffold(

//      backgroundColor: HexColor('#212121'),
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
                    image: AssetImage('assets/animese/name.png'),
                    height: 60.0,
                    width: 150.0,
                  ),
                  IconButton(
                    padding: EdgeInsets.only(left: 30.0),
                    icon: Icon(_obscureText),
                    iconSize: 30.0,
                    color: Colors.red,
                    onPressed: ()
                    {
                      _favorite();

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
                    onPressed: ()
                    {
                      API.getVideos(widget.movie.sId).then((response){
                        List<ListVideo> video;
                        Iterable lista = json.decode(response.body);
                        video = lista.map((model) => ListVideo.fromJson(model)).toList();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PipPage(movie: widget.movie,videos: video, ),
                          ),
                        );
                    });
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
                        builder: (context) => SuporteAnime(movieA: widget.movie,),
                      ),
                    ),
                  },
                  icon: Icon(Icons.assistant_photo),
                  iconSize: 35.0,
//                  color: Colors.white,
                ),
              ),
              Positioned(
                bottom: 0.0,
                right: 25.0,
                child: IconButton(
                  onPressed: () {
                    showGeneralDialog(
                        barrierColor: Colors.black.withOpacity(0.5),
                        transitionBuilder: (context, a1, a2, widget) {
                          return Transform.scale(
                            scale: a1.value,
                            child: Opacity(
                              opacity: a1.value,
                              child: AlertDialog(
                                shape: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16.0)),
                                title: Text('Está função estará diponível em breve.',
                                  style: TextStyle(
                                    fontSize: 15.6,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        transitionDuration: Duration(milliseconds: 500),
                        barrierDismissible: true,
                        barrierLabel: '',
                        context: context,
                        pageBuilder: (context, animation1, animation2) {var a; return a; });
                    Future.delayed(const Duration(milliseconds: 1200), () {
                      Navigator.of(context).pop();
                    });
                  },
                  icon: Icon(Icons.share),
                  iconSize: 35.0,
                  color: Colors.black.withOpacity(0.5),
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
//                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 2.0),
                Text(
                  widget.movie.englishTitle.toUpperCase(),
                  style: TextStyle(
//                    color: Colors.white.withOpacity(.6),
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  categoria+ '.',
                  style: TextStyle(
//                    color: Colors.white70,
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(height: 12.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Nota: ',
                      style: TextStyle(fontSize: 16, fontWeight:FontWeight.w500),),
                    Text('$score',
                      style: TextStyle(fontSize: 16, fontWeight:FontWeight.w700 ),),
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
//                            color: Colors.white70,
                            fontSize: 16.0,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          widget.movie.air.substring(0,4),
                          style: TextStyle(
//                            color: Colors.white54,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          'Episódios',
                          style: TextStyle(
//                            color: Colors.white70,
                            fontSize: 16.0,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          widget.movie.episodes.toString(),
                          style: TextStyle(
//                            color: Colors.white54,
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
//                            color: Colors.white70,
                            fontSize: 16.0,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          widget.movie.seasons.toString(),
                          style: TextStyle(
//                            color: Colors.white54,
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
//                        color: Colors.white70,
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
