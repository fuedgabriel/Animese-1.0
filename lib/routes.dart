
import 'widgets/menu.dart';
import 'package:flutter_netflix_ui_redesign/screens/movie/movie_screen.dart';
import 'package:flutter/material.dart';
import 'screens/suporte_anime/suporteAnime.dart';

class Routes {
  static menu(String pagina){
    return new MenuWidget(page: pagina);
  }

  static movieScreenR(movies,int index){

    return new MovieScreen(movie: movies[index]);

  }
  static suporteAnimeScreenR(movies){
    return new SuporteAnime(movieA: movies);

  }

}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}