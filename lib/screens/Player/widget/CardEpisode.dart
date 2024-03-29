//widget
import 'package:flutter/material.dart';
//request
import 'package:animese/request/Request.dart';
import 'package:animese/request/JSON/Episode/Episode.dart';
import 'package:animese/request/JSON/Episode/Player.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
//Player
import 'package:video_box/video.controller.dart';
import 'package:video_player/video_player.dart';
//Download



// ignore: must_be_immutable
class CardPlayer  extends StatelessWidget{
  final int ep;
  final int epState;
  final int id;
  VideoController vc;
  final String lanuage;
  Sink<String> titleSink;
  String nome;


  CardPlayer({
    this.ep,
    this.epState,
    this.id,
    this.vc,
    this.lanuage,
    this.titleSink,
    this.nome
  });
  
  Color cardColor;
  IconData visibility;

  _saveViews(ep) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(id.toString(), ep);
  }

  _launchURL(bool validador, int episode) async {
    if(episode >= 100){
      nome = nome.replaceRange(nome.length-5, nome.length, '   ') + episode.toString();
      titleSink.add(nome);
    }else if (episode >= 10){
      nome = nome.replaceRange(nome.length-4, nome.length, '   ') + episode.toString();
      titleSink.add(nome);
    }else{
      nome = nome.replaceRange(nome.length-3, nome.length, '   ') + episode.toString();
      titleSink.add(nome);
    }
    String mp4;
    ANIMES.Ep(id, episode, lanuage).then((response){
      final episodesVal ep = episodesVal.fromJson(json.decode(response.body)['eps']['eps'][0]);
      if(ep.linkHd == true){
        ANIMES.PlayerUrl(ep.id, 'HD').then((response) async{
          final PPlay url = PPlay.fromJson(jsonDecode(response.body));
          mp4 = url.requestedMP4.url;
          print(mp4);
          vc.setSource(VideoPlayerController.network(mp4));
          vc.initialize();
          vc.play();
        });
      }
      else if(ep.linkSd == true){
        ANIMES.PlayerUrl(ep.id, 'SD').then((response) async{
          final PPlay url = PPlay.fromJson(jsonDecode(response.body));
          mp4 = url.requestedMP4.url;
          print(mp4);
          vc.setSource(VideoPlayerController.network(mp4));
          vc.initialize();
          vc.play();
        });
      }
      else if(ep.linkBg == true){
        ANIMES.PlayerUrl(ep.id, 'BG').then((response) async{
          final PPlay url = PPlay.fromJson(jsonDecode(response.body));
          mp4 = url.requestedMP4.url;
          print(mp4);
          vc.setSource(VideoPlayerController.network(mp4));
          vc.initialize();
          vc.play();
        });
      }
      print('episódio');
      print(episode);
      _saveViews(episode);
    });

  }

  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height+100,
      alignment: Alignment.bottomLeft,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: ep,
        padding: EdgeInsets.only(bottom: 330),
        itemBuilder: (BuildContext context, int index) {
          if(epState != null){
            if(index < epState){
              cardColor = Colors.white.withOpacity(0.6);
              visibility = Icons.visibility_off;
            }
            else{
              cardColor = Colors.white;
              visibility = Icons.visibility;
            }
          }
          return Card(
            color: cardColor,
            child: Stack(
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.play_circle_outline, color: Colors.red,size: 36,),
                      color: Colors.red,
                      onPressed: (){_launchURL(false, (index+1));},
                    ),
                    FlatButton(
                      onPressed: (){_launchURL(false, (index+1));},
                      child: Text('Episódio '+(index+1).toString()),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(visibility, color: Colors.red,size: 32,),
                      color: Colors.black26,
                      onPressed: (){
                        if(visibility == Icons.visibility){
                          _saveViews(index+1);
                        }else{
                          _saveViews(index);
                        }
                      },
                    ),
                  ],
                )

//                FlatButton(
//                  child: Text('Externo',
//                    style: TextStyle(
//                        fontWeight: FontWeight.w400
//                    ),
//                  ),
//                  onPressed: (){
////                    _launchURL(true, (index+1));
//                  },
//                ),
//                IconButton(
//                  icon: Icon(Icons.file_download, color: Colors.red,size: 32,),
//                  color: Colors.black26,
//                  onPressed: (){
//                    String mp4;
//                    ANIMES.Ep(id, (index+1), lanuage).then((response){
//                      final episodesVal ep = episodesVal.fromJson(json.decode(response.body)['eps']['eps'][0]);
//                      if(ep.linkHd == true){
//                        ANIMES.PlayerUrl(ep.id, 'HD').then((response) async{
//                          final PPlay url = PPlay.fromJson(jsonDecode(response.body));
//                          mp4 = url.requestedMP4.url;
//                          print(mp4);
//                          print('Download HD');
//                          print('episódio');
//                          print(index+1);
//                          _saveViews(index+1);
//
//                        });
//                      }
//                      else if(ep.linkSd == true){
//                        ANIMES.PlayerUrl(ep.id, 'SD').then((response) async{
//                          final PPlay url = PPlay.fromJson(jsonDecode(response.body));
//                          mp4 = url.requestedMP4.url;
//                          print(mp4);
//                          print('Download SD');
//                        });
//                      }
//                      else if(ep.linkBg == true){
//                        ANIMES.PlayerUrl(ep.id, 'BG').then((response) async{
//                          final PPlay url = PPlay.fromJson(jsonDecode(response.body));
//                          mp4 = url.requestedMP4.url;
//                          print(mp4);
//                          print('Download BG');
//                        });
//                      }
//
//                    });
//
//
//
////                    print(epState);
//                  },
//                ),

              ],
            ),
          );
        },
      ),
    );
  }
}