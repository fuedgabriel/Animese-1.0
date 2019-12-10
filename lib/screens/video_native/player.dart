
import 'package:flutter/material.dart';
import 'video_player_demo.dart';
import 'videos.dart';
import 'change_video_src.dart';
import 'list_video.dart';
import 'one_video_ctrl.dart';
import 'pro.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/oneVideoCtrl': (BuildContext context) => OneVideoCtrl(),
        '/listVideo': (BuildContext context) => ListVideo(),
        '/change_video_src': (BuildContext context) => ChangeVideoSrc(),
        '/videos': (BuildContext context) => Videos(),
        '/pro': (BuildContext context) => Pro(),
        VideoPlayerDemo.routeName: (BuildContext context) => VideoPlayerDemo(),
      },
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('video_box example'),
      ),
      body: Center(
        child: IntrinsicWidth(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              RaisedButton(
                child: Text('one video ctrl'),
                onPressed: () {
                  Navigator.of(context).pushNamed('/oneVideoCtrl');
                },
              ),
              RaisedButton(
                child: Text('list video'),
                onPressed: () {
                  Navigator.of(context).pushNamed('/listVideo');
                },
              ),
              RaisedButton(
                child: Text('change video src'),
                onPressed: () {
                  Navigator.of(context).pushNamed('/change_video_src');
                },
              ),
              RaisedButton(
                child: Text('videos'),
                onPressed: () {
                  Navigator.of(context).pushNamed('/videos');
                },
              ),
              RaisedButton(
                child: Text('VideoPlayerDemo'),
                onPressed: () {
                  Navigator.of(context).pushNamed(VideoPlayerDemo.routeName);
                },
              ),
              RaisedButton(
                child: Text('Pro'),
                onPressed: () {
                  Navigator.of(context).pushNamed('/pro');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}