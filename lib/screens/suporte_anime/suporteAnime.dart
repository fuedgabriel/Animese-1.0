import 'package:flutter/material.dart';
import 'package:flutter_netflix_ui_redesign/widgets/menu.dart';
import '../movie/models/movie_model.dart';


class suporteAnime extends StatefulWidget {
  final Movie movie;
  suporteAnime({this.movie});
  @override
  _suporteAnime createState() => _suporteAnime();

}

class _suporteAnime extends State<suporteAnime> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: new MenuWidget(page: 'suporteAnime'),
      appBar: AppBar(
        title: Text('Suporte'),
      ),
    );
  }
}
