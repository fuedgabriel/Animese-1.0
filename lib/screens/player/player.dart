//widget
import 'package:flutter/material.dart';
import 'package:video_box/video.controller.dart';
import 'package:video_box/video_box.dart';
import 'package:video_player/video_player.dart';

//request
import 'package:animese/request/Animes.dart';
import 'package:animese/request/Videos.dart';
import 'package:shared_preferences/shared_preferences.dart';
//external
import 'package:mx_player_plugin/mx_player_plugin.dart';

class Pro extends StatefulWidget {
  final ListAnime movie;
  final List<ListVideo> videos;

  Pro({this.movie, this.videos});

  @override
  _ProSrcState createState() => _ProSrcState();
}

class _ProSrcState extends State<Pro> {
  List<ListVideo> video;
  int index = 0;
  double opacidade = 1;
  Icon icone = Icon(Icons.visibility);
  VideoController vc;
  bool loading = true;
  int episode;

  @override
  void initState() {
    super.initState();
    vc = VideoController(
      source: VideoPlayerController.network(''),
      autoplay: true,
      controllerWidgets: true,
    );
  }

  continuar() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int episodio = prefs.getInt(widget.movie.title);
    if(episodio == null){
      setState(() {
        episode = 0;
      });
      vc.setAutoplay(true);
      vc.autoplay;
      vc.setSource(VideoPlayerController.network(widget.videos[episode].url));

    }
    else{
      setState(() {
        episode = episodio;
      });
      vc.setAutoplay(true);
      vc.autoplay;
      vc.setSource(VideoPlayerController.network(widget.videos[episode].url));
    }
  }
  _ProSrcState(){
    continuar();
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
                      padding: const EdgeInsets.only(left: 200, right: 5, top: 5),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          IconButton(
                            iconSize: 30,
                            disabledColor: Colors.white60,
                            icon: icone,
                            onPressed: () {
                              setState(() {
                                if(opacidade == 1){
                                  opacidade = 0;
                                  icone = Icon(Icons.visibility_off);
                                }
                                else{
                                  opacidade = 1;
                                  icone = Icon(Icons.visibility);
                                }

                              });
                            },
                          ),
                        ],
                      ),
                    ),
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
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment(0.9, 0),
                      child: IconButton(
                        iconSize: VideoBox.centerIconSize,
                        disabledColor: Colors.white60,
                        icon: Icon(Icons.skip_next),
                        onPressed: () async{
                          setState(() {
                            episode = episode + 1;
                          });
                          SharedPreferences prefs = await SharedPreferences.getInstance();
                          prefs.setInt(widget.movie.title, episode);

                          vc.setAutoplay(true);
                          vc.autoplay;
                          print(widget.videos[episode].url);
                          vc.setSource(VideoPlayerController.network(
                              widget.videos[episode].url));
                        },
                      ),
                    ),
                    Align(
                      alignment: Alignment(-0.9, 0),
                      child: IconButton(
                        iconSize: VideoBox.centerIconSize,
                        disabledColor: Colors.white60,
                        icon: Icon(Icons.skip_previous),
                        onPressed: () async{
                          setState(() {
                            episode = episode - 1;
                          });
                          SharedPreferences prefs = await SharedPreferences.getInstance();
                          prefs.setInt(widget.movie.title, episode);
                          vc.setAutoplay(true);
                          vc.setSource(VideoPlayerController.network(widget.videos[episode].url));
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Opacity(
                opacity: opacidade,
                child: Padding(
                  padding: EdgeInsets.only(left: 50, top: 24),
                  child: Text(
                    'Ep: ' + (widget.videos[episode].episode).toString() + ' de ' + widget.movie.episodes.toString() + '  ' + widget.movie.title,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
          Stack(
            children: <Widget>[
              Container(
                height: (height - 200),
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: widget.videos.length,
                    // ignore: non_constant_identifier_names
                    itemBuilder: (BuildContext, int conta) {
                      return Stack(
                        children: <Widget>[
                          Container(
                            height: 90,
                            child: Card(
                              elevation: 5,
                              child: Row(
                                children: <Widget>[
                                  Padding(
                                      padding: EdgeInsets.only(left: 6),
                                      child: GestureDetector(
                                        child: Stack(
                                          children: <Widget>[
                                            Image(
                                              image: NetworkImage('https://3.bp.blogspot.com/-2bwBfYvt0Rk/WDM-lfH574I/AAAAAAAABos/Jb4MauEsi8072H-4IOy5b4y9Joi_ia5_ACLcB/s1600/Untitled.png'),
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
                                        onTap: () async{
                                          setState(() {
                                            episode = conta;
                                          });
                                          SharedPreferences prefs = await SharedPreferences.getInstance();
                                          prefs.setInt(widget.movie.title, conta);

                                          vc.setAutoplay(true);
                                          vc.setSource(VideoPlayerController.network(widget.videos[conta].url));
                                        },
                                      )),
                                  Padding(
                                    padding: EdgeInsets.only(top: 10, left: 5),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Opacity(
                                            opacity: 0.8,
                                            child: Padding(
                                              padding: EdgeInsets.only(top: 5),
                                              child: Text(
                                                'Episódio ' + widget.videos[conta].episode.toString() + '   ',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                    fontStyle: FontStyle.italic
                                                ),
                                              ),
                                            )),
                                        Opacity(
                                            opacity: 0.6,
                                            child: Padding(
                                              padding: EdgeInsets.only(top: 5),
                                              child: Text(
                                                widget.movie.air.toString().replaceAll('T00:00:00.000Z', ''),
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
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      FlatButton(
                                        child: Text(
                                          'Externo',
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.normal,
                                              fontStyle: FontStyle.italic),
                                        ),
                                        onPressed: () {
                                          showGeneralDialog(
                                              barrierColor:
                                                  Colors.black.withOpacity(0.2),
                                              transitionBuilder:
                                                  (context, a1, a2, widgett) {
                                                return Transform.scale(
                                                  scale: a1.value,
                                                  child: AlertDialog(
                                                    actions: <Widget>[
                                                      FlatButton(
                                                        child: Row(
                                                          children: <Widget>[
                                                            Image(
                                                              image: AssetImage(
                                                                  'assets/logos/vlc.png'),
                                                              height: 24,
                                                              width: 24,
                                                            ),
                                                            Text(' VLC')
                                                          ],
                                                        ),
                                                        onPressed: () async {
                                                          await PlayerPlugin.openWithVlcPlayer(widget.videos[conta].url);
                                                        },
                                                      ),
//                                                      FlatButton(
//                                                        child: Row(
//                                                          children: <Widget>[
//                                                            Image(
//                                                              image: AssetImage(
//                                                                  'assets/logos/mxplayer.png'),
//                                                              height: 24,
//                                                              width: 24,
//                                                            ),
//                                                            Text(' MX Player')
//                                                          ],
//                                                        ),
//                                                        onPressed: () async {
//                                                          await PlayerPlugin.openWithMxPlayer(widget.videos[conta].url, '');
//                                                        },
//                                                      ),
//                                                      FlatButton(
//                                                        child: Row(
//                                                          children: <Widget>[
//                                                            Icon(Icons
//                                                                .file_download),
//                                                            Text(' Download')
//                                                          ],
//                                                        ),
//                                                        onPressed: () async{
//                                                          final taskId = await FlutterDownloader.enqueue(
//                                                            url: widget.videos[conta].url,
//                                                            savedDir: 'the path of directory where you want to save downloaded files',
//                                                            showNotification: true, // show download progress in status bar (for Android)
//                                                            openFileFromNotification: true, // click on notification to open downloaded file (for Android)
//                                                          );
//
//
//
//
//                                                        },
//                                                      ),
                                                      FlatButton(
                                                        child: Row(
                                                          children: <Widget>[
                                                            Icon(Icons
                                                                .arrow_back),
                                                            Text(' Voltar')
                                                          ],
                                                        ),
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                      ),
                                                    ],
                                                    shape: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    30.0)),
                                                    title: Text(
                                                      'Escolha uma opção: ',
                                                      style: TextStyle(
                                                        fontSize: 15.6,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                              transitionDuration:
                                                  Duration(milliseconds: 500),
                                              barrierDismissible: false,
                                              barrierLabel: '',
                                              context: context,
                                              pageBuilder: (context, animation1,
                                                  animation2) {
                                                var a;
                                                return a;
                                              });
                                        },
                                      ),
                                    ],
                                  )
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
