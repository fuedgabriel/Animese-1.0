import 'package:flutter/material.dart';
import 'package:video_box/video.controller.dart';
import 'package:video_box/video_box.dart';
import 'package:video_player/video_player.dart';
// import 'package:flutter_android_pip/flutter_android_pip.dart';

//request
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

  String src = 'https://r1---sn-gpv7eney.googlevideo.com/videoplayback?expire=1580125624&ei=OF0uXs3rCMHMgwO40IfADw&ip=167.114.102.170&id=e9162718d58a74d5&itag=18&source=blogger&susc=bl&mime=video/mp4&dur=1422.616&lmt=1362184632899569&sparams=expire,ei,ip,id,itag,source,susc,mime,dur,lmt&sig=ALgxI2wwRQIhAOa3vjuTFgTCcrsZUm_A_ogqZXPoJULiRuFIO7t1ww2oAiAeb88wEc95JZQkV8k0qtlDIu_WhYnZgcirgCHWWrgU3Q%3D%3D&redirect_counter=1&rm=sn-p5qe777s&req_id=7d3e1aa4640ea3ee&cms_redirect=yes&ipbypass=yes&mip=186.233.112.13&mm=31&mn=sn-gpv7eney&ms=au&mt=1580096714&mv=m&mvi=0&pl=21&lsparams=ipbypass,mip,mm,mn,ms,mv,mvi,pl&lsig=AHylml4wRAIgXnShwGcNZXUItcUqAEeIsGW8eL6ow4U-KTPUSqKPRncCID3EwxC979utyplJ-fRlFMg_p9SF1cSXM1L4nF_Bj2Kc';

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
        print('用户当前看不到应用程序，没有响应');
        break;
      case AppLifecycleState.detached:
        print('应用程序将暂停。');
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
            height: height-209.5,
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
                                    setState(() {
                                      src = widget.videos[index].url;
                                      vc.setSource(VideoPlayerController.network(src));
                                      vc.initialize();
                                    });
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
