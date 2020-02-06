import 'package:flutter/material.dart';
import 'package:video_box/video.controller.dart';
import 'package:video_box/video_box.dart';
import 'package:video_player/video_player.dart';
// import 'package:flutter_android_pip/flutter_android_pip.dart';

//request
import 'package:http/http.dart' as http;
import 'package:animese/request/Animes.dart';
import 'package:animese/request/Videos.dart';
import 'package:shared_preferences/shared_preferences.dart';
//external
import 'package:mx_player_plugin/mx_player_plugin.dart';

class PipPage extends StatefulWidget {

  final ListAnime movie;
  final List<ListVideo> videos;

  PipPage({this.movie, this.videos});

  @override
  _PipPageState createState() => _PipPageState();
}

class _PipPageState extends State<PipPage> with WidgetsBindingObserver {
  VideoController vc;
  List<ListVideo> video;

  int index = 0;
  double opacidade = 1;
  Icon icone = Icon(Icons.visibility);
  bool loading = true;
  int episode;

  String src = 'https://r1---sn-5hnekn7z.googlevideo.com/videoplayback?expire=1580844428&ei=DFU5Xq6_OKLw8gTr8IKYBQ&ip=167.114.102.170&id=1a15cd2ac9d9550f&itag=18&source=blogger&susc=bl&mime=video/mp4&dur=1469.916&lmt=1349045872892881&sparams=expire,ei,ip,id,itag,source,susc,mime,dur,lmt&sig=ALgxI2wwRQIgfJaehXWpCav_O5AoN_oeugvqraSAdI0kcCfLWsc2u_4CIQCo1p2-bOw8kD65xNVMCRSeluMsB1n5bShvaX6Xv9k6YA%3D%3D&redirect_counter=1&cm2rm=sn-aigeze7e&req_id=f91049c42a37a3ee&cms_redirect=yes&mip=187.13.0.150&mm=34&mn=sn-5hnekn7z&ms=ltu&mt=1580815342&mv=D&mvi=0&pl=0&lsparams=mip,mm,mn,ms,mv,mvi,pl&lsig=AHylml4wRAIgHe1bIvRkk6YZ_4eo87p0apNZNUWQeXAnYQ-Ddt_bWD4CIDSf_5xQ9Wa-Ua7e0zoR38WdA_B-_2c1s_UmRQKsxL4q';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    vc = VideoController(
        source: VideoPlayerController.network(src),
        autoplay: true,
        controllerWidgets: true
    )..initialize();
  }
  void _changeSource(String src) async {

    vc.setSource(VideoPlayerController.network(src));
    vc.initialize();
  }


  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    vc?.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        print('O aplicativo é visível e responde à entrada do usuário。');
        break;
      case AppLifecycleState.inactive:
        print('Aplicativo inativo');
        // click home
        if (vc != null && vc.value.isPlaying) {
          // FlutterAndroidPip.enterPictureInPictureMode;
        }
        break;
      case AppLifecycleState.paused:
        print('Atualmente, o usuário não está vendo o aplicativo e não está respondendo');
        break;
      case AppLifecycleState.detached:
        print('O aplicativo será suspenso.');
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: VideoBox(
              controller: vc,
              children: <Widget>[
                Align(
                  alignment: Alignment(-0.5, -0.8),
                  child: Text((widget.videos[0].episode).toString() + ' de ' + widget.movie.episodes.toString() + '  ' + widget.movie.title.toString(),),
                ),
                Align(
                    alignment: Alignment(-0.9, -0.85),
                    child: IconButton(
                        icon: Icon(Icons.arrow_back),
                        onPressed: (){
                          Navigator.pop(context);
                        }
                    )
                ),
                Align(
                  alignment: Alignment(-0.5, 0),
                  child: IconButton(
                    iconSize: 40,
                    disabledColor: Colors.white60,
                    icon: Icon(Icons.skip_previous),
                    onPressed: (){},
                  ),
                ),
                Align(
                  alignment: Alignment(0.5, 0),
                  child: IconButton(
                    iconSize: 40,
                    disabledColor: Colors.white60,
                    icon: Icon(Icons.skip_next),
                    onPressed: (){},
                  ),
                ),
              ],
            ),
          ),
          Padding(padding: EdgeInsets.all(3.5)),
          Container(
              width: double.maxFinite,
              height: height-280,
              child: Stack(
                children: <Widget>[
                  ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: widget.videos.length,
                    itemBuilder: (BuildContext context, int index ){
                      return Container(
                          height: 50,
                          child: Stack(
                            children: <Widget>[
                              Card(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    IconButton(
                                      icon: Icon(Icons.play_circle_outline),
                                      onPressed: () async{
                                        SharedPreferences prefs = await SharedPreferences.getInstance();
                                        prefs.setInt(widget.movie.title, index);
                                        print((widget.videos[index].url));
                                        vc.autoplay = true;
                                        vc.setSource(VideoPlayerController.network('http://media.papepi.club/?kissmegoodbye=AD6v5dyXDyU80z5LF5DMECKhT41eS_SFbLKFX0WBsJT_7yZO0B-1HAG-gTF0f79iimp8Nfl7Lb0OePyWPTGmJgA_raDro1KifwkZV1h3Y7oiISr9aWGP-dfK7EDVJrqzWacTaHaun5U'));
                                        vc.initialize();

//                                        Navigator.push(
//                                          context,
//                                          MaterialPageRoute(
//                                            builder: (context) => PipPage(movie: widget.movie,videos: widget.videos, ),
//                                          ),
//                                        );
//                                        _changeSource(widget.videos[index].url);
//                                        setState(() {
//                                          src = widget.videos[index].url;
//                                          vc.setSource(VideoPlayerController.network(src));
//                                          vc.initialize();
//                                        });
//                                    _changeSource(widget.videos[index].url);

                                      },
                                    ),
                                    Text('  Episódio '+(index+1).toString()),
                                  ],
                                ),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  FlatButton(
                                    child: Text('Externo'),
                                    onPressed: (){},

                                  ),
                                  IconButton(
                                    icon: Icon(Icons.file_download),
                                    onPressed: (){
                                    },
                                  ),
                                ],
                              )
                            ],
                          )
                      );
                    },
                  ),
                ],
              )
          )
        ],
      ),
    );
  }
}
