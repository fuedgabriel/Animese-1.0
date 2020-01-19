//widget
import '../../widgets/menu.dart';
import 'package:flutter/material.dart';
import 'widgets/content_scroll_list.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

//json
import 'dart:convert';

//request
import 'package:animese/request/ListPage.dart';
import 'package:animese/request/Animes.dart';
import 'package:animese/request/request.dart';






class AnimesScreen extends StatefulWidget {

  @override

  _AnimesScreenState createState() => _AnimesScreenState();
}


class _AnimesScreenState extends State<AnimesScreen> {
  ListAnimePage page;
  var list = new List<ListAnime>();
  var animes = new List<ListAnime>();
  var controller = ScrollController();

  _getAnime(int pag){
    API.getAnimes('', pag).then((response){
      setState(() {
        Map decoded = json.decode(response.body);
        Iterable lista = decoded['docs'];
        list = lista.map((model) => ListAnime.fromJson(model)).toList();
        animes.addAll(list.map((f) => f).toList());

      });
    });
  }



  @override
  void initState() {
    controller.addListener(() {
      if(mounted) {
        if(controller.position.pixels == controller.position.maxScrollExtent){
          pag = pag +1;
          _getAnime(pag);
        }
      }
    });
      super.initState();
      _getAnime(1);
    }


  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }


  @override
  int pag = 1;
  Widget build(BuildContext context) {



    return Scaffold(
        floatingActionButton: SpeedDial(
          animatedIcon: AnimatedIcons.menu_close,
          animatedIconTheme: IconThemeData(size: 22.0),
          // this is ignored if animatedIcon is non null
          // child: Icon(Icons.add),
          curve: Curves.bounceIn,
          overlayColor: Colors.black,
          overlayOpacity: 0.5,
          onOpen: () => print('OPENING DIAL'),
          onClose: () => print('DIAL CLOSED'),
          tooltip: 'Speed Dial',
          heroTag: 'speed-dial-hero-tag',
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 8.0,
          shape: CircleBorder(),
          children: [
            SpeedDialChild(
                child: Icon(Icons.all_inclusive),
                backgroundColor: Colors.red,
                label: 'Ordem alfabética',
                labelStyle: TextStyle(color: Colors.black),
                onTap: () => print('FIRST CHILD')
            ),
            SpeedDialChild(
              child: Icon(Icons.brush),
              backgroundColor: Colors.blue,
              label: 'Lançamento',
              labelStyle: TextStyle(color: Colors.black),
              onTap: () => print('SECOND CHILD'),
            ),
            SpeedDialChild(
              child: Icon(Icons.autorenew),
              backgroundColor: Colors.green,
              label: 'Populares',
              labelStyle: TextStyle(color: Colors.black,),
              onTap: () {

              },
            ),
          ],
        ),
      drawer: MenuWidget(page: 'Lista',),
      appBar: AppBar(
        elevation: 0,
        title: Text("Lista"),
        actions: <Widget>[

          Padding(
            padding: EdgeInsets.all(10.0),
            child: Container(
              width: 36,
              height: 30,
              decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Center(child: Text(animes.length.toString())
              ),
            ),
          ),
        ],
      ),
      body: ContentScroll(images: animes, controller: controller,)

    );
  }
}
