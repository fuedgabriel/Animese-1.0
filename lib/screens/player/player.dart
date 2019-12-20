import 'package:flutter/material.dart';
import 'package:video_box/video.controller.dart';
import 'package:video_box/video_box.dart';
import 'package:video_player/video_player.dart';
import 'package:animese/request/Animes.dart';

import 'globals.dart';

class Pro extends StatefulWidget {
  final ListAnime movie;

  Pro({this.movie});


  @override
  _ProSrcState createState() => _ProSrcState();
}

class _ProSrcState extends State<Pro> {
  List<String> source = [src1, src2, src3];

  int index = 0;

  String get src => source[index];

  VideoController vc;

  @override
  void initState() {
    super.initState();
    vc = VideoController(source: VideoPlayerController.network(src));
  }

  @override
  void dispose() {
    vc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.movie.title),
      ),
      body: ListView(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 16 / 9,
            child: VideoBox(
              controller: vc,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Ep: '+(index+1).toString()+' de '+widget.movie.episodes.toString()+'  '+widget.movie.title,style: TextStyle(color: Colors.white),),
                ),
                Align(
                  alignment: Alignment(0.9, 0),
                  child: IconButton(
                    iconSize: VideoBox.centerIconSize,
                    disabledColor: Colors.white60,
                    icon: Icon(Icons.skip_next),
                    onPressed: () {
                      var newindex = index + 1;
                      if (newindex >= source.length) {
                        newindex = 0;
                      }
                      setState(() {
                        index = newindex;
                      });
                      vc.setSource(VideoPlayerController.network(src));
                    },
                  ),
                ),
                Align(
                  alignment: Alignment(-0.9, 0),
                  child: IconButton(
                    iconSize: VideoBox.centerIconSize,
                    disabledColor: Colors.white60,
                    icon: Icon(Icons.skip_previous),
                    onPressed: () {
                      var newindex = index - 1;
                      if (newindex < 0) {
                        newindex = source.length - 1;
                      }
                      setState(() {
                        index = newindex;
                      });
                      vc.setAutoplay(true);
                      vc.showVideoCtrl(true);
                      vc.setSource(VideoPlayerController.network(src));
                    },
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: <Widget>[
              ExpansionTile(
                leading: Icon(Icons.movie),
                title: Text('Temporada '+widget.movie.seasons.toString()),
                children: <Widget>[
                  Divider(),
                  ListTile(title: Text('Ep 01'),
                    onTap: (){
                      vc.setSource(VideoPlayerController.network(src1));
                    },),
                  Divider(),
                  ListTile(title: Text('Ep 02'),
                    onTap: (){
                      setState(() {
                        index = 2;
                      });
                      vc.setSource(VideoPlayerController.network(src2));
                    },),
                  Divider(),
                  ListTile(title: Text('Ep 03'),
                    onTap: (){
                      vc.setSource(VideoPlayerController.network(src3));
                    },),
                  Divider(),
                  ListTile(title: Text('Ep 04'),
                    onTap: (){
                    },),
                  Divider(),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}