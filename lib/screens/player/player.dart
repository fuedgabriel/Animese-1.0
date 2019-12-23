import 'package:flutter/material.dart';
import 'package:video_box/video.controller.dart';
import 'package:video_box/video_box.dart';
import 'package:video_player/video_player.dart';
import 'package:animese/request/Animes.dart';
import 'package:animese/request/Videos.dart';
import 'globals.dart';
import 'widget/tile.dart';

class Pro extends StatefulWidget {
  final ListAnime movie;
  final List<ListVideo> videos;

  Pro({this.movie, this.videos});

  @override
  _ProSrcState createState() => _ProSrcState();
}

class _ProSrcState extends State<Pro> {
  List<String> source = [src1, src2, src3];

  List<ListVideo> video;
  int index = 0;

  String get src => source[index];

  VideoController vc;
  bool loading = true;
  var episode;

  @override
  void initState() {
    super.initState();
    episode = 0;
    vc = VideoController(
      source: VideoPlayerController.network(widget.videos[episode].url),
      autoplay: true,
      controllerWidgets: true
    );

  }

  @override
  void dispose() {
    vc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              AspectRatio(
                aspectRatio: 16 / 9,
                child: VideoBox(
                  controller: vc,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget>[
                          IconButton(
                            iconSize: 24,
                            disabledColor: Colors.white60,
                            icon: Icon(Icons.arrow_back),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          Text(
                            'Ep: ' +
                                (episode + 1).toString() +
                                ' de ' +
                                widget.movie.episodes.toString() +
                                '  ' +
                                widget.movie.title,
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
//                    Align(
//                      alignment: Alignment(0.9, -0.9),
//                      child: IconButton(
//                        iconSize: VideoBox.centerIconSize,
//                        disabledColor: Colors.white60,
//                        icon: Icon(Icons.swap_horiz, size: 32,),
//                        onPressed: () {
//                        },
//                      ),
//                    ),
                    Align(
                      alignment: Alignment(0.9, 0),
                      child: IconButton(
                        iconSize: VideoBox.centerIconSize,
                        disabledColor: Colors.white60,
                        icon: Icon(Icons.skip_next),
                        onPressed: () {
                          print(episode);
                          episode=episode+1;
                          print(widget.videos[episode].url);
                          print(episode);
//                          vc.dispose();
                          vc.setAutoplay(true);
                          vc.showVideoCtrl(true);
                          vc.autoplay;
                          print(widget.videos[episode].url);
                          vc.setSource(VideoPlayerController.network(widget.videos[episode].url));
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
                          episode=episode-1;
                          vc.setAutoplay(true);
                          vc.showVideoCtrl(true);
                          vc.setSource(VideoPlayerController.network(widget.videos[episode].url));
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Stack(
            children: <Widget>[
              Container(
                height: (height - 170),
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: widget.videos.length,
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
                                              padding: EdgeInsets.only(
                                                  top: 10, left: 5),
                                              child: Icon(
                                                Icons.play_circle_outline,
                                                size: 32,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                        onTap: () {
                                          episode = conta;
                                          vc.setAutoplay(true);
                                          vc.showVideoCtrl(true);
                                          vc.setSource(VideoPlayerController.network(widget.videos[conta].url));
                                        },
                                      )),
                                  Padding(
                                    padding: EdgeInsets.only(top: 10, left: 5),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Opacity(
                                            opacity: 0.8,
                                            child: Padding(
                                              padding: EdgeInsets.only(top: 5),
                                              child: Text(
                                                'Episódio ' +
                                                    widget.videos[conta].episode.toString() +
                                                    '   ',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                    fontStyle:
                                                        FontStyle.italic),
                                              ),
                                            )),
                                        Opacity(
                                            opacity: 0.6,
                                            child: Padding(
                                              padding: EdgeInsets.only(top: 5),
                                              child: Text(
                                                widget.movie.air
                                                    .toString()
                                                    .replaceAll(
                                                        'T00:00:00.000Z', ''),
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.bold,
                                                    fontStyle:
                                                        FontStyle.italic),
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
                                        padding:
                                            EdgeInsets.only(top: 20, left: 12),
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
              ),
//              ContentScroll(
//                images: widget.videos,
//                movies: widget.movie,
//              ),
            ],
          ),
        ],
      ),
    );
  }
}
