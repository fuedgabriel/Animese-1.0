
//widget
import 'package:flutter/material.dart';
import 'package:flutter_netflix_ui_redesign/widgets/menu.dart';
import '../animes_list/widgets/content_scroll_list.dart';
//rotas
import 'package:flutter_netflix_ui_redesign/request/Animes.dart';
import 'package:flutter_netflix_ui_redesign/request/request.dart';
//json e dados
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';



class Favoritos extends StatefulWidget {
  @override

  _FavoritosState createState() => _FavoritosState();
}


class _FavoritosState extends State<Favoritos> {
  var list = new List<ListAnime>();
  ListAnime lisa;

  get() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List animes = prefs.getStringList('lista');
    for(int i = 0;i < animes.length; i++){
      API.getAnimes(animes[i]).then((response){
        setState(() {
          final json = jsonDecode(response.body);

          lisa = ListAnime.fromJson(json);

          list.add(lisa);
        });
      });
    }

  }

  _FavoritosState() {
    get();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        drawer: MenuWidget(page: 'Favoritos',),
        appBar: AppBar(
          elevation: 0,
          title: Text("Favoritos"),
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
                child: Center(child: Text(list.length.toString())
                ),
              ),
            ),
          ],
        ),
        body: Container(
          child: ContentScroll(images: list,),
        ),
    );
  }
}
