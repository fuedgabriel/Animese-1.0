import 'package:flutter/material.dart';
import 'package:video_box/video.controller.dart';
import 'package:video_box/video_box.dart';
import 'package:video_player/video_player.dart';

import 'globals.dart';

class pro extends StatefulWidget {
  final String title;
  final String ep;
  pro({this.title, this.ep});


  @override
  _proSrcState createState() => _proSrcState();
}

class _proSrcState extends State<pro> {
  List<String> source = [src1, src2, src3];

  int index = 0;

  String get src => source[index];

  VideoController vc;

  @override
  void initState() {
    super.initState();
    vc = VideoController(source: VideoPlayerController.network(src))
      ..initialize();
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
        title: Text('change src'),
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
                  child: Text('Ep: '+(index+1).toString()+' de '+widget.ep+'  '+widget.title,style: TextStyle(color: Colors.white),),
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
                      vc.initialize();
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
                      vc.setAutoplay(false);
                      vc.showVideoCtrl(true);
                      vc.setSource(VideoPlayerController.network(src));
                      vc.initialize();
                    },
                  ),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}